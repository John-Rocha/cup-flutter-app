import 'package:flutter/material.dart';

import 'widgets/sticker_status_filter_widget.dart';

class MyStickersPage extends StatefulWidget {
  const MyStickersPage({super.key});

  @override
  State<MyStickersPage> createState() => _MyStickersPageState();
}

class _MyStickersPageState extends State<MyStickersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas figurinhas'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                // Status
                StickerStatusFilterWidget(
                  filterSelected: '',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
