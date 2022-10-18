import 'package:cup_flutter_app/app/core/ui/helpers/loader.dart';
import 'package:cup_flutter_app/app/core/ui/helpers/messages.dart';
import 'package:cup_flutter_app/app/models/user_model.dart';
import 'package:cup_flutter_app/app/pages/home/home_page.dart';
import 'package:flutter/widgets.dart';

import './home_view.dart';

abstract class HomeViewImpl extends State<HomePage>
    with Loader<HomePage>, Messages<HomePage>
    implements HomeView {
  UserModel? userModel;

  @override
  void initState() {
    widget.presenter.view = this;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.presenter.getUserData();
    });
    super.initState();
  }

  @override
  void error(String message) {
    hideLoader();
    showError(message);
  }

  @override
  void logoutSuccess() {
    hideLoader();
    Navigator.of(context).pushNamedAndRemoveUntil(
      '/auth/login',
      (route) => false,
    );
  }

  @override
  void updateUser(UserModel userModel) {
    hideLoader();
    setState(() {
      this.userModel = userModel;
    });
  }
}
