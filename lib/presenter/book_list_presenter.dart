import '../data/local_repository.dart';
import '../model/book_list.dart';

abstract class BookListView {

  void updateBookListView(BookList bookList);

}

class BookListPresenter {

  BookListView view;

  BookListPresenter(this.view);

  void loadBooks() {
    final bookList = LocalRepository.getBookList();
    view.updateBookListView(bookList);
  }

}