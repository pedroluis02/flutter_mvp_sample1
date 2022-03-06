import 'package:flutter/material.dart';

import 'routes.dart';
import 'view/book_list_page.dart';
import 'view/new_book_page.dart';
import 'view/splash_page.dart';

void main() {
  runApp(MainApplication());
}

class MainApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books MVP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: _createRoutes(),
      home: SplashPage(),
    );
  }

  Map<String, WidgetBuilder> _createRoutes() {
    return {
      MainRoutes.home: (_) => BookListPage(),
      MainRoutes.new_book: (_) => NewBookPage(),
    };
  }
}
