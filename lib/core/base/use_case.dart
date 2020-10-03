import 'package:teste_app_flutter/core/functional/try.dart';

abstract class UseCase<T, P> {
	Future<Try<T>> call(P params);
}

abstract class  UnitUseCase<T> {
	Future<Try<T>> call();
}

abstract class ObservableUseCase<T, P> {
	Stream<Try<T>> call(P params);
}
