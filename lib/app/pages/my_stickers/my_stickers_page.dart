import 'package:cup_flutter_app/app/pages/my_stickers/view/my_sticker_view_impl.dart';
import 'package:flutter/material.dart';

import 'package:cup_flutter_app/app/pages/my_stickers/presenter/my_stickers_presenter.dart';
import 'package:cup_flutter_app/app/pages/my_stickers/widgets/sticker_group_filter_widget.dart';
import 'package:cup_flutter_app/app/pages/my_stickers/widgets/sticker_group_widget.dart';

import 'widgets/sticker_status_filter_widget.dart';

class MyStickersPage extends StatefulWidget {
  final MyStickersPresenter presenter;

  const MyStickersPage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<MyStickersPage> createState() => _MyStickersPageState();
}

class _MyStickersPageState extends MyStickerViewImpl {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas figurinhas'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(children: [
              StickerStatusFilterWidget(
                filterSelected: statusFilter,
              ),
              StickerGroupFilterWidget(countries: countries),
            ]),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final group = album[index];
                return StickerGroupWidget(
                  group: group,
                  statusFilter: statusFilter,
                );
              },
              childCount: album.length,
            ),
          ),
        ],
      ),
    );
  }
}
