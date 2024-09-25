class ServerException implements Exception {
  final String message;

  const ServerException({required this.message});
}

class GeneralException implements Exception {
  final String message;

  const GeneralException({required this.message});
}