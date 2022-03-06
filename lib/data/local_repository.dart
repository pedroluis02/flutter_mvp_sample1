import '../model/book.dart';
import '../model/book_list.dart';

class LocalRepository {

  static final _books = BookList();

  LocalRepository._();

  static void addBook(Book book) => _books.add(book);

  static BookList getBookList() => _books;

}