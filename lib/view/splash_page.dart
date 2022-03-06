import 'dart:async';

import 'package:flutter/material.dart';

import '../view/base_stateful_page.dart';
import '../routes.dart';

class SplashPage extends StatefulWidget {

  @override
  _State createState() => _State();

}

class _State extends PageState<SplashPage> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      afterUILoaded();
    });
  }

  void afterUILoaded() {
    Future.delayed(Duration(seconds: 2), showHomeView);
  }

  void showHomeView() {
    Navigator.pushNamedAndRemoveUntil(
      context, 
      MainRoutes.home,
      (_) => false,
    );
  }

  @override
  Widget buildPage(BuildContext context) {
    return Center(
      child: Text('Loading...'),
    );
  }

}