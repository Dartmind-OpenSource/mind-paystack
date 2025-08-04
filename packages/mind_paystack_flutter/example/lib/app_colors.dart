import 'dart:ui';

class AppColors {
  AppColors._();

  static const Color cardBgColor = Color(0xff363636);
  static const Color cardBgLightColor = Color(0xff999999);
  static const Color colorB58D67 = Color(0xffB58D67);
  static const Color colorE5D1B2 = Color(0xffE5D1B2);
  static const Color colorF9EED2 = Color(0xffF9EED2);
  static const Color colorEFEFED = Color(0xffEFEFED);

  // Modern blue - Primary color (replacing Chelsea Blue)
  static const Color primaryBlue = Color(0xFF2563EB); // Rich, vibrant blue
  static const Color primaryBlueLight = Color(0xFF3B82F6); // Lighter shade
  static const Color primaryBlueDark = Color(0xFF1D4ED8); // Darker shade

  // Additional accent colors for variety
  static const Color accentTeal = Color(0xFF0D9488); // Teal accent
  static const Color accentIndigo = Color(0xFF4F46E5); // Indigo accent

  // For backward compatibility - point to the new colors
  static const Color chelseaBlue = primaryBlue;
  static const Color chelseaBlueLight = primaryBlueLight;
  static const Color chelseaBlueDark = primaryBlueDark;

  // Neutral colors for borders and subtle UI elements
  static const Color borderLight = Color(0xFFE0E0E0);
  static const Color borderDark = Color(0xFF2C2C2C);
}
