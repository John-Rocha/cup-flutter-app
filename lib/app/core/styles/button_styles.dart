import 'package:cup_flutter_app/app/core/styles/colors_app.dart';
import 'package:cup_flutter_app/app/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class ButtonStyles {
  static ButtonStyles? _instance;

  ButtonStyles._();
  static ButtonStyles get instance {
    _instance ??= ButtonStyles._();
    return _instance!;
  }

  ButtonStyle get yellowButton => ElevatedButton.styleFrom(
        backgroundColor: ColorsApp.instance.yellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        textStyle: TextStyles.instance.textSecondaryFontExtraBold.copyWith(
          fontSize: 14,
        ),
      );

  ButtonStyle get yellowOutlineButton => OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        side: BorderSide(
          color: ColorsApp.instance.yellow,
        ),
        textStyle: TextStyles.instance.textSecondaryFontExtraBold.copyWith(
          fontSize: 14,
        ),
      );

  ButtonStyle get primaryButton => ElevatedButton.styleFrom(
        backgroundColor: ColorsApp.instance.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        textStyle: TextStyles.instance.textSecondaryFontExtraBold.copyWith(
          fontSize: 14,
        ),
      );

  ButtonStyle get primaryOutlineButton => OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        side: BorderSide(
          color: ColorsApp.instance.primary,
        ),
        textStyle: TextStyles.instance.textSecondaryFontExtraBold.copyWith(
          fontSize: 14,
        ),
      );
}

extension ButtonStylesExtensions on BuildContext {
  ButtonStyles get buttonStyles => ButtonStyles.instance;
}
