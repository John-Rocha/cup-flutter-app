import 'package:cup_flutter_app/app/core/mvp/fwc_presenter.dart';
import 'package:cup_flutter_app/app/pages/my_stickers/view/my_sticker_view.dart';

import '../view/my_sticker_view_impl.dart';

abstract class MyStickersPresenter extends FwcPresenter<MyStickerView> {
  Future<void> getMyAlbum();
  Future<void> statusFilter(StatusFilter status);
  void countryFilter(List<String>? countries);
}
