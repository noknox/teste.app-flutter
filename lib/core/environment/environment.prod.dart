import 'package:teste_app_flutter/core/environment/environment.dart';

class ProductionEnvironment extends Environment {
	ProductionEnvironment() : super(
		isProduction: true
	);
}