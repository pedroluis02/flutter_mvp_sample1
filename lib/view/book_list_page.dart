import 'package:flutter/material.dart';

import '../model/book_list.dart';
import '../routes.dart';
import '../model/book.dart';
import '../presenter/book_list_presenter.dart';
import '../view/base_stateful_page.dart';

class BookListPage extends StatefulWidget {

  @override
  _State createState() => _State();

}

class _State extends PageStateNavbar<BookListPage> implements BookListView {

  BookListPresenter presenter;
  BookList bookList;

  _State() : super(title: 'Books');
  
  @override
  void initState() {
    super.initState();

    presenter = BookListPresenter(this);
    bookList = BookList();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      afterUILoaded();
    });
  }

  void afterUILoaded() {
    presenter.loadBooks();
  }

  @override
  Widget buildPage(BuildContext context) {
    return Column(
      children: [
        Text('My list of books'),
        SizedBox(height: 12),
        Expanded(
          child: _createContentView(),
        ),
        SizedBox(height: 12),
        _createAddButton(),
      ],
    );
  }

  Widget _createContentView() {
    if (bookList.isEmpty) {
      return _createEmptyView();
    }

    return _createListView();
  }

  Widget _createEmptyView() {
    return Center(
      child: Text('Empty list'),
    );
  }

  Widget _createListView() {
    final list = bookList.list;

    return ListView.separated(
      itemCount: list.length,
      separatorBuilder: (_, __) => _createSerpartorView(),
      itemBuilder: (_, index) => _createItemView(list[index]),  
    );
  }

  Widget _createSerpartorView() {
    return Divider(
      color: Colors.transparent,
    );
  }

  Widget _createItemView(Book book) {
    return Row(
      children: [
        Icon(Icons.book, size: 24),
        SizedBox(width: 8),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             Text(book.title ?? '', style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold)),
             SizedBox(height: 4),
              Text(book.author ?? '', style: Theme.of(context).textTheme.bodyText2),
          ],
        ),
      ],
    );
  }

  Widget _createAddButton() {
    return ElevatedButton(
      child: Text('New book'),
      onPressed: _onNewClicked,
    );
  }

  void _onNewClicked() async {
    await Navigator.pushNamed(context, MainRoutes.new_book);

    presenter.loadBooks();
  }

  @override
  void updateBookListView(BookList bookList) {
    setState(() {
      this.bookList = bookList;
    });
  }

}