import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_color_schemes.dart';
import 'app_text_themes.dart';


class AppThemeData {
  // --------------------------------------
// Light Theme Data
// --------------------------------------
  static final lightThemeData = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: CupertinoColors.systemGrey6,
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(9),
      ),
      color: AppColorSchemes.lightColorScheme.surface,
      margin: EdgeInsets.zero,
    ),
    colorScheme: AppColorSchemes.lightColorScheme,
    textTheme: AppTextThemes.lightTextTheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColorSchemes.lightColorScheme.primary,
      foregroundColor: AppColorSchemes.lightColorScheme.onPrimary,
      elevation: 0,
      titleTextStyle: AppTextThemes.lightTextTheme.titleLarge
          ?.copyWith(color: AppColorSchemes.lightColorScheme.onPrimary),
      iconTheme: IconThemeData(
        color: AppColorSchemes.lightColorScheme.onPrimary,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: const WidgetStatePropertyAll(1),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        backgroundColor: WidgetStateProperty.resolveWith(
          (states) {
            return states.contains(WidgetState.disabled)
                ? AppColorSchemes.lightColorScheme.outline.withOpacity(0.5)
                : AppColorSchemes.lightColorScheme.primary;
          },
        ),
        foregroundColor: WidgetStatePropertyAll(AppColorSchemes.lightColorScheme.onPrimary),
        shadowColor: const WidgetStatePropertyAll(Colors.transparent),
        textStyle: WidgetStatePropertyAll(
          AppTextThemes.lightTextTheme.titleMedium
              ?.copyWith(color: AppColorSchemes.lightColorScheme.onTertiary),
        ),
        overlayColor: WidgetStateProperty.resolveWith(
          (states) {
            return states.contains(WidgetState.pressed)
                ? AppColorSchemes.lightColorScheme.tertiary.withOpacity(0.2)
                : null;
          },
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      hintStyle: AppTextThemes.lightTextTheme.bodyMedium?.copyWith(
        color: AppColorSchemes.lightColorScheme.outline.withOpacity(0.5),
      ),
      errorStyle: AppTextThemes.lightTextTheme.labelMedium?.copyWith(
        color: AppColorSchemes.lightColorScheme.error,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(

          color: AppColorSchemes.lightColorScheme.outline.withOpacity(0.5),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColorSchemes.lightColorScheme.outline.withOpacity(0.5),
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColorSchemes.lightColorScheme.outline.withOpacity(.5)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColorSchemes.lightColorScheme.outline ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColorSchemes.lightColorScheme.error),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 0),
      labelStyle: AppTextThemes.lightTextTheme.bodyMedium?.copyWith(
        color: AppColorSchemes.lightColorScheme.outline.withOpacity(0.7),
      ),
      prefixIconColor: WidgetStateColor.resolveWith(
        (states) {
          return states.contains(WidgetState.focused)
              ? AppColorSchemes.lightColorScheme.onSurface
              : AppColorSchemes.lightColorScheme.outline.withOpacity(0.7);
        },
      ),
      suffixIconColor: WidgetStateColor.resolveWith(
        (states) {
          return states.contains(WidgetState.focused)
              ? AppColorSchemes.lightColorScheme.onSurface
              : AppColorSchemes.lightColorScheme.outline.withOpacity(0.7);
        },
      ),
    ),
  );

// --------------------------------------
// Dark Theme Data
// --------------------------------------
  static final darkThemeData = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.black45,
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(9),
      ),
      color: AppColorSchemes.darkColorScheme.surface,
      margin: EdgeInsets.zero,
    ),
    colorScheme: AppColorSchemes.darkColorScheme,
    textTheme: AppTextThemes.darkTextTheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColorSchemes.darkColorScheme.primary,
      foregroundColor: AppColorSchemes.darkColorScheme.onPrimary,
      elevation: 0,
      titleTextStyle: AppTextThemes.darkTextTheme.titleLarge
          ?.copyWith(color: AppColorSchemes.lightColorScheme.onPrimary),
      shape: const LinearBorder(),
      iconTheme: IconThemeData(
        color: AppColorSchemes.darkColorScheme.onPrimary,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: const WidgetStatePropertyAll(1),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          ),
        ),
        backgroundColor: WidgetStateProperty.resolveWith(
          (states) {
            return states.contains(WidgetState.disabled)
                ? AppColorSchemes.darkColorScheme.outline.withOpacity(0.5)
                : AppColorSchemes.darkColorScheme.primary;
          },
        ),
        foregroundColor: WidgetStatePropertyAll(AppColorSchemes.darkColorScheme.onPrimary),
        shadowColor: const WidgetStatePropertyAll(Colors.transparent),
        textStyle: WidgetStatePropertyAll(
          AppTextThemes.darkTextTheme.titleMedium
              ?.copyWith(color: AppColorSchemes.darkColorScheme.onPrimary),
        ),
        overlayColor: WidgetStateProperty.resolveWith(
          (states) {
            return states.contains(WidgetState.pressed)
                ? AppColorSchemes.darkColorScheme.tertiary.withOpacity(0.2)
                : null;
          },
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      hintStyle: AppTextThemes.darkTextTheme.bodyMedium?.copyWith(
        color: AppColorSchemes.darkColorScheme.outline.withOpacity(0.7),
      ),
      errorStyle: AppTextThemes.darkTextTheme.labelMedium?.copyWith(
        color: AppColorSchemes.darkColorScheme.error,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: BorderSide(
          color: AppColorSchemes.darkColorScheme.outline.withOpacity(0.7),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: BorderSide(
          color: AppColorSchemes.darkColorScheme.outline.withOpacity(0.7),
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: BorderSide(color: AppColorSchemes.darkColorScheme.outline.withOpacity(0.7)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: BorderSide(color: AppColorSchemes.darkColorScheme.primary),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: BorderSide(color: AppColorSchemes.darkColorScheme.error),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      labelStyle: AppTextThemes.darkTextTheme.bodyMedium?.copyWith(
        color: AppColorSchemes.darkColorScheme.outline.withOpacity(0.7),
      ),
      prefixIconColor: WidgetStateColor.resolveWith(
            (states) {
          return states.contains(WidgetState.focused)
              ? AppColorSchemes.lightColorScheme.onSurface
              : AppColorSchemes.lightColorScheme.outline.withOpacity(0.7);
        },
      ),
      suffixIconColor: WidgetStateColor.resolveWith(
            (states) {
          return states.contains(WidgetState.focused)
              ? AppColorSchemes.lightColorScheme.onSurface
              : AppColorSchemes.lightColorScheme.outline.withOpacity(0.7);
        },
      ),
    ),
  );
}
