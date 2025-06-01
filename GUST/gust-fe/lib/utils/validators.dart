import 'package:formz/formz.dart';

// Email Validator
enum EmailValidationError { empty, invalid }

class EmailValidator extends FormzInput<String, EmailValidationError> {
  const EmailValidator.pure() : super.pure('');
  const EmailValidator.dirty([super.value = '']) : super.dirty();

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  @override
  EmailValidationError? validator(String value) {
    if (value.isEmpty) return EmailValidationError.empty;
    return _emailRegExp.hasMatch(value) ? null : EmailValidationError.invalid;
  }
}

extension EmailValidationErrorX on EmailValidationError {
  String get text {
    switch (this) {
      case EmailValidationError.empty:
        return 'Email is required';
      case EmailValidationError.invalid:
        return 'Invalid email';
    }
  }
}

// Password Validator
enum PasswordValidationError { empty, tooShort }

class PasswordValidator extends FormzInput<String, PasswordValidationError> {
  const PasswordValidator.pure() : super.pure('');
  const PasswordValidator.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) return PasswordValidationError.empty;
    return value.length >= 6 ? null : PasswordValidationError.tooShort;
  }
}

extension PasswordValidationErrorX on PasswordValidationError {
  String get text {
    switch (this) {
      case PasswordValidationError.empty:
        return 'Password is required';
      case PasswordValidationError.tooShort:
        return 'Password must be at least 6 characters';
    }
  }
}

// Required Validator
enum RequiredValidationError { empty }

class RequiredValidator extends FormzInput<String, RequiredValidationError> {
  const RequiredValidator.pure() : super.pure('');
  const RequiredValidator.dirty([super.value = '']) : super.dirty();

  @override
  RequiredValidationError? validator(String value) {
    return value.trim().isEmpty ? RequiredValidationError.empty : null;
  }
}

extension RequiredValidationErrorX on RequiredValidationError {
  String get text {
    switch (this) {
      case RequiredValidationError.empty:
        return 'This field is required';
    }
  }
}

// Number Validator
enum NumberValidationError { empty, invalid, tooSmall, tooBig }

class NumberValidator extends FormzInput<String, NumberValidationError> {
  final int? min;
  final int? max;

  const NumberValidator.pure({this.min, this.max}) : super.pure('');
  const NumberValidator.dirty(String value, {this.min, this.max}) : super.dirty(value);

  @override
  NumberValidationError? validator(String value) {
    if (value.isEmpty) return NumberValidationError.empty;

    final number = int.tryParse(value);
    if (number == null) return NumberValidationError.invalid;

    if (min != null && number < min!) return NumberValidationError.tooSmall;
    if (max != null && number > max!) return NumberValidationError.tooBig;

    return null;
  }
}

extension NumberValidationErrorX on NumberValidationError {
  String text(int? min, int? max) {
    switch (this) {
      case NumberValidationError.empty:
        return 'This field is required';
      case NumberValidationError.invalid:
        return 'Enter a valid number';
      case NumberValidationError.tooSmall:
        return 'Value must be at least $min';
      case NumberValidationError.tooBig:
        return 'Value must be at most $max';
    }
  }
}
