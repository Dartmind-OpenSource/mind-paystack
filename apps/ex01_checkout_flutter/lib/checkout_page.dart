import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mind_paystack/mind_paystack.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// A comprehensive checkout page that demonstrates MindPaystack SDK integration
/// in a Flutter application.
///
/// This page provides a complete payment flow including:
/// - Payment form with email and amount input
/// - Transaction initialization with Paystack
/// - WebView-based payment processing
/// - Payment verification and user feedback
///
/// ## Features
///
/// - **Responsive Design**: Adapts to different screen sizes and themes
/// - **Input Validation**: Comprehensive form validation for email and amount
/// - **Error Handling**: Proper error handling with user-friendly messages
/// - **Payment Flow**: Complete payment workflow from initialization to verification
/// - **Security**: SSL-encrypted payment processing
///
/// ## Usage
///
/// ```dart
/// // Navigate to checkout page
/// Navigator.push(
///   context,
///   MaterialPageRoute(builder: (context) => const CheckoutPage()),
/// );
/// ```
///
/// ## Environment Setup
///
/// Requires the following environment variables in .env:
/// - `PAYSTACK_PUBLIC_KEY`: Your Paystack public key
/// - `PAYSTACK_SECRET_KEY`: Your Paystack secret key
/// - `PAYSTACK_ENVIRONMENT`: (optional) 'test' or 'production'
/// - `PAYSTACK_LOG_LEVEL`: (optional) 'debug', 'info', 'warning', 'error'
class CheckoutPage extends StatefulWidget {
  /// Creates a new checkout page.
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

/// State class for the CheckoutPage widget.
///
/// Manages the payment form state, SDK initialization, and payment processing.
class _CheckoutPageState extends State<CheckoutPage>
    with TickerProviderStateMixin {
  // Form controllers
  /// Controller for the email input field
  final emailController = TextEditingController();

  /// Controller for the amount input field
  final amountController = TextEditingController();

  /// Global key for form validation
  final _formKey = GlobalKey<FormState>();

  // State variables
  /// Indicates whether a payment operation is in progress
  bool loading = false;

  /// Reference of the current transaction for verification
  String? transactionRef;

  /// Animation controller for page transitions
  late AnimationController _animationController;

  /// Fade animation for smooth page entry
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _initializeSDKAndAnimations();
  }

  @override
  void dispose() {
    _animationController.dispose();
    emailController.dispose();
    amountController.dispose();
    super.dispose();
  }

