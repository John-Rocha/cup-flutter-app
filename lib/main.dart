import 'package:cup_flutter_app/app/core/config/env/env.dart';
import 'package:cup_flutter_app/app/fwc_album_app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await Env.instance.load();
  runApp(const FwcAlbumApp());
}
