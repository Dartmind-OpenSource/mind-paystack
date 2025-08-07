import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:example/app_colors.dart';
import 'package:example/services/payment_service.dart';
import 'package:mind_paystack_flutter/mind_paystack_flutter.dart';
import 'dart:async';

class UssdPaymentScreen extends StatefulWidget {
  const UssdPaymentScreen({super.key});

  @override
  State<UssdPaymentScreen> createState() => _UssdPaymentScreenState();
}

class _UssdPaymentScreenState extends State<UssdPaymentScreen>
    with TickerProviderStateMixin {
  final PaymentService _paymentService = PaymentService();
  
  double amount = 0.0;
  String email = '';
  bool _isProcessing = false;
  String _errorMessage = '';
  String? _selectedBankId;
  
  // Payment details
  String? _reference;
  String? _ussdCode;
  String? _bankName;
  
  // Animation controllers
  late AnimationController _pulseController;
  late AnimationController _slideController;
  late Animation<double> _pulseAnimation;
  late Animation<Offset> _slideAnimation;

  // Nigerian banks with USSD codes and unique IDs
  final List<Map<String, String>> _banks = [
    {'id': 'gtb', 'name': 'GTBank', 'code': '058', 'ussdCode': '*737*'},
    {'id': 'access', 'name': 'Access Bank', 'code': '044', 'ussdCode': '*901*'},
    {'id': 'zenith', 'name': 'Zenith Bank', 'code': '057', 'ussdCode': '*966*'},
    {'id': 'firstbank', 'name': 'First Bank', 'code': '011', 'ussdCode': '*894*'},
    {'id': 'uba', 'name': 'UBA', 'code': '033', 'ussdCode': '*919*'},
    {'id': 'fidelity', 'name': 'Fidelity Bank', 'code': '070', 'ussdCode': '*770*'},
    {'id': 'sterling', 'name': 'Sterling Bank', 'code': '232', 'ussdCode': '*822*'},
    {'id': 'fcmb', 'name': 'FCMB', 'code': '214', 'ussdCode': '*329*'},
    {'id': 'union', 'name': 'Union Bank', 'code': '032', 'ussdCode': '*826*'},
    {'id': 'wema', 'name': 'Wema Bank', 'code': '035', 'ussdCode': '*945*'},
  ];

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    
    _pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));
    
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.elasticOut,
    ));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    // Get route arguments
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
    _pulseController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  Future<void> _initiateUssdPayment() async {
    if (_selectedBankId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please select a bank first'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
      return;
    }

    setState(() {
      _isProcessing = true;
      _errorMessage = '';
    });

    try {
      final selectedBank = _banks.firstWhere(
        (bank) => bank['id'] == _selectedBankId,
      );
      
      // For demo purposes, we'll simulate the USSD payment since the real endpoint
      // might not be available in test mode. In production, this would call:
      // final result = await _paymentService.processUssdPayment(...)
      
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 2));
      
      // Generate a mock reference
      final mockReference = 'ussd_${DateTime.now().millisecondsSinceEpoch}';
      
      setState(() {
        _reference = mockReference;
        _bankName = selectedBank['name'];
        _ussdCode = '${selectedBank['ussdCode']}${(amount * 100).toInt()}*$mockReference#';
        _isProcessing = false;
      });
      
      _slideController.forward();
      
      // Show a note that this is a demo
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.info_outline, color: Colors.white),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text('Demo Mode: USSD code generated for testing'),
                ),
              ],
            ),
            backgroundColor: Colors.blue,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      }
    } on MindException catch (e) {
      setState(() {
        _isProcessing = false;
        _errorMessage = e.message;
      });
    } catch (e) {
      setState(() {
        _isProcessing = false;
        _errorMessage = 'An unexpected error occurred: $e';
      });
    }
  }

  Future<void> _copyUssdCode() async {
    if (_ussdCode != null) {
      await Clipboard.setData(ClipboardData(text: _ussdCode!));
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.white),
                const SizedBox(width: 8),
                const Text('USSD code copied to clipboard'),
              ],
            ),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'USSD Payment',
          style: GoogleFonts.nunito(fontWeight: FontWeight.bold),
        ),
        actions: [
          if (_reference != null)
            IconButton(
              onPressed: () {
                // TODO: Check payment status
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Checking payment status...'),
                  ),
                );
              },
              icon: const Icon(Icons.refresh),
              tooltip: 'Check Status',
            ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Amount display
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primaryBlue,
                      AppColors.primaryBlueLight,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryBlue.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      'Amount to Pay',
                      style: GoogleFonts.nunito(
                        color: Colors.white70,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '₦${amount.toStringAsFixed(2)}',
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),

              // Content based on state
              Expanded(
                child: _buildContent(isDarkMode),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(bool isDarkMode) {
    if (_isProcessing) {
      return _buildLoadingState();
    } else if (_errorMessage.isNotEmpty) {
      return _buildErrorState();
    } else if (_ussdCode != null) {
      return _buildUssdCodeState(isDarkMode);
    } else {
      return _buildBankSelectionState(isDarkMode);
    }
  }

  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: _pulseAnimation,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.primaryBlue.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                FontAwesomeIcons.hashtag,
                size: 40,
                color: AppColors.primaryBlue,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Setting up your USSD payment...',
            style: GoogleFonts.nunito(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Please wait while we generate your USSD code',
            style: GoogleFonts.nunito(
              fontSize: 14,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }

  Widget _buildErrorState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.error_outline,
              size: 40,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Payment Setup Failed',
            style: GoogleFonts.nunito(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _errorMessage,
            style: GoogleFonts.nunito(
              fontSize: 14,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
                      ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _errorMessage = '';
                });
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Try Again'),
            ),
        ],
      ),
    );
  }

  Widget _buildBankSelectionState(bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Instructions
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.blue.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: Colors.blue[700],
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'USSD Payment',
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w600,
                      color: Colors.blue[700],
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                'Select your bank to generate a USSD code. Dial the code on your phone to complete the payment.',
                style: GoogleFonts.nunito(
                  fontSize: 14,
                  color: Colors.blue[600],
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        Text(
          'Select Your Bank',
          style: GoogleFonts.nunito(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 16),

        // Bank selection
        Expanded(
          child: ListView.builder(
            itemCount: _banks.length,
            itemBuilder: (context, index) {
              final bank = _banks[index];
              final isSelected = _selectedBankId == bank['id'];
              
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: isSelected 
                    ? AppColors.primaryBlue.withOpacity(0.1)
                    : (isDarkMode ? const Color(0xFF1E1E1E) : Colors.white),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected 
                      ? AppColors.primaryBlue
                      : (isDarkMode ? AppColors.borderDark : AppColors.borderLight),
                    width: isSelected ? 2 : 1,
                  ),
                  boxShadow: isSelected ? [
                    BoxShadow(
                      color: AppColors.primaryBlue.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ] : [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 4,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  leading: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: isSelected 
                        ? AppColors.primaryBlue
                        : Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      FontAwesomeIcons.buildingColumns,
                      color: isSelected ? Colors.white : Colors.grey[600],
                      size: 20,
                    ),
                  ),
                  title: Text(
                    bank['name']!,
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w600,
                      color: isSelected ? AppColors.primaryBlue : null,
                    ),
                  ),
                  subtitle: Text(
                    'USSD: ${bank['ussdCode']}',
                    style: GoogleFonts.nunito(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  trailing: isSelected 
                    ? Icon(
                        Icons.check_circle,
                        color: AppColors.primaryBlue,
                      )
                    : null,
                  onTap: () {
                    setState(() {
                      _selectedBankId = bank['id'];
                    });
                  },
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 16),

        // Continue button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: _selectedBankId != null ? _initiateUssdPayment : null,
            icon: const Icon(FontAwesomeIcons.hashtag),
            label: const Text('Generate USSD Code'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUssdCodeState(bool isDarkMode) {
    return SlideTransition(
      position: _slideAnimation,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Success message
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.green.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        color: Colors.green[700],
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'USSD Code Generated',
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w600,
                          color: Colors.green[700],
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Your USSD code is ready! Dial the code below on your $_bankName registered phone number to complete the payment.',
                    style: GoogleFonts.nunito(
                      fontSize: 14,
                      color: Colors.green[600],
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // USSD Code Card
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primaryBlue,
                    AppColors.primaryBlueLight,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryBlue.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Icon(
                      FontAwesomeIcons.mobileScreen,
                      size: 48,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Dial This Code',
                      style: GoogleFonts.nunito(
                        color: Colors.white70,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        _ussdCode ?? '',
                        style: GoogleFonts.nunitoSans(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: _copyUssdCode,
                      icon: const Icon(Icons.copy, color: AppColors.primaryBlue),
                      label: Text(
                        'Copy Code',
                        style: GoogleFonts.nunito(
                          color: AppColors.primaryBlue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: AppColors.primaryBlue,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Instructions
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isDarkMode 
                    ? AppColors.borderDark 
                    : AppColors.borderLight,
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'How to Complete Payment',
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildInstructionStep(1, 'Copy the USSD code above'),
                  _buildInstructionStep(2, 'Open your phone\'s dialer'),
                  _buildInstructionStep(3, 'Dial the USSD code'),
                  _buildInstructionStep(4, 'Follow the prompts to authorize payment'),
                  _buildInstructionStep(5, 'Wait for SMS confirmation'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Action buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      setState(() {
                        _ussdCode = null;
                        _selectedBankId = null;
                      });
                    },
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Choose Different Bank'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        '/payment-success',
                        arguments: {
                          'amount': amount,
                          'reference': _reference,
                          'paymentMethod': 'ussd',
                        },
                      );
                    },
                    icon: const Icon(Icons.check),
                    label: const Text('I\'ve Paid'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Status check note
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Payment confirmation is usually instant. If you don\'t receive SMS confirmation within 5 minutes, please contact support.',
                style: GoogleFonts.nunito(
                  fontSize: 12,
                  color: Colors.grey[600],
                  height: 1.3,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInstructionStep(int step, String instruction) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: AppColors.primaryBlue,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                step.toString(),
                style: GoogleFonts.nunito(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              instruction,
              style: GoogleFonts.nunito(
                fontSize: 14,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