  /// Initializes the MindPaystack SDK and sets up page animations.
  ///
  /// This method runs asynchronously to avoid blocking the UI during
  /// SDK initialization. Any initialization errors are logged and displayed
  /// to the user via snackbar notifications.
  void _initializeSDKAndAnimations() {
    // Initialize SDK asynchronously
    _initializeMindPaystack().catchError((error) {
      debugPrint('Failed to initialize SDK: $error');
    });

    // Setup animations
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  /// Initializes the MindPaystack SDK with environment configuration.
  ///
  /// Loads configuration from environment variables and initializes the SDK
  /// with appropriate settings for the current environment.
  ///
  /// **Required Environment Variables:**
  /// - `PAYSTACK_PUBLIC_KEY`: Your Paystack public key
  /// - `PAYSTACK_SECRET_KEY`: Your Paystack secret key
  ///
  /// **Optional Environment Variables:**
  /// - `PAYSTACK_ENVIRONMENT`: 'test' or 'production' (defaults to 'test')
  /// - `PAYSTACK_LOG_LEVEL`: 'debug', 'info', 'warning', 'error' (defaults to 'info')
  ///
  /// Throws [MindException] if required environment variables are missing
  /// or if SDK initialization fails.
  Future<void> _initializeMindPaystack() async {
    try {
      final env = dotenv.env;
      final secretKey = env['PAYSTACK_SECRET_KEY'];
      final publicKey = env['PAYSTACK_PUBLIC_KEY'];

      // Validate required environment variables
      if (secretKey == null || secretKey.isEmpty) {
        throw const MindException(
          message: 'PAYSTACK_SECRET_KEY not set in .env file',
          code: 'missing_secret_key',
        );
      }

      if (publicKey == null || publicKey.isEmpty) {
        throw const MindException(
          message: 'PAYSTACK_PUBLIC_KEY not set in .env file',
          code: 'missing_public_key',
        );
      }

      // Initialize SDK with configuration
      await MindPaystack.initialize(
        PaystackConfig(
          publicKey: publicKey,
          secretKey: secretKey,
          environment: Environment.fromString(
            env['PAYSTACK_ENVIRONMENT'] ?? 'test',
          ),
          logLevel: LogLevel.fromString(env['PAYSTACK_LOG_LEVEL'] ?? 'info'),
        ),
      );
    } on MindException catch (e) {
      debugPrint('SDK initialization failed: ${e.message}');
      _showSnackBar('SDK initialization failed: ${e.message}', isError: true);
      rethrow;
    } catch (e) {
      debugPrint('Unexpected initialization error: $e');
      _showSnackBar('Failed to initialize payment system', isError: true);
      rethrow;
    }
  }

  /// Initiates the checkout process with the entered payment details.
  ///
  /// This method validates the form, initializes a transaction with Paystack,
  /// and navigates to the payment webview for payment completion.
  ///
  /// **Process Flow:**
  /// 1. Validates form inputs (email and amount)
  /// 2. Converts amount from Naira to kobo (multiply by 100)
  /// 3. Initializes transaction with Paystack
  /// 4. Opens payment webview with authorization URL
  /// 5. Handles success/failure scenarios
  ///
  /// The method automatically handles loading states and error scenarios,
  /// providing appropriate user feedback through snackbar notifications.
  ///
  /// Throws [MindException] for SDK-related errors, with user-friendly
  /// error messages displayed in the UI.
  Future<void> startCheckout() async {
    // Validate form inputs
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final email = emailController.text.trim();
    final amount = int.tryParse(amountController.text.trim());

    setState(() => loading = true);

    try {
      final mindPaystack = MindPaystack.instance;

      // Initialize transaction with Paystack
      final response = await mindPaystack.transaction.initialize(
        InitializeTransactionOptions(
          amount: (amount! * 100).toString(), // Convert to kobo
          email: email,
          currency: 'NGN',
          callbackUrl: 'https://example.com/flutter-callback',
        ),
      );

      // Store transaction reference for verification
      transactionRef = response.data?.reference;

      // Navigate to payment webview if initialization successful
      if (response.status == true && response.data?.authorizationUrl != null) {
        if (!mounted) return;
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PaymentWebView(
              authorizationUrl: response.data!.authorizationUrl,
              onPaymentComplete: verifyPayment,
            ),
          ),
        );
      } else {
        _showSnackBar(response.message ?? 'an error occurred', isError: true);
      }
    } on MindException catch (e) {
      debugPrint('MindPaystack Error: ${e.message}');
      _showSnackBar('Payment Error: ${e.message}', isError: true);
    } catch (e) {
      debugPrint('Unexpected error: $e');
      _showSnackBar('Checkout failed: ${e.toString()}', isError: true);
    } finally {
      setState(() => loading = false);
    }
  }

  /// Verifies the payment status after payment completion.
  ///
  /// This method is called automatically when the payment webview detects
  /// a successful payment callback. It verifies the transaction status
  /// with Paystack and provides appropriate user feedback.
  ///
  /// **Verification Process:**
  /// 1. Checks if transaction reference exists
  /// 2. Calls Paystack transaction verification API
  /// 3. Parses response data to determine payment status
  /// 4. Displays success/failure message with payment details
  /// 5. Clears form on successful payment
  ///
  /// **Payment Status Detection:**
  /// - Successful: `data['status'] == 'success'`
  /// - Failed: Any other status or missing data
  ///
  /// Shows detailed payment information including amount and currency
  /// for successful payments, or gateway error messages for failures.
  Future<void> verifyPayment() async {
    if (transactionRef == null) {
      _showSnackBar('No transaction to verify', isError: true);
      return;
    }

    setState(() => loading = true);

    try {
      final mindPaystack = MindPaystack.instance;
      final result = await mindPaystack.transaction.verify(transactionRef!);

      // Check overall response status first
      if (result.status != true) {
        _showSnackBar(result.message ?? 'Verification failed', isError: true);
        return;
      }

      // Extract payment status from data
      bool isSuccess = false;
      if (result.data != null) {
        final data = result.data!;
        final paymentStatus = data.status;
        isSuccess = paymentStatus == 'success';

        // Show detailed information based on payment status
        if (isSuccess) {
          final amount = data.amount;
          final currency = data.currency ?? 'NGN';
          final amountDisplay = amount != null
              ? '${currency == 'NGN' ? '₦' : currency}${(amount / 100).toStringAsFixed(2)}'
              : '';

          _showSnackBar('Payment successful! $amountDisplay', isError: false);

          // Clear form on successful payment
          emailController.clear();
          amountController.clear();
        } else {
          final gatewayResponse = data.gatewayResponse ?? 'Payment failed';
          _showSnackBar('Payment failed: $gatewayResponse', isError: true);
        }
      } else {
        _showSnackBar('No payment data found', isError: true);
      }
    } on MindException catch (e) {
      debugPrint('MindPaystack verification error: ${e.message}');
      _showSnackBar('Verification Error: ${e.message}', isError: true);
    } catch (e) {
      debugPrint('Unexpected verification error: $e');
      _showSnackBar('Verification failed: ${e.toString()}', isError: true);
    } finally {
      setState(() => loading = false);
    }
  }

  /// Displays a styled snackbar with the given message.
  ///
  /// Shows contextual feedback to the user with appropriate styling
  /// based on the message type (success or error).
  ///
  /// [message] The message to display to the user
  /// [isError] Whether this is an error message (affects styling)
  ///
  /// **Styling:**
  /// - Success: Green background with check icon
  /// - Error: Red background with error icon
  /// - Floating behavior with rounded corners
  void _showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              isError ? Icons.error_outline : Icons.check_circle_outline,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 8),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: isError ? Colors.red[600] : Colors.green[600],
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  /// Validates email input according to standard email format.
  ///
  /// Ensures the email field is not empty and matches a valid email pattern.
  /// Uses a regular expression to verify standard email format.
  ///
  /// [value] The email string to validate
  ///
  /// Returns error message if validation fails, null if valid.
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  /// Validates payment amount input.
  ///
  /// Ensures the amount is:
  /// - Not empty
  /// - A valid positive integer
  /// - At least ₦100 (minimum Paystack amount)
  ///
  /// [value] The amount string to validate
  ///
  /// Returns error message if validation fails, null if valid.
  String? _validateAmount(String? value) {
    if (value == null || value.isEmpty) {
      return 'Amount is required';
    }
    final amount = int.tryParse(value);
    if (amount == null || amount <= 0) {
      return 'Enter a valid amount';
    }
    if (amount < 100) {
      return 'Minimum amount is ₦100';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text(
          'Checkout',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: colorScheme.surface,
        elevation: 0,
        foregroundColor: colorScheme.onSurface,
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header Section
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        colorScheme.primary.withValues(alpha: 0.1),
                        colorScheme.primary.withValues(alpha: 0.05),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: colorScheme.primary.withValues(alpha: 0.2),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: colorScheme.primary,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.payment,
                          color: colorScheme.onPrimary,
                          size: 32,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Secure Payment',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Complete your purchase securely with Paystack',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Form Section
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest.withValues(
                      alpha: 0.3,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: colorScheme.outline.withValues(alpha: 0.2),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Payment Details',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Email Field
                      TextFormField(
                        controller: emailController,
                        validator: _validateEmail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          hintText: 'Enter your email',
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: colorScheme.primary,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: colorScheme.outline.withValues(alpha: 0.5),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: colorScheme.outline.withValues(alpha: 0.5),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: colorScheme.primary,
                              width: 2,
                            ),
                          ),
                          filled: true,
                          fillColor: colorScheme.surface,
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Amount Field
                      TextFormField(
                        controller: amountController,
                        validator: _validateAmount,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          labelText: 'Amount',
                          hintText: '0',
                          prefixIcon: Container(
                            margin: const EdgeInsets.all(12),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: colorScheme.primary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              '₦',
                              style: TextStyle(
                                color: colorScheme.primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: colorScheme.outline.withValues(alpha: 0.5),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: colorScheme.outline.withValues(alpha: 0.5),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: colorScheme.primary,
                              width: 2,
                            ),
                          ),
                          filled: true,
                          fillColor: colorScheme.surface,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Payment Button
                SizedBox(
                  height: 56,
                  child: ElevatedButton(
                    onPressed: loading ? null : startCheckout,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0,
                      shadowColor: Colors.transparent,
                    ),
                    child: loading
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    colorScheme.onPrimary,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              const Text(
                                'Processing...',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.lock_outline,
                                size: 20,
                                color: colorScheme.onPrimary,
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                'Pay Securely',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),

                const SizedBox(height: 16),

                // Security Info
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.green.withValues(alpha: 0.3),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.verified_user_outlined,
                        color: Colors.green[700],
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Your payment is protected by 256-bit SSL encryption',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: Colors.green[700],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// A WebView widget for handling Paystack payment processing.
///
/// This widget displays the Paystack payment page in a WebView and handles
/// the payment completion callback. It provides a seamless payment experience
/// within the Flutter app without redirecting to external browsers.
///
/// ## Features
///
/// - **Full WebView Integration**: Complete payment flow within the app
/// - **Callback Detection**: Automatically detects payment completion
/// - **Loading States**: Shows loading indicator while page loads
/// - **User Controls**: Close button for user cancellation
///
/// ## Usage
///
/// ```dart
/// Navigator.push(
///   context,
///   MaterialPageRoute(
///     builder: (_) => PaymentWebView(
///       authorizationUrl: 'https://checkout.paystack.com/...',
///       onPaymentComplete: () => verifyPayment(),
///     ),
///   ),
/// );
/// ```
class PaymentWebView extends StatefulWidget {
  /// The Paystack authorization URL for payment processing
  final String authorizationUrl;

  /// Callback function executed when payment is completed
  final VoidCallback onPaymentComplete;

  /// Creates a PaymentWebView with the given authorization URL and callback.
  ///
  /// [authorizationUrl] The payment URL from Paystack transaction initialization
  /// [onPaymentComplete] Function to call when payment is completed successfully
  const PaymentWebView({
    super.key,
    required this.authorizationUrl,
    required this.onPaymentComplete,
  });

  @override
  State<PaymentWebView> createState() => _PaymentWebViewState();
}

/// State class for the PaymentWebView widget.
///
/// Manages the WebView controller and handles payment page navigation.
class _PaymentWebViewState extends State<PaymentWebView> {
  /// WebView controller for managing the payment page
  late final WebViewController _controller;

  /// Indicates whether the payment page is still loading
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeWebView();
  }

  /// Initializes the WebView controller with payment page configuration.
  ///
  /// Sets up:
  /// - JavaScript mode for payment form functionality
  /// - Navigation delegate for callback URL detection
  /// - Loading state management
  /// - Authorization URL loading
  void _initializeWebView() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            debugPrint('Payment page loading: $url');

            // Detect payment completion callback
            if (url.startsWith('https://example.com/flutter-callback')) {
              widget.onPaymentComplete();
              Navigator.pop(context);
            }
          },
          onPageFinished: (url) {
            setState(() {
              isLoading = false;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.authorizationUrl));
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Complete Payment',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: colorScheme.surface,
        elevation: 0,
        foregroundColor: colorScheme.onSurface,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          // Payment WebView
          WebViewWidget(controller: _controller),

          // Loading overlay
          if (isLoading)
            Container(
              color: colorScheme.surface,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(color: colorScheme.primary),
                    const SizedBox(height: 16),
                    Text(
                      'Loading payment page...',
                      style: TextStyle(
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
