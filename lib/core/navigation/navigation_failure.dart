import 'package:teste_app_flutter/core/functional/failure.dart';

abstract class NavigationFailure extends Failure {
	NavigationFailure(code, error) : super(code: code, error: error);
}

class InvalidRouteFailure extends NavigationFailure {
	static final String _code = "INVALID_ROUTE_FAILURE";
	InvalidRouteFailure() : super( _code, null);
}