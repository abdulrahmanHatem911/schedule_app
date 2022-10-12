import '../network/error_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;
  ServerException({
    required this.errorMessageModel,
  });
}
