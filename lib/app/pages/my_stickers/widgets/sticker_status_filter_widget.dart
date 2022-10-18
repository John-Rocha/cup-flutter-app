// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cup_flutter_app/app/core/ui/styles/button_styles.dart';
import 'package:cup_flutter_app/app/core/ui/styles/colors_app.dart';
import 'package:cup_flutter_app/app/core/ui/styles/text_styles.dart';
import 'package:cup_flutter_app/app/core/ui/widgets/button.dart';
import 'package:flutter/material.dart';

class StickerStatusFilterWidget extends StatelessWidget {
  final String filterSelected;

  const StickerStatusFilterWidget({
    Key? key,
    required this.filterSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 5,
        children: [
          Button(
            width: MediaQuery.of(context).size.width * .3,
            style: context.buttonStyles.yellowButton,
            labelStyle: context.textStyles.textSecondaryFontMedium.copyWith(
              color: context.colors.primary,
            ),
            label: 'Todas',
            onPressed: () {},
          ),
          Button(
            width: MediaQuery.of(context).size.width * .3,
            style: context.buttonStyles.primaryButton,
            labelStyle: context.textStyles.textSecondaryFontMedium,
            label: 'Faltando',
            onPressed: () {},
          ),
          Button(
            width: MediaQuery.of(context).size.width * .3,
            style: context.buttonStyles.primaryButton,
            labelStyle: context.textStyles.textSecondaryFontMedium,
            label: 'Faltando',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
