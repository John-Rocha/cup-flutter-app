import 'package:cup_flutter_app/app/core/ui/styles/button_styles.dart';
import 'package:cup_flutter_app/app/core/ui/styles/colors_app.dart';
import 'package:cup_flutter_app/app/core/ui/styles/text_styles.dart';
import 'package:cup_flutter_app/app/core/ui/widgets/button.dart';
import 'package:cup_flutter_app/app/pages/my_stickers/presenter/my_stickers_presenter.dart';
import 'package:cup_flutter_app/app/pages/my_stickers/view/my_sticker_view_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class StickerStatusFilterWidget extends StatelessWidget {
  final StatusFilter filterSelected;

  const StickerStatusFilterWidget({
    super.key,
    required this.filterSelected,
  });

  @override
  Widget build(BuildContext context) {
    final presenter = context.get<MyStickersPresenter>();
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 5,
        children: [
          Button(
            width: MediaQuery.of(context).size.width * .3,
            style: filterSelected == StatusFilter.all
                ? context.buttonStyles.yellowButton
                : context.buttonStyles.primaryButton,
            labelStyle: filterSelected == StatusFilter.all
                ? context.textStyles.textSecondaryFontMedium.copyWith(
                    color: context.colors.primary,
                  )
                : context.textStyles.textSecondaryFontMedium,
            label: 'Todas',
            onPressed: () => presenter.statusFilter(StatusFilter.all),
          ),
          Button(
            width: MediaQuery.of(context).size.width * .3,
            style: filterSelected == StatusFilter.missing
                ? context.buttonStyles.yellowButton
                : context.buttonStyles.primaryButton,
            labelStyle: filterSelected == StatusFilter.missing
                ? context.textStyles.textSecondaryFontMedium.copyWith(
                    color: context.colors.primary,
                  )
                : context.textStyles.textSecondaryFontMedium,
            label: 'Faltando',
            onPressed: () => presenter.statusFilter(StatusFilter.missing),
          ),
          Button(
            width: MediaQuery.of(context).size.width * .3,
            style: filterSelected == StatusFilter.repeated
                ? context.buttonStyles.yellowButton
                : context.buttonStyles.primaryButton,
            labelStyle: filterSelected == StatusFilter.repeated
                ? context.textStyles.textSecondaryFontMedium.copyWith(
                    color: context.colors.primary,
                  )
                : context.textStyles.textSecondaryFontMedium,
            label: 'Repetidas',
            onPressed: () => presenter.statusFilter(StatusFilter.repeated),
          ),
        ],
      ),
    );
  }
}
