abstract class Failure {
  final dynamic error;
  final String code;

  Failure({this.code, this.error});

  @override
  bool operator ==(other) =>
      other is Failure && other.code == code && other.error == error;
}

class UnknownFailure extends Failure {
  static final String _code = 'UNKNOWN';

  UnknownFailure(dynamic err) : super(code: _code, error: err);
}

class ServerConnectionFailure extends Failure {}

class InvalidDataOriginFailure extends Failure {}

class InvalidParamFailure extends Failure {}
