import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_ui/game_ui.dart';

void main() {
  group('GameValidators.required', () {
    final validator = GameValidators.required(message: 'req');

    test('rejects null', () => expect(validator(null), 'req'));
    test('rejects empty string', () => expect(validator(''), 'req'));
    test('rejects whitespace only', () => expect(validator('   '), 'req'));
    test('accepts non-empty', () => expect(validator('hi'), isNull));
  });

  group('GameValidators.email', () {
    final validator = GameValidators.email(
      requiredMessage: 'req',
      invalidMessage: 'inv',
    );

    test('rejects null with required message', () {
      expect(validator(null), 'req');
    });

    test('rejects malformed with invalid message', () {
      expect(validator('not-an-email'), 'inv');
    });

    test('accepts well-formed email', () {
      expect(validator('hello@example.com'), isNull);
    });
  });

  group('GameValidators.number', () {
    final validator = GameValidators.number(
      requiredMessage: 'req',
      invalidMessage: 'inv',
    );

    test('rejects empty', () => expect(validator(''), 'req'));
    test('rejects non-numeric', () => expect(validator('abc'), 'inv'));
    test('accepts integer', () => expect(validator('42'), isNull));
    test('accepts decimal', () => expect(validator('3.14'), isNull));
  });

  group('GameValidators.positiveAmount', () {
    final validator = GameValidators.positiveAmount(
      requiredMessage: 'req',
      notPositiveMessage: 'pos',
      parse: double.parse,
    );

    test('rejects empty', () => expect(validator(''), 'req'));
    test('rejects unparseable as not-positive', () {
      expect(validator('abc'), 'pos');
    });
    test('rejects zero', () => expect(validator('0'), 'pos'));
    test('rejects negative', () => expect(validator('-5'), 'pos'));
    test('accepts positive', () => expect(validator('1.5'), isNull));
  });

  group('GameValidators.password', () {
    final validator = GameValidators.password(
      requiredMessage: 'req',
      tooShortMessage: 'short',
      needsUppercaseMessage: 'upper',
      needsDigitMessage: 'digit',
      needsSpecialCharMessage: 'special',
    );

    test('rejects empty', () => expect(validator(''), 'req'));
    test('rejects short', () => expect(validator('Aa1!'), 'short'));
    test(
      'rejects missing uppercase',
      () => expect(validator('abcdef1!'), 'upper'),
    );
    test('rejects missing digit', () => expect(validator('Abcdefg!'), 'digit'));
    test(
      'rejects missing special',
      () => expect(validator('Abcdefg1'), 'special'),
    );
    test(
      'accepts strong password',
      () => expect(validator('Abcdefg1!'), isNull),
    );
  });

  group('GameValidators.passwordMatch', () {
    test('rejects mismatch', () {
      final controller = TextEditingController(text: 'secret');
      final validator = GameValidators.passwordMatch(
        requiredMessage: 'req',
        mismatchMessage: 'mismatch',
        passwordController: controller,
      );
      expect(validator('different'), 'mismatch');
      controller.dispose();
    });

    test('accepts match', () {
      final controller = TextEditingController(text: 'secret');
      final validator = GameValidators.passwordMatch(
        requiredMessage: 'req',
        mismatchMessage: 'mismatch',
        passwordController: controller,
      );
      expect(validator('secret'), isNull);
      controller.dispose();
    });
  });

  group('GameValidators.minLength', () {
    final validator = GameValidators.minLength(
      requiredMessage: 'req',
      tooShortMessage: 'short',
      length: 5,
    );

    test('rejects empty', () => expect(validator(''), 'req'));
    test('rejects too short', () => expect(validator('hi'), 'short'));
    test('accepts long enough', () => expect(validator('hello'), isNull));
  });

  group('GameValidators.combine', () {
    test('returns first error encountered', () {
      final combined = GameValidators.combine([
        GameValidators.required(message: 'req'),
        GameValidators.minLength(
          requiredMessage: 'req',
          tooShortMessage: 'short',
          length: 5,
        ),
      ]);
      expect(combined(''), 'req');
      expect(combined('hi'), 'short');
      expect(combined('hello'), isNull);
    });
  });
}
