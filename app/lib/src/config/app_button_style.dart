// ignore_for_file: constant_identifier_names, unused_element
part of 'app_theme.dart';

class AppButtonStyle {
  static ButtonStyle? get filledButtonStyle => ButtonStyle(
        shape: MaterialStateProperty.resolveWith<OutlinedBorder?>(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppThemeExt.of.majorScale(1)),
          ),
        ),
        iconColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) => AppColors.of.neutralColor[1],
        ),
        iconSize: MaterialStateProperty.resolveWith<double?>(
          (Set<MaterialState> states) => AppThemeExt.of.majorScale(4),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.of.neutralColor[5];
            }
            return AppColors.of.primaryColor;
          },
        ),
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) => AppColors.of.primaryColor[6],
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) => AppColors.of.neutralColor[1],
        ),
      );

  static ButtonStyle? get filledButtonDangerStyle =>
      filledButtonStyle?.copyWith(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.of.neutralColor[5];
            }
            return AppColors.of.errorColor;
          },
        ),
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) => AppColors.of.errorColor[6],
        ),
      );

  static ButtonStyle? get textButtonStyle => ButtonStyle(
        shape: MaterialStateProperty.resolveWith<OutlinedBorder?>(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppThemeExt.of.majorScale(1)),
          ),
        ),
        iconColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.focused)) {
              return AppColors.of.primaryColor[6];
            }
            if (states.contains(MaterialState.hovered)) {
              return AppColors.of.primaryColor[6];
            }
            if (states.contains(MaterialState.pressed)) {
              return AppColors.of.primaryColor[6];
            }
            if (states.contains(MaterialState.disabled)) {
              return AppColors.of.neutralColor[5];
            }
            return AppColors.of.primaryColor;
          },
        ),
        iconSize: MaterialStateProperty.resolveWith<double?>(
          (Set<MaterialState> states) => AppThemeExt.of.majorScale(4),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) => Colors.transparent,
        ),
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) => AppColors.of.neutralColor[3],
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.focused)) {
              return AppColors.of.primaryColor[6];
            }
            if (states.contains(MaterialState.hovered)) {
              return AppColors.of.primaryColor[6];
            }
            if (states.contains(MaterialState.pressed)) {
              return AppColors.of.primaryColor[6];
            }
            if (states.contains(MaterialState.disabled)) {
              return AppColors.of.neutralColor[5];
            }
            return AppColors.of.primaryColor;
          },
        ),
      );
  static ButtonStyle? get textButtonDangerStyle => textButtonStyle?.copyWith(
        iconColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.focused)) {
              return AppColors.of.errorColor[6];
            }
            if (states.contains(MaterialState.hovered)) {
              return AppColors.of.errorColor[6];
            }
            if (states.contains(MaterialState.pressed)) {
              return AppColors.of.errorColor[6];
            }
            if (states.contains(MaterialState.disabled)) {
              return AppColors.of.neutralColor[5];
            }
            return AppColors.of.errorColor;
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.focused)) {
              return AppColors.of.errorColor[6];
            }
            if (states.contains(MaterialState.hovered)) {
              return AppColors.of.errorColor[6];
            }
            if (states.contains(MaterialState.pressed)) {
              return AppColors.of.errorColor[6];
            }
            if (states.contains(MaterialState.disabled)) {
              return AppColors.of.neutralColor[5];
            }
            return AppColors.of.errorColor;
          },
        ),
      );

  static ButtonStyle? get outlinedButtonStyle => ButtonStyle(
        shape: MaterialStateProperty.resolveWith<OutlinedBorder?>(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppThemeExt.of.majorScale(1)),
          ),
        ),
        side: MaterialStateProperty.resolveWith<BorderSide?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.focused)) {
              return BorderSide(color: AppColors.of.primaryColor);
            }
            if (states.contains(MaterialState.hovered)) {
              return BorderSide(color: AppColors.of.primaryColor);
            }
            if (states.contains(MaterialState.pressed)) {
              return BorderSide(color: AppColors.of.primaryColor);
            }
            if (states.contains(MaterialState.disabled)) {
              return BorderSide(color: AppColors.of.neutralColor[3]!);
            }
            return BorderSide(color: AppColors.of.neutralColor[4]!);
          },
        ),
        iconColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.focused)) {
              return AppColors.of.primaryColor;
            }
            if (states.contains(MaterialState.hovered)) {
              return AppColors.of.primaryColor;
            }
            if (states.contains(MaterialState.pressed)) {
              return AppColors.of.primaryColor;
            }
            if (states.contains(MaterialState.disabled)) {
              return AppColors.of.neutralColor[5];
            }
            return AppColors.of.neutralColor;
          },
        ),
        iconSize: MaterialStateProperty.resolveWith<double?>(
          (Set<MaterialState> states) => AppThemeExt.of.majorScale(4),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) => AppColors.of.neutralColor[1],
        ),
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) => Colors.transparent,
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.focused)) {
              return AppColors.of.primaryColor;
            }
            if (states.contains(MaterialState.hovered)) {
              return AppColors.of.primaryColor;
            }
            if (states.contains(MaterialState.pressed)) {
              return AppColors.of.primaryColor;
            }
            if (states.contains(MaterialState.disabled)) {
              return AppColors.of.neutralColor[5];
            }
            return AppColors.of.neutralColor;
          },
        ),
      );

  static ButtonStyle? get outlinedButtonDangerStyle =>
      outlinedButtonStyle?.copyWith(
        side: MaterialStateProperty.resolveWith<BorderSide?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.focused)) {
              return BorderSide(color: AppColors.of.errorColor[6]!);
            }
            if (states.contains(MaterialState.hovered)) {
              return BorderSide(color: AppColors.of.errorColor[6]!);
            }
            if (states.contains(MaterialState.pressed)) {
              return BorderSide(color: AppColors.of.errorColor[6]!);
            }
            if (states.contains(MaterialState.disabled)) {
              return BorderSide(color: AppColors.of.neutralColor[3]!);
            }
            return BorderSide(color: AppColors.of.errorColor);
          },
        ),
        iconColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.focused)) {
              return AppColors.of.errorColor[6];
            }
            if (states.contains(MaterialState.hovered)) {
              return AppColors.of.errorColor[6];
            }
            if (states.contains(MaterialState.pressed)) {
              return AppColors.of.errorColor[6];
            }
            if (states.contains(MaterialState.disabled)) {
              return AppColors.of.neutralColor[5];
            }
            return AppColors.of.errorColor;
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.focused)) {
              return AppColors.of.errorColor[6];
            }
            if (states.contains(MaterialState.hovered)) {
              return AppColors.of.errorColor[6];
            }
            if (states.contains(MaterialState.pressed)) {
              return AppColors.of.errorColor[6];
            }
            if (states.contains(MaterialState.disabled)) {
              return AppColors.of.neutralColor[5];
            }
            return AppColors.of.errorColor;
          },
        ),
      );
}
