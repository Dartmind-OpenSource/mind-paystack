import 'package:flutter/material.dart';
import 'package:example/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              FontAwesomeIcons.buildingColumns,
              size: 20,
              color: AppColors.primaryBlue,
            ),
            const SizedBox(width: 10),
            Text(
              'Paystack Demo',
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome header
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '👋 Welcome to Paystack Demo',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryBlue,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                '✨ Explore our payment methods and features',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                ),
              ),
              const SizedBox(height: 32),

              // Feature cards
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _buildFeatureCard(
                      context,
                      title: 'Make Payment',
                      subtitle: '💸 Quick & Easy',
                      icon: FontAwesomeIcons.creditCard,
                      color: AppColors.primaryBlue,
                      onTap: () =>
                          Navigator.pushNamed(context, '/payment-methods'),
                    ),
                    _buildFeatureCard(
                      context,
                      title: 'Transaction History',
                      subtitle: '📊 Track Records',
                      icon: FontAwesomeIcons.clockRotateLeft,
                      color: AppColors.primaryBlueLight,
                      onTap: () =>
                          Navigator.pushNamed(context, '/transaction-history'),
                    ),
                    _buildFeatureCard(
                      context,
                      title: 'Cards',
                      subtitle: '💳 Manage Cards',
                      icon: FontAwesomeIcons.wallet,
                      color: AppColors.accentTeal,
                      onTap: () =>
                          Navigator.pushNamed(context, '/card-payment'),
                    ),
                    _buildFeatureCard(
                      context,
                      title: 'Settings',
                      subtitle: '⚙️ Customize',
                      icon: FontAwesomeIcons.gear,
                      color: AppColors.accentIndigo,
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '⚠️ Settings not implemented in this demo',
                              style: GoogleFonts.nunito(),
                            ),
                            backgroundColor: AppColors.primaryBlueDark,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final cardBgColor = isDarkMode ? const Color(0xFF1E1E1E) : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black87;
    final subTextColor = isDarkMode ? Colors.white70 : Colors.black54;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: cardBgColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: isDarkMode
                  ? Colors.black.withOpacity(0.2)
                  : color.withOpacity(0.1),
              blurRadius: isDarkMode ? 8 : 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              // Subtle pattern/accent
              Positioned(
                top: -15,
                right: -15,
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: color.withOpacity(isDarkMode ? 0.15 : 0.08),
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),

              // Bottom accent line
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 4,
                  color: color,
                ),
              ),

              // Content
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: color.withOpacity(isDarkMode ? 0.2 : 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: FaIcon(
                        icon,
                        size: 24,
                        color: color,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      title,
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: GoogleFonts.nunito(
                        fontSize: 12,
                        color: subTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
