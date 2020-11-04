import 'package:freezed_annotation/freezed_annotation.dart';

part 'exceptions.freezed.dart';


@freezed
abstract class ValueException <T> with _$ValueException<T> {
  const factory ValueException.exceedingLength({
    @required T failedValue,
    @required int max,
  }) = ExceedingLength<T>;
  const factory ValueException.empty({
    @required T failedValue,
  }) = Empty<T>;
  const factory ValueException.multiline({
    @required T failedValue,
  }) = Multiline<T>;
  const factory ValueException.listTooLong({
    @required T failedValue,
    @required int max,
  }) = ListTooLong<T>;
  const factory ValueException.invalidEmail({
    @required T failedValue,
  }) = InvalidEmail<T>;
  const factory ValueException.shortPassword({
    @required T failedValue,
  }) = ShortPassword<T>;
  const factory ValueException.invalidPhoneNumber({
    @required T failedValue,
  }) = InvalidPhoneNumber<T>;
}
