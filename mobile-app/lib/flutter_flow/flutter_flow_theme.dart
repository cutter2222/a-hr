// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';

SharedPreferences? _prefs;

abstract class FlutterFlowTheme {
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();

  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static FlutterFlowTheme of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? DarkModeTheme()
        : LightModeTheme();
  }

  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  late Color inputAccent;
  late Color button10;
  late Color iconInactive;
  late Color containerAccent;
  late Color bottomBackground;
  late Color inputBorder;
  late Color gradient1n1;
  late Color gradient1n2;
  late Color gradient2n1;
  late Color gradient2n2;
  late Color gradient3n1;
  late Color gradient3n2;
  late Color gradient4n1;
  late Color gradient4n2;

  @Deprecated('Use displaySmallFamily instead')
  String get title1Family => displaySmallFamily;
  @Deprecated('Use displaySmall instead')
  TextStyle get title1 => typography.displaySmall;
  @Deprecated('Use headlineMediumFamily instead')
  String get title2Family => typography.headlineMediumFamily;
  @Deprecated('Use headlineMedium instead')
  TextStyle get title2 => typography.headlineMedium;
  @Deprecated('Use headlineSmallFamily instead')
  String get title3Family => typography.headlineSmallFamily;
  @Deprecated('Use headlineSmall instead')
  TextStyle get title3 => typography.headlineSmall;
  @Deprecated('Use titleMediumFamily instead')
  String get subtitle1Family => typography.titleMediumFamily;
  @Deprecated('Use titleMedium instead')
  TextStyle get subtitle1 => typography.titleMedium;
  @Deprecated('Use titleSmallFamily instead')
  String get subtitle2Family => typography.titleSmallFamily;
  @Deprecated('Use titleSmall instead')
  TextStyle get subtitle2 => typography.titleSmall;
  @Deprecated('Use bodyMediumFamily instead')
  String get bodyText1Family => typography.bodyMediumFamily;
  @Deprecated('Use bodyMedium instead')
  TextStyle get bodyText1 => typography.bodyMedium;
  @Deprecated('Use bodySmallFamily instead')
  String get bodyText2Family => typography.bodySmallFamily;
  @Deprecated('Use bodySmall instead')
  TextStyle get bodyText2 => typography.bodySmall;

  String get displayLargeFamily => typography.displayLargeFamily;
  bool get displayLargeIsCustom => typography.displayLargeIsCustom;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  bool get displayMediumIsCustom => typography.displayMediumIsCustom;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  bool get displaySmallIsCustom => typography.displaySmallIsCustom;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  bool get headlineLargeIsCustom => typography.headlineLargeIsCustom;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  bool get headlineMediumIsCustom => typography.headlineMediumIsCustom;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  bool get headlineSmallIsCustom => typography.headlineSmallIsCustom;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  bool get titleLargeIsCustom => typography.titleLargeIsCustom;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  bool get titleMediumIsCustom => typography.titleMediumIsCustom;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  bool get titleSmallIsCustom => typography.titleSmallIsCustom;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  bool get labelLargeIsCustom => typography.labelLargeIsCustom;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  bool get labelMediumIsCustom => typography.labelMediumIsCustom;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  bool get labelSmallIsCustom => typography.labelSmallIsCustom;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  bool get bodyLargeIsCustom => typography.bodyLargeIsCustom;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  bool get bodyMediumIsCustom => typography.bodyMediumIsCustom;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  bool get bodySmallIsCustom => typography.bodySmallIsCustom;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF34A2DC);
  late Color secondary = const Color(0xFF347EF4);
  late Color tertiary = const Color(0xFFEE8B60);
  late Color alternate = const Color(0xFFE0E3E7);
  late Color primaryText = const Color(0xFFFFFFFF);
  late Color secondaryText = const Color(0xFF9FAAC7);
  late Color primaryBackground = const Color(0xFF090E29);
  late Color secondaryBackground = const Color(0xFF0C1547);
  late Color accent1 = const Color(0x4C4B39EF);
  late Color accent2 = const Color(0x4D39D2C0);
  late Color accent3 = const Color(0x4DEE8B60);
  late Color accent4 = const Color(0xCCFFFFFF);
  late Color success = const Color(0xFF249689);
  late Color warning = const Color(0xFFF9CF58);
  late Color error = const Color(0xFFFF5963);
  late Color info = const Color(0xFFFFFFFF);

  late Color inputAccent = const Color(0xFF34A2DC);
  late Color button10 = const Color(0x1A34A2DC);
  late Color iconInactive = const Color(0xFFC3C3C3);
  late Color containerAccent = const Color(0xFF1C3CBE);
  late Color bottomBackground = const Color(0xFF242B47);
  late Color inputBorder = const Color(0xFF3A4657);
  late Color gradient1n1 = const Color(0xFF5311AC);
  late Color gradient1n2 = const Color(0xFF7F34DC);
  late Color gradient2n1 = const Color(0xFF0A4C47);
  late Color gradient2n2 = const Color(0xFF38EF7D);
  late Color gradient3n1 = const Color(0xFFF12711);
  late Color gradient3n2 = const Color(0xFFF5AF19);
  late Color gradient4n1 = const Color(0xFF724DD9);
  late Color gradient4n2 = const Color(0xFFF08A93);
}

