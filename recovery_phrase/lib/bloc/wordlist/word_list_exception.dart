
class WordListApiException implements Exception {
  final int status;

  WordListApiException(this.status);
}