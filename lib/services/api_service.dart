class Apis {
  static const String baseUrl = 'http://127.0.0.1:8000/api';

  static const String register = '$baseUrl/register';
  static const String login = '$baseUrl/login';
  static const String logout = '$baseUrl/logout';

  static const String profile = '$baseUrl/profile';

  static const String books = '$baseUrl/books';
  static String bookDetail(String id) => '$books/$id';

  static const String categories = '$baseUrl/categories';
  static String categoryDetail(String id) => '$categories/$id';

  static const String authors = '$baseUrl/authors';
  static String authorDetail(String id) => '$authors/$id';

  static const String publishers = '$baseUrl/publishers';
  static String publisherDetail(String id) => '$publishers/$id';

  static String startReading(String bookId) => '$baseUrl/read/$bookId/start';
  static String finishReading(String borrowingId) => '$baseUrl/read/$borrowingId/finish';
  static String readBookPage(String bookId, String page) => '$baseUrl/read/$bookId/$page';

  static const String readingHistories = '$baseUrl/reading-histories';

  static const String favorites = '$baseUrl/favorites';
  static const String wishlists = '$baseUrl/wishlists';
  static const String bookmarks = '$baseUrl/bookmarks';
}