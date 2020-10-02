import 'package:dartz/dartz.dart';
import 'package:teste_app_flutter/core/functional/failure.dart';
import 'package:teste_app_flutter/core/functional/try.dart';

extension EitherExtension on Either {
  Try<T> toTry<T>() => this.fold((l) {
        if (l is Failure) {
          return new Rejection(l);
        } else {
          return new Rejection(null);
        }
      }, (r) => Success(r));
}
