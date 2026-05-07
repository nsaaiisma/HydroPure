import 'package:flutter/material.dart';

/// App color constants for both light and dark themes
class AppColors {
  // Primary Colors
  static const Color primaryColor = Color(0xFF2D6A4F);
  static const Color secondaryColor = Color(0xFF95D5B2);
  static const Color tertiaryColor = Color(0xFF1B4332);

  // Background Colors
  static const Color lightBackground = Color(0xffF8FAF9);
  static const Color secondaryLightBackground = Color(0xFFF8F9FC);
  static const Color darkBackground = Color(0xFF001813);
  static const Color secondaryDarkBackground = Color(0xff08201D);

  // Surface Colors
  static const Color lightSurface = Color(0xffF8FAF9);
  static const Color lightCardSurface = Color(0xffffffff);
  static const Color darkSurface = Color(0xFF001813);
  static const Color darkCardSurface = Color(0xFF08201D);

  // Text Colors
  static const Color lightPrimaryTitleText = Color(0xFF2A343F);
  static const Color lightPrimaryText = Color(0xFF000000);
  static const Color lightSecondaryText = Color(0xff686868);
  static const Color darkPrimaryText = Color(0xFFffffff);
  static const Color darkSecondaryText = Color(0xFFffffff);

  // Border Colors
  static const Color lightBorder = Color(0xFFCBCBCB);
  static const Color darkBorder = Color(0xFFCBCBCB);

  // Shadow Colors
  static const Color lightShadow = Color(0x1A000000); // black with 10% opacity
  static const Color darkShadow = Color(0x1A000000); // black with 50% opacity

  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFF44336);
  static const Color info = Color(0xFF2196F3);

  // Interactive Colors
  static const Color lightHover = Color(0xFFF5F5F5);
  static const Color darkHover = Color(0xFF404040);
  static const Color lightPressed = Color(0xFFEEEEEE);
  static const Color darkPressed = Color(0xFF525252);
  static const Color hoverColor = Color(0xFFF7FBFE);

  static Color? get primaryBlue => null;
}

/// App spacing constants
class AppSpacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
  static const double xxxl = 64.0;
}

/// App border radius constants
class AppBorderRadius {
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 20.0;
  static const double xxl = 24.0;
}

/// App elevation constants
class AppElevation {
  static const double none = 0.0;
  static const double low = 2.0;
  static const double medium = 4.0;
  static const double high = 8.0;
  static const double highest = 16.0;
}

/// App font sizes
class AppFontSizes {
  static const double xs = 10.0;
  static const double sm = 12.0;
  static const double md = 14.0;
  static const double lg = 16.0;
  static const double xl = 18.0;
  static const double xxl = 20.0;
  static const double xxxl = 24.0;
  static const double display = 32.0;
}

/// App font weights
class AppFontWeights {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;
}