abstract class Typography {
  String get displayLargeFamily;
  bool get displayLargeIsCustom;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  bool get displayMediumIsCustom;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  bool get displaySmallIsCustom;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  bool get headlineLargeIsCustom;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  bool get headlineMediumIsCustom;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  bool get headlineSmallIsCustom;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  bool get titleLargeIsCustom;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  bool get titleMediumIsCustom;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  bool get titleSmallIsCustom;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  bool get labelLargeIsCustom;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  bool get labelMediumIsCustom;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  bool get labelSmallIsCustom;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  bool get bodyLargeIsCustom;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  bool get bodyMediumIsCustom;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  bool get bodySmallIsCustom;
  TextStyle get bodySmall;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Montserrat';
  bool get displayLargeIsCustom => false;
  TextStyle get displayLarge => GoogleFonts.montserrat(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
      );
  String get displayMediumFamily => 'Montserrat';
  bool get displayMediumIsCustom => false;
  TextStyle get displayMedium => GoogleFonts.montserrat(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
      );
  String get displaySmallFamily => 'Montserrat';
  bool get displaySmallIsCustom => false;
  TextStyle get displaySmall => GoogleFonts.montserrat(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
      );
  String get headlineLargeFamily => 'Montserrat';
  bool get headlineLargeIsCustom => false;
  TextStyle get headlineLarge => GoogleFonts.montserrat(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
      );
  String get headlineMediumFamily => 'Montserrat';
  bool get headlineMediumIsCustom => false;
  TextStyle get headlineMedium => GoogleFonts.montserrat(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
      );
  String get headlineSmallFamily => 'Montserrat';
  bool get headlineSmallIsCustom => false;
  TextStyle get headlineSmall => GoogleFonts.montserrat(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
      );
  String get titleLargeFamily => 'Montserrat';
  bool get titleLargeIsCustom => false;
  TextStyle get titleLarge => GoogleFonts.montserrat(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 42.0,
      );
  String get titleMediumFamily => 'Montserrat';
  bool get titleMediumIsCustom => false;
  TextStyle get titleMedium => GoogleFonts.montserrat(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 36.0,
      );
  String get titleSmallFamily => 'Montserrat';
  bool get titleSmallIsCustom => false;
  TextStyle get titleSmall => GoogleFonts.montserrat(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 32.0,
      );
  String get labelLargeFamily => 'Montserrat';
  bool get labelLargeIsCustom => false;
  TextStyle get labelLarge => GoogleFonts.montserrat(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 24.0,
      );
  String get labelMediumFamily => 'Montserrat';
  bool get labelMediumIsCustom => false;
  TextStyle get labelMedium => GoogleFonts.montserrat(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 20.0,
      );
  String get labelSmallFamily => 'Montserrat';
  bool get labelSmallIsCustom => false;
  TextStyle get labelSmall => GoogleFonts.montserrat(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 18.0,
      );
  String get bodyLargeFamily => 'Montserrat';
  bool get bodyLargeIsCustom => false;
  TextStyle get bodyLarge => GoogleFonts.montserrat(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get bodyMediumFamily => 'Montserrat';
  bool get bodyMediumIsCustom => false;
  TextStyle get bodyMedium => GoogleFonts.montserrat(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
      );
  String get bodySmallFamily => 'Montserrat';
  bool get bodySmallIsCustom => false;
  TextStyle get bodySmall => GoogleFonts.montserrat(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 12.0,
      );
}

class DarkModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF34A2DC);
  late Color secondary = const Color(0xFF347EF4);
  late Color tertiary = const Color(0xFFEE8B60);
  late Color alternate = const Color(0xFFE0E3E7);
  late Color primaryText = const Color(0xFFFFFFFF);
  late Color secondaryText = const Color(0xFF77819C);
  late Color primaryBackground = const Color(0xFF090E29);
  late Color secondaryBackground = const Color(0xFF0C1547);
  late Color accent1 = const Color(0x4C4B39EF);
  late Color accent2 = const Color(0x4D39D2C0);
  late Color accent3 = const Color(0x4DEE8B60);
  late Color accent4 = const Color(0xCCFFFFFF);
  late Color success = const Color(0xFF249689);
  late Color warning = const Color(0xFFF9CF58);
  late Color error = const Color(0xFFFF5963);
  late Color info = const Color(0xFFFFFFFF);

  late Color inputAccent = const Color(0xFF34A2DC);
  late Color button10 = const Color(0x1A34A2DC);
  late Color iconInactive = const Color(0xFFC3C3C3);
  late Color containerAccent = const Color(0xFF1C3CBE);
  late Color bottomBackground = const Color(0xFF242B47);
  late Color inputBorder = const Color(0xFF3A4657);
  late Color gradient1n1 = const Color(0xFF5311AC);
  late Color gradient1n2 = const Color(0xFF7F34DC);
  late Color gradient2n1 = const Color(0xFF0A4C47);
  late Color gradient2n2 = const Color(0xFF38EF7D);
  late Color gradient3n1 = const Color(0xFFF12711);
  late Color gradient3n2 = const Color(0xFFF5AF19);
  late Color gradient4n1 = const Color(0xFF724DD9);
  late Color gradient4n2 = const Color(0xFFF08A93);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    TextStyle? font,
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = false,
    TextDecoration? decoration,
    double? lineHeight,
    List<Shadow>? shadows,
    String? package,
  }) {
    if (useGoogleFonts && fontFamily != null) {
      font = GoogleFonts.getFont(fontFamily,
          fontWeight: fontWeight ?? this.fontWeight,
          fontStyle: fontStyle ?? this.fontStyle);
    }

    return font != null
        ? font.copyWith(
            color: color ?? this.color,
            fontSize: fontSize ?? this.fontSize,
            letterSpacing: letterSpacing ?? this.letterSpacing,
            fontWeight: fontWeight ?? this.fontWeight,
            fontStyle: fontStyle ?? this.fontStyle,
            decoration: decoration,
            height: lineHeight,
            shadows: shadows,
          )
        : copyWith(
            fontFamily: fontFamily,
            package: package,
            color: color,
            fontSize: fontSize,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            decoration: decoration,
            height: lineHeight,
            shadows: shadows,
          );
  }
}
