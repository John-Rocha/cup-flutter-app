import 'package:cup_flutter_app/app/models/groups_stickers.dart';
import 'package:cup_flutter_app/app/pages/my_stickers/view/my_sticker_view.dart';
import 'package:cup_flutter_app/app/pages/my_stickers/view/my_sticker_view_impl.dart';
import 'package:cup_flutter_app/app/repository/stickers/stickers_repository.dart';

import './my_stickers_presenter.dart';

class MyStickersPresenterImpl implements MyStickersPresenter {
  final StickersRepository stickersRepository;
  late final MyStickerView _view;

  var album = <GroupsStickers>[];
  var statusSelected = StatusFilter.all;
  List<String>? countries;

  MyStickersPresenterImpl({
    required this.stickersRepository,
  });

  @override
  Future<void> getMyAlbum() async {
    album = await stickersRepository.getMyAlbum();
    _view.loadedPage([...album]);
  }

  @override
  set view(MyStickerView view) => _view = view;

  @override
  Future<void> statusFilter(StatusFilter status) async {
    statusSelected = status;
    _view.updateStatusFilter(status);
  }

  @override
  void countryFilter(List<String>? countries) {
    this.countries = countries;
    if (countries == null) {
      _view.updateAlbum(album);
    } else {
      // Atualizar a minha lista filtrando todos os grupos selecionados
      final albumFilter = [
        ...album.where(
          (element) => countries.contains(element.countryCode),
        )
      ];
      _view.updateAlbum(albumFilter);
    }
  }
}
