import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:trickster/core/error/errors.dart';
import 'package:trickster/core/error/exceptions.dart';
import 'package:trickster/core/model/i_validatable.dart';

@immutable
abstract class ValueObject<T> implements IValidatable {
  const ValueObject();
  Either<ValueException<T>, T> get value;

  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  T getOrElse(T dflt) {
    return value.getOrElse(() => dflt);
  }

  Either<ValueException<dynamic>, Unit> get failureOrUnit {
    return value.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  @override
  bool isValid() {
    return value.isRight();
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}




