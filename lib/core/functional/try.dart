import 'package:dartz/dartz.dart';
import 'package:teste_app_flutter/core/functional/failure.dart';

abstract class Try<T> extends Either<Failure, T> {
  static Try<T> success<T>(T data) => Success(data);

  static Try<T> reject<T>(Failure error) => Rejection(error);

  B foldAlong<B, A>(Try<A> t, B Function(Failure l) ifLeft,
          B Function(T r, A r2) ifRight) =>
      fold(
          (err) => ifLeft(err),
          (res) =>
              t.fold((err2) => ifLeft(err2), (res2) => ifRight(res, res2)));

  Try<O> transform<O>({O data}) =>
      this.fold((err) => Rejection<O>(err), (_) => Success<O>(data));

  static B foldAll<B>(List<Try> tries, B Function(Failure l) ifLeft,
      B Function(List<Object> data) ifRight) {
    if (tries.length == 0) ifRight([]);
    final data = [];
    for (var it in tries) {
      if (it is Success) {
        data.add(it.get());
      } else if (it is Rejection) {
        final error = it.get();
        return ifLeft(error);
      }
    }
    return ifRight(data);
  }
}

class Success<T> extends Try<T> {
  final T _data;

  Success(this._data);

  @override
  bool operator ==(other) => other is Success && other._data == _data;

  @override
  int get hashCode => _data.hashCode;

  @override
  B fold<B>(B Function(Failure l) ifLeft, B Function(T r) ifRight) =>
      ifRight(this._data);

  T get() => _data;
}

class Rejection<T> extends Try<T> {
  final Failure _error;

  Rejection(this._error);

  @override
  B fold<B>(B Function(Failure l) ifLeft, B Function(T r) ifRight) =>
      ifLeft(this._error);

  @override
  bool operator ==(other) => other is Rejection && other._error == _error;

  @override
  int get hashCode => _error.hashCode;

  Failure get() => _error;
}
