import 'package:meta/meta.dart';
abstract class Environment {
	final bool isProduction;

	Environment({@required this.isProduction});
}