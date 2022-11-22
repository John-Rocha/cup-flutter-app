import 'package:flutter/material.dart';
import 'package:flutter_awesome_select/flutter_awesome_select.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'package:cup_flutter_app/app/core/ui/styles/colors_app.dart';
import 'package:cup_flutter_app/app/core/ui/styles/text_styles.dart';
import 'package:cup_flutter_app/app/pages/my_stickers/presenter/my_stickers_presenter.dart';

class StickerGroupFilterWidget extends StatefulWidget {
  final Map<String, String> countries;

  const StickerGroupFilterWidget({
    Key? key,
    required this.countries,
  }) : super(key: key);

  @override
  State<StickerGroupFilterWidget> createState() =>
      _StickerGroupFilterWidgetState();
}

class _StickerGroupFilterWidgetState extends State<StickerGroupFilterWidget> {
  List<String>? selected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SmartSelect<String>.multiple(
        title: 'Filtro',
        tileBuilder: (context, state) {
          return InkWell(
            onTap: () {
              state.showModal();
            },
            child: _StickerGroupTile(
              label: state.selected.title?.join(', ') ?? 'Filtro',
              clearCallBack: () {
                setState(() {
                  selected = null;
                  context.get<MyStickersPresenter>().countryFilter(selected);
                });
              },
            ),
          );
        },
        selectedValue: selected ?? [],
        onChange: (selectedValue) {
          setState(() {
            selected = selectedValue.value;
          });
          context.get<MyStickersPresenter>().countryFilter(selected);
        },
        choiceItems: S2Choice.listFrom<String, Map<String, String>>(
          source: widget.countries.entries
              .map((e) => {'value': e.key, 'title': e.value})
              .toList(),
          value: (index, item) => item['value'] ?? '',
          title: (index, item) => item['title'] ?? '',
        ),
        choiceType: S2ChoiceType.switches,
        choiceActiveStyle: S2ChoiceStyle(color: context.colors.primary),
        modalType: S2ModalType.bottomSheet,
        choiceGrouped: true,
        modalFilter: false,
        placeholder: '',
      ),
    );
  }
}

class _StickerGroupTile extends StatelessWidget {
  final String label;
  final VoidCallback clearCallBack;

  const _StickerGroupTile({
    Key? key,
    required this.label,
    required this.clearCallBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0XFFF0F0F0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            const Icon(Icons.filter_list),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                label,
                style: context.textStyles.textSecondaryFontRegular
                    .copyWith(fontSize: 11),
              ),
            ),
            InkWell(
              onTap: clearCallBack,
              child: const Icon(Icons.clear),
            ),
          ],
        ),
      ),
    );
  }
}
