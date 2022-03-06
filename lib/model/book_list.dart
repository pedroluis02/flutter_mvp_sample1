import '../model/book.dart';

class BookList {

  final _books = <Book>[];

  BookList();

  void add(Book book) => _books.add(book);

  List<Book> get list => _books;

  bool get isEmpty => list.isEmpty;

}