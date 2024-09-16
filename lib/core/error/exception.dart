class ServerException implements Exception {
  final String message;

  ServerException({required this.message});
}

class GeneralException implements Exception {
  final String message;

  GeneralException({required this.message});
}