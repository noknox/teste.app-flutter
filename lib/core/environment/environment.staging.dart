import 'package:teste_app_flutter/core/environment/environment.dart';

class StagingEnvironment extends Environment {
	StagingEnvironment() : super(
		isProduction: true
	);
}