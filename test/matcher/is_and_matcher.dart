import 'package:flutter_test/flutter_test.dart';

class IsAnd<T> extends Matcher {
  final bool Function(T) validateValue;

  IsAnd(this.validateValue);

  bool matches(item, Map matchState) {
    return item is T && this.validateValue(item);
  }

  Description describe(Description description) {
    description.add('Instance of \'$T\' ');
    description.add('and contain expected value ');
    return description;
  }
}
