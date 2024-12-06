import 'package:flutter/material.dart';

class MPTheme {
  /// Primary color for buttons and important elements
  final Color primaryColor;

  /// Secondary color for accents and highlights
  final Color secondaryColor;

  /// Background color for cards and surfaces
  final Color backgroundColor;

  /// Text color for primary content
  final Color textColor;

  /// Color for error states and messages
  final Color errorColor;

  /// Color for success states and messages
  final Color successColor;

  /// Border radius for components
  final double borderRadius;

  /// Text style for headings
  final TextStyle headingStyle;

  /// Text style for body text
  final TextStyle bodyStyle;

  /// Text style for buttons
  final TextStyle buttonStyle;

  /// Padding for components
  final EdgeInsets padding;

  /// Animation duration for state changes
  final Duration animationDuration;

  const MPTheme({
    this.primaryColor = const Color(0xFF2D5AF0),
    this.secondaryColor = const Color(0xFF0D1F3C),
    this.backgroundColor = Colors.white,
    this.textColor = const Color(0xFF1A1A1A),
    this.errorColor = const Color(0xFFE41338),
    this.successColor = const Color(0xFF00C853),
    this.borderRadius = 8.0,
    this.headingStyle = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Color(0xFF1A1A1A),
    ),
    this.bodyStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Color(0xFF1A1A1A),
    ),
    this.buttonStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    this.padding = const EdgeInsets.all(16.0),
    this.animationDuration = const Duration(milliseconds: 300),
  });

  /// Default theme
  static final defaultTheme = MPTheme();

  /// Dark theme
  static final darkTheme = MPTheme(
    primaryColor: const Color(0xFF3D6BFF),
    secondaryColor: const Color(0xFF1E293B),
    backgroundColor: const Color(0xFF121212),
    textColor: Colors.white,
    errorColor: const Color(0xFFFF3B30),
    successColor: const Color(0xFF34C759),
    headingStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodyStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
  );

  MPTheme copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? backgroundColor,
    Color? textColor,
    Color? errorColor,
    Color? successColor,
    double? borderRadius,
    TextStyle? headingStyle,
    TextStyle? bodyStyle,
    TextStyle? buttonStyle,
    EdgeInsets? padding,
    Duration? animationDuration,
  }) {
    return MPTheme(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      errorColor: errorColor ?? this.errorColor,
      successColor: successColor ?? this.successColor,
      borderRadius: borderRadius ?? this.borderRadius,
      headingStyle: headingStyle ?? this.headingStyle,
      bodyStyle: bodyStyle ?? this.bodyStyle,
      buttonStyle: buttonStyle ?? this.buttonStyle,
      padding: padding ?? this.padding,
      animationDuration: animationDuration ?? this.animationDuration,
    );
  }

  /// Helper method to get color based on payment status
  // Color getStatusColor(PaymentStatus status) {
  //   switch (status) {
  //     case PaymentStatus.success:
  //       return successColor;
  //     case PaymentStatus.failed:
  //       return errorColor;
  //     case PaymentStatus.pending:
  //       return primaryColor;
  //     default:
  //       return secondaryColor;
  //   }
  // }

  /// Get theme brightness
  Brightness get brightness {
    return ThemeData.estimateBrightnessForColor(backgroundColor);
  }

  /// Convert theme to MaterialColor for MaterialApp
  MaterialColor get asMaterialColor {
    return MaterialColor(primaryColor.value, {
      50: primaryColor.withOpacity(0.1),
      100: primaryColor.withOpacity(0.2),
      200: primaryColor.withOpacity(0.3),
      300: primaryColor.withOpacity(0.4),
      400: primaryColor.withOpacity(0.5),
      500: primaryColor.withOpacity(0.6),
      600: primaryColor.withOpacity(0.7),
      700: primaryColor.withOpacity(0.8),
      800: primaryColor.withOpacity(0.9),
      900: primaryColor,
    });
  }
}
