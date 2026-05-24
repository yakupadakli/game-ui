import 'package:flutter/material.dart';

/// Reusable [FormField] validators with **caller-supplied** messages (no l10n).
///
/// Use with any [TextFormField]:
///
/// ```dart
/// validator: GameValidators.email(
///   requiredMessage: context.l10n.fieldRequired,
///   invalidMessage: context.l10n.invalidEmail,
/// ),
/// ```
abstract final class GameValidators {
  GameValidators._();

  /// Pragmatic shape check — not RFC 5322 complete (e.g. TLD capped at 4 chars).
  static final RegExp _emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');

  /// Non-empty after trim.
  static String? Function(String?) required({required String message}) {
    return (value) {
      if (value == null || value.trim().isEmpty) {
        return message;
      }
      return null;
    };
  }

  /// Required + simple email shape; swap for app-specific / stricter rules if needed.
  static String? Function(String?) email({
    required String requiredMessage,
    required String invalidMessage,
  }) {
    return (value) {
      if (value == null || value.trim().isEmpty) {
        return requiredMessage;
      }
      if (!_emailRegex.hasMatch(value.trim())) {
        return invalidMessage;
      }
      return null;
    };
  }

  /// Required + parses as [double].
  static String? Function(String?) number({
    required String requiredMessage,
    required String invalidMessage,
  }) {
    return (value) {
      if (value == null || value.trim().isEmpty) {
        return requiredMessage;
      }
      if (double.tryParse(value.trim()) == null) {
        return invalidMessage;
      }
      return null;
    };
  }

  /// Required, then [parse]; must be strictly positive.
  ///
  /// If [parse] throws (e.g. [FormatException]), [notPositiveMessage] is
  /// returned instead of crashing.
  static String? Function(String?) positiveAmount({
    required String requiredMessage,
    required String notPositiveMessage,
    required double Function(String) parse,
  }) {
    return (value) {
      if (value == null || value.trim().isEmpty) {
        return requiredMessage;
      }
      final double amount;
      try {
        amount = parse(value.trim());
      } on Object {
        return notPositiveMessage;
      }
      if (amount <= 0) return notPositiveMessage;
      return null;
    };
  }

  static final RegExp _upperCaseRegex = RegExp('[A-Z]');
  static final RegExp _digitRegex = RegExp('[0-9]');
  static final RegExp _specialCharRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

  static String? Function(String?) password({
    required String requiredMessage,
    required String tooShortMessage,
    required String needsUppercaseMessage,
    required String needsDigitMessage,
    required String needsSpecialCharMessage,
    int minLength = 8,
  }) {
    return (value) {
      if (value == null || value.trim().isEmpty) {
        return requiredMessage;
      }
      final trimmed = value.trim();
      if (trimmed.length < minLength) {
        return tooShortMessage;
      }
      if (!trimmed.contains(_upperCaseRegex)) {
        return needsUppercaseMessage;
      }
      if (!trimmed.contains(_digitRegex)) {
        return needsDigitMessage;
      }
      if (!trimmed.contains(_specialCharRegex)) {
        return needsSpecialCharMessage;
      }
      return null;
    };
  }

  static String? Function(String?) passwordMatch({
    required String requiredMessage,
    required String mismatchMessage,
    required TextEditingController passwordController,
  }) {
    return (value) {
      if (value == null || value.trim().isEmpty) {
        return requiredMessage;
      }
      if (value != passwordController.text) {
        return mismatchMessage;
      }
      return null;
    };
  }

  static String? Function(String?) minLength({
    required String requiredMessage,
    required String tooShortMessage,
    required int length,
  }) {
    return (value) {
      if (value == null || value.trim().isEmpty) {
        return requiredMessage;
      }
      if (value.trim().length < length) {
        return tooShortMessage;
      }
      return null;
    };
  }

  /// Runs validators in order; first error wins.
  static String? Function(String?) combine(
    List<String? Function(String?)> validators,
  ) {
    return (value) {
      for (final validator in validators) {
        final error = validator(value);
        if (error != null) return error;
      }
      return null;
    };
  }
}
