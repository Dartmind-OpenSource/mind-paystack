import 'package:freezed_annotation/freezed_annotation.dart';

part 'validation_result.freezed.dart';

/// Represents the result of a validation operation.
///
/// This sealed class provides a type-safe way to handle validation results,
/// ensuring that validation failures are explicitly handled and cannot be
/// ignored.
///
/// ## Usage
///
/// ```dart
/// ValidationResult validateEmail(String email) {
///   if (email.isEmpty) {
///     return ValidationResult.failure('Email is required');
///   }
///   if (!isValidEmail(email)) {
///     return ValidationResult.failure('Invalid email format');
///   }
///   return ValidationResult.success();
/// }
///
/// // Using the result
/// final result = validateEmail(userInput);
/// if (result.isFailure) {
///   showError(result.errorMessage!);
/// }
/// ```
@freezed
class ValidationResult with _$ValidationResult {
  /// Represents a successful validation with no errors.
  const factory ValidationResult.success() = _ValidationSuccess;

  /// Represents a failed validation with an error message.
  ///
  /// [message] Describes what validation rule was violated
  const factory ValidationResult.failure(String message) = _ValidationFailure;

  const ValidationResult._();

  /// Checks if this validation result represents a success.
  bool get isSuccess => when(
        success: () => true,
        failure: (_) => false,
      );

  /// Checks if this validation result represents a failure.
  bool get isFailure => !isSuccess;

  /// Gets the error message if this is a failure, null if success.
  String? get errorMessage => when(
        success: () => null,
        failure: (message) => message,
      );

  /// Executes an action if this validation failed.
  ///
  /// [action] Function to execute with the error message
  void onFailure(void Function(String message) action) {
    when(
      success: () {},
      failure: (message) => action(message),
    );
  }

  /// Combines this validation result with another.
  ///
  /// Returns success only if both validations are successful.
  /// If either fails, returns the first failure encountered.
  ///
  /// [other] Another validation result to combine with this one
  ///
  /// Example:
  /// ```dart
  /// final emailResult = validateEmail(email);
  /// final passwordResult = validatePassword(password);
  /// final combinedResult = emailResult.combine(passwordResult);
  /// ```
  ValidationResult combine(ValidationResult other) {
    return when(
      success: () => other,
      failure: ValidationResult.failure,
    );
  }
}

/// Extension methods for combining multiple validation results.
extension ValidationResultList on List<ValidationResult> {
  /// Combines all validation results in the list.
  ///
  /// Returns success only if all validations are successful.
  /// Returns the first failure if any validation failed.
  ///
  /// Example:
  /// ```dart
  /// final results = [
  ///   validateEmail(email),
  ///   validatePassword(password),
  ///   validateAge(age),
  /// ];
  /// final combined = results.combineAll();
  /// ```
  ValidationResult combineAll() {
    for (final result in this) {
      if (result.isFailure) {
        return result;
      }
    }
    return const ValidationResult.success();
  }

  /// Gets all error messages from failed validations.
  ///
  /// Returns an empty list if all validations passed.
  List<String> get errorMessages {
    return where((result) => result.isFailure)
        .map((result) => result.errorMessage!)
        .toList();
  }

  /// Checks if any validation in the list failed.
  bool get hasFailures => any((result) => result.isFailure);

  /// Checks if all validations in the list passed.
  bool get allPassed => every((result) => result.isSuccess);
}
