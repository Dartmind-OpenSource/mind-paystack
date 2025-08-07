import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:example/app_colors.dart';
import 'package:example/services/payment_service.dart';
import 'package:mind_paystack_flutter/mind_paystack_flutter.dart';
import 'dart:async';

class BankTransferScreen extends StatefulWidget {
  const BankTransferScreen({super.key});

  @override
  State<BankTransferScreen> createState() => _BankTransferScreenState();
}

class _BankTransferScreenState extends State<BankTransferScreen>
    with TickerProviderStateMixin {
  final PaymentService _paymentService = PaymentService();
  
  double amount = 0.0;
  String email = '';
  bool _isProcessing = false;
  bool _paymentInitiated = false;
  String _errorMessage = '';
  
  // Payment details
  String? _reference;
  String? _accountNumber;
  String? _bankName;
  String? _accountName;
  Duration? _expiryTime;
  
  // Timer for countdown
  Timer? _countdownTimer;
  Duration _remainingTime = Duration.zero;
  
  // Animation controllers
  late AnimationController _pulseController;
  late AnimationController _slideController;
  late Animation<double> _pulseAnimation;
  late Animation<Offset> _slideAnimation;

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
      
      // Auto-initiate payment if not already done
      if (!_paymentInitiated) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _initiateBankTransfer();
        });
      }
    }
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    _pulseController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  Future<void> _initiateBankTransfer() async {
    if (_paymentInitiated) return;
    
    setState(() {
      _isProcessing = true;
      _errorMessage = '';
      _paymentInitiated = true;
    });

    try {
      // For demo purposes, we'll simulate the bank transfer since the API 
      // might not be fully configured in test mode. In production, this would call:
      // final result = await _paymentService.processBankTransfer(...)
      
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 2));
      
      // Generate a mock reference
      final mockReference = 'bank_${DateTime.now().millisecondsSinceEpoch}';
      
      setState(() {
        _reference = mockReference;
        // Simulate account details (in real implementation, these come from API)
        _accountNumber = '1234567890';
        _bankName = 'Wema Bank';
        _accountName = 'Paystack Settlement';
        _expiryTime = const Duration(hours: 24);
        _remainingTime = _expiryTime!;
        _isProcessing = false;
      });
      
      _startCountdown();
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
                  child: Text('Demo Mode: Bank details generated for testing'),
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
        _errorMessage = 'Demo mode: Simulating bank transfer setup';
      });
      
      // Fallback to demo mode if API fails
      await Future.delayed(const Duration(seconds: 1));
      final mockReference = 'bank_demo_${DateTime.now().millisecondsSinceEpoch}';
      
      setState(() {
        _reference = mockReference;
        _accountNumber = '1234567890';
        _bankName = 'Wema Bank';
        _accountName = 'Paystack Settlement';
        _expiryTime = const Duration(hours: 24);
        _remainingTime = _expiryTime!;
        _isProcessing = false;
        _errorMessage = '';
      });
      
      _startCountdown();
      _slideController.forward();
    }
  }

  void _startCountdown() {
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime.inSeconds > 0) {
        setState(() {
          _remainingTime = Duration(seconds: _remainingTime.inSeconds - 1);
        });
      } else {
        timer.cancel();
      }
    });
  }

  Future<void> _copyToClipboard(String text, String label) async {
    await Clipboard.setData(ClipboardData(text: text));
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.check_circle, color: Colors.white),
              const SizedBox(width: 8),
              Text('$label copied to clipboard'),
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

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;
    final seconds = duration.inSeconds % 60;
    
    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    } else {
      return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bank Transfer',
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
                    if (_remainingTime.inSeconds > 0) ...[
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.access_time,
                            color: Colors.white70,
                            size: 16,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Expires in ${_formatDuration(_remainingTime)}',
                            style: GoogleFonts.nunito(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
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
    } else if (_reference != null) {
      return _buildBankDetailsState(isDarkMode);
    } else {
      return _buildInitialState();
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
                FontAwesomeIcons.buildingColumns,
                size: 40,
                color: AppColors.primaryBlue,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Setting up your bank transfer...',
            style: GoogleFonts.nunito(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Please wait while we generate your payment details',
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
                _paymentInitiated = false;
              });
              _initiateBankTransfer();
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildBankDetailsState(bool isDarkMode) {
    return SlideTransition(
      position: _slideAnimation,
      child: SingleChildScrollView(
        child: Column(
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
                        'Payment Instructions',
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
                    'Transfer the exact amount to the account details below. Your payment will be confirmed automatically within 5-10 minutes.',
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

            // Bank Details Card
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isDarkMode 
                    ? AppColors.borderDark 
                    : AppColors.borderLight,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlue.withOpacity(0.1),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: Text(
                      'Bank Account Details',
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: AppColors.primaryBlue,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        _buildDetailRow(
                          'Bank Name',
                          _bankName ?? '',
                          Icons.account_balance,
                          onTap: () => _copyToClipboard(_bankName ?? '', 'Bank name'),
                        ),
                        const SizedBox(height: 16),
                        _buildDetailRow(
                          'Account Number',
                          _accountNumber ?? '',
                          Icons.numbers,
                          onTap: () => _copyToClipboard(_accountNumber ?? '', 'Account number'),
                        ),
                        const SizedBox(height: 16),
                        _buildDetailRow(
                          'Account Name',
                          _accountName ?? '',
                          Icons.person,
                          onTap: () => _copyToClipboard(_accountName ?? '', 'Account name'),
                        ),
                        const SizedBox(height: 16),
                        _buildDetailRow(
                          'Amount',
                          '₦${amount.toStringAsFixed(2)}',
                          Icons.money,
                          onTap: () => _copyToClipboard(amount.toStringAsFixed(2), 'Amount'),
                        ),
                        const SizedBox(height: 16),
                        _buildDetailRow(
                          'Reference',
                          _reference ?? '',
                          Icons.receipt_long,
                          onTap: () => _copyToClipboard(_reference ?? '', 'Reference'),
                        ),
                      ],
                    ),
                  ),
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
                      // TODO: Share details
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Sharing payment details...'),
                        ),
                      );
                    },
                    icon: const Icon(Icons.share),
                    label: const Text('Share Details'),
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
                          'paymentMethod': 'bank_transfer',
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
                'Payment confirmation can take 5-10 minutes. You\'ll receive an email confirmation once your payment is verified.',
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

  Widget _buildDetailRow(
    String label,
    String value,
    IconData icon, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.05),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.grey.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: AppColors.primaryBlue,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: GoogleFonts.nunito(
                      fontSize: 12,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    style: GoogleFonts.nunito(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            if (onTap != null) ...[
              const SizedBox(width: 8),
              Icon(
                Icons.copy,
                size: 16,
                color: Colors.grey[500],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildInitialState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            FontAwesomeIcons.buildingColumns,
            size: 64,
            color: AppColors.primaryBlue,
          ),
          const SizedBox(height: 24),
          Text(
            'Bank Transfer Payment',
            style: GoogleFonts.nunito(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Secure and reliable bank transfer payment',
            style: GoogleFonts.nunito(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: _initiateBankTransfer,
            icon: const Icon(Icons.account_balance),
            label: const Text('Get Bank Details'),
          ),
        ],
      ),
    );
  }
}
