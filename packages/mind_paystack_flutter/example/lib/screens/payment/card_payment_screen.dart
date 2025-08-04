import 'package:example/app_colors.dart';
import 'package:example/services/payment_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mind_paystack_flutter/mind_paystack_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardPaymentScreen extends StatefulWidget {
  const CardPaymentScreen({super.key});

  @override
  State<CardPaymentScreen> createState() => _CardPaymentScreenState();
}

class _CardPaymentScreenState extends State<CardPaymentScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final PaymentService _paymentService = PaymentService();

  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _cardHolderController = TextEditingController();

  double amount = 0.0;
  String email = '';
  bool _isProcessing = false;
  String _errorMessage = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Get route arguments if available
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (args != null) {
      setState(() {
        amount = args['amount'] ?? 0.0;
        email = args['email'] ?? '';
      });
    }
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    _cardHolderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final cardBgColor = isDarkMode ? const Color(0xFF1E1E1E) : Colors.white;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(
              FontAwesomeIcons.creditCard,
              size: 20,
              color: AppColors.primaryBlue,
            ),
            const SizedBox(width: 10),
            Text(
              'Card Payment',
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Payment Info Card
            Container(
              padding: const EdgeInsets.all(20),
              color: cardBgColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '💲 Total Amount',
                        style: GoogleFonts.nunito(
                          fontSize: 14,
                          color:
                              isDarkMode ? Colors.grey[400] : Colors.grey[600],
                        ),
                      ),
                      Text(
                        '₦${amount.toStringAsFixed(2)}',
                        style: GoogleFonts.nunito(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryBlue,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.shieldHalved,
                          size: 14,
                          color: AppColors.primaryBlue,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '🔒 Secured Payment',
                          style: GoogleFonts.nunito(
                            color: AppColors.primaryBlue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Error message if any
            if (_errorMessage.isNotEmpty)
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red.shade100,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.red.shade200),
                ),
                child: Row(
                  children: [
                    const FaIcon(FontAwesomeIcons.circleExclamation,
                        color: Colors.red, size: 16),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        _errorMessage,
                        style: GoogleFonts.nunito(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),

            // Credit card form
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Card preview
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primaryBlue.withOpacity(0.2),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          color: AppColors.primaryBlue,
                          child: Container(
                            width: double.infinity,
                            height: 200,
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    FaIcon(
                                      FontAwesomeIcons.ccVisa,
                                      color: Colors.white,
                                      size: 32,
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _cardNumberController.text.isEmpty
                                          ? '•••• •••• •••• ••••'
                                          : _formatCardNumber(
                                              _cardNumberController.text),
                                      style: GoogleFonts.nunito(
                                        color: Colors.white,
                                        fontSize: 22,
                                        letterSpacing: 2,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'CARD HOLDER',
                                              style: GoogleFonts.nunito(
                                                color: Colors.white70,
                                                fontSize: 12,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              _cardHolderController.text.isEmpty
                                                  ? 'YOUR NAME'
                                                  : _cardHolderController.text
                                                      .toUpperCase(),
                                              style: GoogleFonts.nunito(
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'EXPIRES',
                                              style: GoogleFonts.nunito(
                                                color: Colors.white70,
                                                fontSize: 12,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              _expiryDateController.text.isEmpty
                                                  ? 'MM/YY'
                                                  : _expiryDateController.text,
                                              style: GoogleFonts.nunito(
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      Text(
                        '💳 Card Details',
                        style: GoogleFonts.nunito(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryBlue,
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Card number field
                      TextFormField(
                        controller: _cardNumberController,
                        style: GoogleFonts.nunito(),
                        decoration: InputDecoration(
                          labelText: 'Card Number',
                          hintText: '1234 5678 9012 3456',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: AppColors.primaryBlue.withOpacity(0.3),
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(16),
                          prefixIconConstraints:
                              const BoxConstraints(minWidth: 45, minHeight: 45),
                          prefixIcon: Container(
                            margin: const EdgeInsets.only(left: 12, right: 8),
                            child: FaIcon(
                              FontAwesomeIcons.creditCard,
                              size: 18,
                              color: AppColors.primaryBlue.withOpacity(0.7),
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(16),
                          _CardNumberFormatter(),
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter card number';
                          }
                          if (value.replaceAll(' ', '').length < 16) {
                            return 'Please enter a valid 16-digit card number';
                          }
                          return null;
                        },
                        onChanged: (_) => setState(() {}),
                      ),

                      const SizedBox(height: 16),

                      // Expiry date and CVV
                      Row(
                        children: [
                          // Expiry date field
                          Expanded(
                            child: TextFormField(
                              controller: _expiryDateController,
                              style: GoogleFonts.nunito(),
                              decoration: InputDecoration(
                                labelText: 'Expiry Date',
                                hintText: 'MM/YY',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color:
                                        AppColors.primaryBlue.withOpacity(0.3),
                                  ),
                                ),
                                contentPadding: const EdgeInsets.all(16),
                                prefixIconConstraints: const BoxConstraints(
                                    minWidth: 45, minHeight: 45),
                                prefixIcon: Container(
                                  margin:
                                      const EdgeInsets.only(left: 12, right: 8),
                                  child: FaIcon(
                                    FontAwesomeIcons.calendar,
                                    size: 18,
                                    color:
                                        AppColors.primaryBlue.withOpacity(0.7),
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(4),
                                _ExpiryDateFormatter(),
                              ],
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter expiry date';
                                }
                                if (value.length < 5) {
                                  return 'Please enter a valid date';
                                }
                                return null;
                              },
                              onChanged: (_) => setState(() {}),
                            ),
                          ),

                          const SizedBox(width: 16),

                          // CVV field
                          Expanded(
                            child: TextFormField(
                              controller: _cvvController,
                              style: GoogleFonts.nunito(),
                              decoration: InputDecoration(
                                labelText: 'CVV',
                                hintText: '123',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color:
                                        AppColors.primaryBlue.withOpacity(0.3),
                                  ),
                                ),
                                contentPadding: const EdgeInsets.all(16),
                                prefixIconConstraints: const BoxConstraints(
                                    minWidth: 45, minHeight: 45),
                                prefixIcon: Container(
                                  margin:
                                      const EdgeInsets.only(left: 12, right: 8),
                                  child: FaIcon(
                                    FontAwesomeIcons.lock,
                                    size: 18,
                                    color:
                                        AppColors.primaryBlue.withOpacity(0.7),
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(3),
                              ],
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter CVV';
                                }
                                if (value.length < 3) {
                                  return 'CVV must be 3 digits';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Card holder field
                      TextFormField(
                        controller: _cardHolderController,
                        style: GoogleFonts.nunito(),
                        decoration: InputDecoration(
                          labelText: 'Card Holder Name',
                          hintText: 'John Doe',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: AppColors.primaryBlue.withOpacity(0.3),
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(16),
                          prefixIconConstraints:
                              const BoxConstraints(minWidth: 45, minHeight: 45),
                          prefixIcon: Container(
                            margin: const EdgeInsets.only(left: 12, right: 8),
                            child: FaIcon(
                              FontAwesomeIcons.user,
                              size: 18,
                              color: AppColors.primaryBlue.withOpacity(0.7),
                            ),
                          ),
                        ),
                        textCapitalization: TextCapitalization.words,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter cardholder name';
                          }
                          return null;
                        },
                        onChanged: (_) => setState(() {}),
                      ),

                      const SizedBox(height: 24),

                      // Test card info
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.amber.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Test Card Details:',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 4),
                            Text('Card Number: 4084 0840 8408 4081'),
                            Text('CVV: 408'),
                            Text('Expiry: Any future date (e.g., 04/25)'),
                            Text('PIN: 0000 (if prompted)'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Pay button
            Container(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(56),
                  backgroundColor: AppColors.primaryBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: _isProcessing ? null : _processPayment,
                child: _isProcessing
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          ),
                          SizedBox(width: 16),
                          Text('Processing...', style: TextStyle(fontSize: 18))
                        ],
                      )
                    : Text(
                        'Pay ₦${amount.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 18),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatCardNumber(String input) {
    final digitsOnly = input.replaceAll(' ', '');
    final formatted = StringBuffer();

    for (var i = 0; i < digitsOnly.length; i++) {
      if (i > 0 && i % 4 == 0) {
        formatted.write(' ');
      }
      formatted.write(digitsOnly[i]);
    }

    return formatted.toString();
  }

  void _processPayment() async {
    // Validate form
    if (formKey.currentState?.validate() != true) {
      setState(() {
        _errorMessage = 'Please complete card details correctly';
      });
      return;
    }

    // Extract month and year from expiry date
    final List<String> expiryParts = _expiryDateController.text.split('/');
    if (expiryParts.length != 2) {
      setState(() {
        _errorMessage = 'Invalid expiry date format';
      });
      return;
    }

    final String expiryMonth = expiryParts[0];
    final String expiryYear = '20${expiryParts[1]}'; // Convert YY to 20YY

    // Check if amount and email are valid
    if (amount <= 0 || email.isEmpty) {
      setState(() {
        _errorMessage =
            'Invalid payment details. Amount: $amount, Email: $email';
      });
      return;
    }

    // Clear any previous errors
    setState(() {
      _errorMessage = '';
      _isProcessing = true;
    });

    try {
      // Process payment
      final result = await _paymentService.processCardPayment(
        cardNumber: _cardNumberController.text.replaceAll(' ', ''),
        cvv: _cvvController.text,
        expiryMonth: expiryMonth,
        expiryYear: expiryYear,
        amount: amount,
        email: email,
      );

      // Handle response
      if (result.status == 'success') {
        // Payment successful - go to success screen
        if (mounted) {
          Navigator.pushReplacementNamed(
            context,
            '/payment-success',
            arguments: {
              'amount': amount,
              'reference': result.reference,
              'paymentMethod': 'card',
            },
          );
        }
      } else if (result.status == 'pending') {
        // Payment requires further action (like OTP)
        if (mounted) {
          // In a real app, you would handle 3D Secure or OTP verification
          // For the demo, we'll simulate success
          Navigator.pushReplacementNamed(
            context,
            '/payment-success',
            arguments: {
              'amount': amount,
              'reference': result.reference,
              'paymentMethod': 'card',
            },
          );
        }
      } else {
        // Payment failed
        setState(() {
          _isProcessing = false;
          _errorMessage =
              'Payment failed: ${result.message ?? 'Unknown error'}';
        });
      }
    } on MindException catch (e) {
      // Handle SDK-specific exceptions
      setState(() {
        _isProcessing = false;
        _errorMessage = 'Payment error: ${e.message}';
      });
    } catch (e) {
      // Handle general exceptions
      setState(() {
        _isProcessing = false;
        _errorMessage = 'An unexpected error occurred: $e';
      });
    }
  }
}

class _CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final text = newValue.text.replaceAll(' ', '');
    final buffer = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      if ((i + 1) % 4 == 0 && i != text.length - 1) {
        buffer.write(' ');
      }
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}

class _ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final text = newValue.text.replaceAll('/', '');
    final buffer = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      if (i == 1 && i != text.length - 1) {
        buffer.write('/');
      }
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}
