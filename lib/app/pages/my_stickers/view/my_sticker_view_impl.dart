import 'package:cup_flutter_app/app/core/ui/helpers/loader.dart';
import 'package:cup_flutter_app/app/core/ui/helpers/messages.dart';
import 'package:cup_flutter_app/app/models/groups_stickers.dart';
import 'package:cup_flutter_app/app/pages/my_stickers/my_stickers_page.dart';
import 'package:flutter/material.dart';

import './my_sticker_view.dart';

enum StatusFilter {
  all,
  missing,
  repeated,
}

abstract class MyStickerViewImpl extends State<MyStickersPage>
    with Messages<MyStickersPage>, Loader<MyStickersPage>
    implements MyStickerView {
  var album = <GroupsStickers>[];
  var statusFilter = StatusFilter.all;
  var countries = <String, String>{};

  @override
  void initState() {
    widget.presenter.view = this;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showLoader();
      widget.presenter.getMyAlbum();
    });
    super.initState();
  }

  @override
  void error(String message) => showError(message);

  @override
  void loadedPage(List<GroupsStickers> album) {
    hideLoader();
    setState(() {
      this.album = album;
      countries = {
        for (var c in album) c.countryCode: c.countryName,
      };
    });
  }

  @override
  void updateStatusFilter(status) {
    setState(() {
      statusFilter = status;
    });
  }

  @override
  void updateAlbum(List<GroupsStickers> album) {
    hideLoader();
    setState(() {
      this.album = album;
    });
  }
}
