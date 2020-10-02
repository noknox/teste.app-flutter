import 'package:teste_app_flutter/core/environment/environment.dart';

class DevelopmentEnvironment extends Environment {
	DevelopmentEnvironment() : super(
		isProduction: false
	);
}
