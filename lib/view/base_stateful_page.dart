import 'package:flutter/material.dart';

abstract class PageState<Type extends StatefulWidget> extends State<Type> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: LayoutBuilder(
        builder: (_context,_) => buildPageContainer(context, buildPage(context)),
      ),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return null;
  }

  Widget buildPageContainer(BuildContext context, Widget page) {
    return Container(
      margin: EdgeInsets.all(20),
      child: page,
    );
  }

  Widget buildPage(BuildContext context) {
    return null;
  }

}

abstract class PageStateNavbar<Type extends StatefulWidget> extends PageState<Type>{
  
  final String title;

  PageStateNavbar({this.title});

  @override
  Widget buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(this.title ?? ""),
    );
  }

}