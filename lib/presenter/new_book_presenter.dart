import '../data/local_repository.dart';
import '../model/book.dart';

abstract class NewBookView {

  void onSuccessulSaved();

}

class NewBookPresenter {

  final NewBookView view;

  NewBookPresenter(this.view);

  void onSaveCliked(String title, String author) {
    final book = Book(title, author);
    LocalRepository.addBook(book);

    view.onSuccessulSaved();
  }

}