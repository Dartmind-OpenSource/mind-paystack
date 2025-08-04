import 'package:flutter/material.dart';
import 'package:example/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String _selectedMethod = 'card';
  bool _isProcessing = false;

  @override
  void dispose() {
    _amountController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(
              FontAwesomeIcons.moneyBillTransfer,
              size: 20,
              color: AppColors.primaryBlue,
            ),
            const SizedBox(width: 10),
            Text(
              'Select Payment Method',
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Information card
              Container(
                decoration: BoxDecoration(
                  color: isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: isDarkMode
                          ? Colors.black.withOpacity(0.2)
                          : Colors.grey.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.circleInfo,
                            size: 18,
                            color: AppColors.primaryBlue,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '💰 Payment Details',
                            style: GoogleFonts.nunito(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryBlue,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '✏️ Enter the payment amount and email to continue.',
                        style: GoogleFonts.nunito(
                          color:
                              isDarkMode ? Colors.grey[400] : Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Amount input
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                style: GoogleFonts.nunito(),
                decoration: InputDecoration(
                  labelText: 'Amount (NGN)',
                  prefixIcon: FaIcon(
                    FontAwesomeIcons.moneyBill,
                    size: 18,
                    color: AppColors.primaryBlue.withOpacity(0.7),
                  ),
                  hintText: 'Enter amount',
                ),
              ),
              const SizedBox(height: 16),

              // Email input
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                style: GoogleFonts.nunito(),
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  prefixIcon: FaIcon(
                    FontAwesomeIcons.envelope,
                    size: 18,
                    color: AppColors.primaryBlue.withOpacity(0.7),
                  ),
                  hintText: 'Enter your email',
                ),
              ),
              const SizedBox(height: 24),

              // Payment method selection
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.handHoldingDollar,
                    size: 16,
                    color: AppColors.primaryBlue,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '💳 Choose a Payment Method',
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryBlue,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Payment method options
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildPaymentMethodTile(
                        title: 'Credit/Debit Card',
                        subtitle: 'Pay with Visa, Mastercard or Verve',
                        icon: FontAwesomeIcons.creditCard,
                        emoji: '💳',
                        value: 'card',
                      ),
                      _buildPaymentMethodTile(
                        title: 'Bank Transfer',
                        subtitle: 'Make a direct bank transfer',
                        icon: FontAwesomeIcons.buildingColumns,
                        emoji: '🏦',
                        value: 'bank_transfer',
                      ),
                      _buildPaymentMethodTile(
                        title: 'USSD',
                        subtitle: 'Pay using bank USSD code',
                        icon: FontAwesomeIcons.hashtag,
                        emoji: '📱',
                        value: 'ussd',
                      ),
                      // Additional methods can be added here
                    ],
                  ),
                ),
              ),

              // Continue button
              ElevatedButton.icon(
                onPressed: _isProcessing ? null : _handleContinuePressed,
                icon: _isProcessing
                    ? SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const FaIcon(FontAwesomeIcons.arrowRight, size: 16),
                label: Text(
                  'Continue',
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentMethodTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required String emoji,
    required String value,
  }) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _selectedMethod == value
              ? AppColors.primaryBlue
              : isDarkMode
                  ? Colors.grey[800]!
                  : Colors.grey[200]!,
          width: _selectedMethod == value ? 1.5 : 1,
        ),
      ),
      child: RadioListTile<String>(
        title: Row(
          children: [
            Text(emoji, style: const TextStyle(fontSize: 16)),
            const SizedBox(width: 6),
            Text(
              title,
              style: GoogleFonts.nunito(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        subtitle: Text(
          subtitle,
          style: GoogleFonts.nunito(),
        ),
        secondary: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primaryBlue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: FaIcon(
            icon,
            size: 18,
            color: AppColors.primaryBlue,
          ),
        ),
        value: value,
        groupValue: _selectedMethod,
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() {
              _selectedMethod = newValue;
            });
          }
        },
        activeColor: AppColors.primaryBlue,
        selected: _selectedMethod == value,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  void _handleContinuePressed() {
    // Validate inputs
    if (_amountController.text.isEmpty) {
      _showErrorSnackBar('⚠️ Please enter a valid amount');
      return;
    }

    if (_emailController.text.isEmpty || !_emailController.text.contains('@')) {
      _showErrorSnackBar('⚠️ Please enter a valid email address');
      return;
    }

    // Navigate based on payment method
    setState(() {
      _isProcessing = true;
    });

    // We'll simulate a brief delay (in a real app, this might be validation)
    Future.delayed(const Duration(milliseconds: 800), () {
      setState(() {
        _isProcessing = false;
      });

      switch (_selectedMethod) {
        case 'card':
          Navigator.pushNamed(
            context,
            '/card-payment',
            arguments: {
              'amount': double.tryParse(_amountController.text) ?? 0.0,
              'email': _emailController.text,
            },
          );
          break;
        case 'bank_transfer':
        case 'ussd':
          // For demo purposes, we'll just show a snackbar
          _showErrorSnackBar(
              '🚧 This payment method is not fully implemented in the demo');
          break;
        default:
          _showErrorSnackBar('⚠️ Please select a payment method');
      }
    });
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: GoogleFonts.nunito(),
        ),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
