class AppExceptions implements Exception {
  final String? _message;
  final String? _prefix;
  AppExceptions([this._prefix, this._message]);
  @override
  String toString() {
    return '$_prefix$_message';
  }
}

class InternetException extends AppExceptions {
  InternetException([String? message]) : super(message, 'No Internet');
}

class RequestTimeOut extends AppExceptions {
  RequestTimeOut([String? message]) : super(message, 'Request time out');
}

class ServerExeption extends AppExceptions {
  ServerExeption([String? message]) : super(message, 'Internal server error');
}
