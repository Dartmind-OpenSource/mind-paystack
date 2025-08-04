import 'package:flutter/material.dart';
import 'package:example/app_colors.dart';
import 'package:example/models/transaction.dart';
import 'package:example/services/payment_service.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({super.key});

  @override
  State<TransactionHistoryScreen> createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  final PaymentService _paymentService = PaymentService();
  List<Transaction> _transactions = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTransactions();
  }

  void _loadTransactions() {
    // In a real app, this would be an async call to get transactions
    // For demo purposes, we'll use our in-memory transactions
    setState(() {
      _transactions = _paymentService.transactions;
      _isLoading = false;
    });

    // If there are no transactions, let's create some sample ones for demo purposes
    if (_transactions.isEmpty) {
      _addSampleTransactions();
    }
  }

  void _addSampleTransactions() {
    // Add some sample transactions for demo purposes
    final sampleTransactions = [
      Transaction(
        id: 'trx_sample1',
        reference: 'ref_123456789',
        amount: 5000.0,
        email: 'customer@example.com',
        status: 'success',
        paymentMethod: 'card',
        dateTime: DateTime.now().subtract(const Duration(days: 2)),
      ),
      Transaction(
        id: 'trx_sample2',
        reference: 'ref_987654321',
        amount: 3500.0,
        email: 'customer@example.com',
        status: 'success',
        paymentMethod: 'bank_transfer',
        dateTime: DateTime.now().subtract(const Duration(days: 5)),
      ),
      Transaction(
        id: 'trx_sample3',
        reference: 'ref_555555555',
        amount: 1200.0,
        email: 'customer@example.com',
        status: 'failed',
        paymentMethod: 'ussd',
        dateTime: DateTime.now().subtract(const Duration(days: 7)),
      ),
    ];

    setState(() {
      _transactions = sampleTransactions + _transactions;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(
              FontAwesomeIcons.clockRotateLeft,
              size: 20,
              color: AppColors.primaryBlue,
            ),
            const SizedBox(width: 10),
            Text(
              'Transaction History',
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _transactions.isEmpty
              ? _buildEmptyState()
              : _buildTransactionList(),
    );
  }

  Widget _buildEmptyState() {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            FontAwesomeIcons.receipt,
            size: 72,
            color: isDarkMode ? Colors.grey.shade700 : Colors.grey.shade300,
          ),
          const SizedBox(height: 16),
          Text(
            '📝 No Transactions Yet',
            style: GoogleFonts.nunito(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryBlue,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Your payment history will appear here',
            style: GoogleFonts.nunito(
              color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            icon: const FaIcon(FontAwesomeIcons.moneyBill, size: 16),
            label: Text(
              'Make a Payment',
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.w600,
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/payment-methods');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionList() {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        // Summary card
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: isDarkMode
                ? AppColors.primaryBlue.withOpacity(0.15)
                : AppColors.primaryBlue.withOpacity(0.05),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isDarkMode
                  ? AppColors.primaryBlue.withOpacity(0.3)
                  : AppColors.primaryBlue.withOpacity(0.1),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildSummaryItem(
                'Total',
                _transactions.length.toString(),
                FontAwesomeIcons.receipt,
                '📃',
              ),
              _buildSummaryItem(
                'Successful',
                _transactions
                    .where((t) => t.status == 'success')
                    .length
                    .toString(),
                FontAwesomeIcons.circleCheck,
                '✅',
              ),
              _buildSummaryItem(
                'Failed',
                _transactions
                    .where((t) => t.status == 'failed')
                    .length
                    .toString(),
                FontAwesomeIcons.circleXmark,
                '❌',
              ),
            ],
          ),
        ),

        // Transaction list
        Expanded(
          child: ListView.builder(
            itemCount: _transactions.length,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              final transaction = _transactions[index];
              return _buildTransactionCard(transaction);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryItem(
      String title, String value, IconData icon, String emoji) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isDarkMode
                ? AppColors.primaryBlue.withOpacity(0.2)
                : AppColors.primaryBlue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                icon,
                color: AppColors.primaryBlue,
                size: 18,
              ),
              const SizedBox(width: 5),
              Text(emoji, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: GoogleFonts.nunito(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryBlue,
          ),
        ),
        Text(
          title,
          style: GoogleFonts.nunito(
            fontSize: 14,
            color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionCard(Transaction transaction) {
    final formattedDate =
        DateFormat('dd MMM yyyy, HH:mm').format(transaction.dateTime);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final cardBgColor = isDarkMode ? const Color(0xFF1E1E1E) : Colors.white;

    // Determine icon based on payment method
    IconData methodIcon;
    String methodEmoji;
    switch (transaction.paymentMethod) {
      case 'card':
        methodIcon = FontAwesomeIcons.creditCard;
        methodEmoji = '💳';
        break;
      case 'bank_transfer':
        methodIcon = FontAwesomeIcons.buildingColumns;
        methodEmoji = '🏦';
        break;
      case 'ussd':
        methodIcon = FontAwesomeIcons.hashtag;
        methodEmoji = '📱';
        break;
      default:
        methodIcon = FontAwesomeIcons.moneyBill;
        methodEmoji = '💰';
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(12),
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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row with date and status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.calendar,
                      size: 12,
                      color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                    ),
                    const SizedBox(width: 6),
                    Text(
                      formattedDate,
                      style: GoogleFonts.nunito(
                        fontSize: 14,
                        color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                _buildStatusChip(transaction.status),
              ],
            ),
            const SizedBox(height: 12),

            // Amount and payment method
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '₦${transaction.amount.toStringAsFixed(2)}',
                      style: GoogleFonts.nunito(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryBlue,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'ID: ${transaction.reference}',
                      style: GoogleFonts.nunito(
                        fontSize: 12,
                        color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      FaIcon(
                        methodIcon,
                        size: 14,
                        color: AppColors.primaryBlue,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '$methodEmoji ${_formatPaymentMethod(transaction.paymentMethod)}',
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryBlue,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    Color bgColor;
    Color textColor;
    IconData icon;
    String emoji;
    String label;

    switch (status) {
      case 'success':
        bgColor = Colors.green.shade100;
        textColor = Colors.green.shade800;
        icon = FontAwesomeIcons.circleCheck;
        emoji = '✅';
        label = 'Success';
        break;
      case 'failed':
        bgColor = Colors.red.shade100;
        textColor = Colors.red.shade800;
        icon = FontAwesomeIcons.circleXmark;
        emoji = '❌';
        label = 'Failed';
        break;
      case 'pending':
        bgColor = Colors.orange.shade100;
        textColor = Colors.orange.shade800;
        icon = FontAwesomeIcons.clock;
        emoji = '⏳';
        label = 'Pending';
        break;
      default:
        bgColor = Colors.grey.shade100;
        textColor = Colors.grey.shade800;
        icon = FontAwesomeIcons.question;
        emoji = '❓';
        label = 'Unknown';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(icon, size: 12, color: textColor),
          const SizedBox(width: 4),
          Text(
            '$emoji $label',
            style: GoogleFonts.nunito(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  String _formatPaymentMethod(String method) {
    switch (method) {
      case 'card':
        return 'Card';
      case 'bank_transfer':
        return 'Bank Transfer';
      case 'ussd':
        return 'USSD';
      default:
        return method.split('_').map((word) => word.capitalize()).join(' ');
    }
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
