import 'package:cup_flutter_app/app/models/groups_stickers.dart';
import 'package:cup_flutter_app/app/pages/my_stickers/view/my_sticker_view_impl.dart';

abstract class MyStickerView {
  void loadedPage(List<GroupsStickers> album);
  void error(String message);
  void updateStatusFilter(StatusFilter status);
  void updateAlbum(List<GroupsStickers> album);
}
