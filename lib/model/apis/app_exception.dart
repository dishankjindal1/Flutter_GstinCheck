abstract class AppException implements Exception{
  String? _prefix;
  String? _message;

  AppException(this._prefix, this._message);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException(String? message) : super("Error During Communication : ", message);
}

class NotFoundException extends AppException {
  NotFoundException(String? message) : super("Page Not Found : ", message);
}

class UnauthorizedException extends AppException {
  UnauthorizedException(String? message) : super("Client not Authorized : ", message);
}

class BadRequestException extends AppException {
  BadRequestException(String? message) : super("Client BadRequest Error : ", message);
}

class ServiceUnavailableException extends AppException {
  ServiceUnavailableException(String? message) : super("Service unavailable Error : ", message);
}