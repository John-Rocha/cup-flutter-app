import 'package:cup_flutter_app/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class StickerGroupWidget extends StatelessWidget {
  const StickerGroupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 64,
            child: OverflowBox(
              maxWidth: double.infinity,
              maxHeight: double.infinity,
              child: ClipRect(
                child: Align(
                  alignment: const Alignment(0, -0.2),
                  widthFactor: 1,
                  heightFactor: 0.1,
                  child: Image.asset(
                    'assets/images/flags/BRA.png',
                    cacheWidth: (MediaQuery.of(context).size.width * 3).toInt(),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Brasil',
              style: context.textStyles.titleBlack.copyWith(
                fontSize: 26,
              ),
            ),
          )
        ],
      ),
    );
  }
}
