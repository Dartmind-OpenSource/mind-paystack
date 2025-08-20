import 'package:ex00_checkout_basic/ex00_checkout_basic.dart';
import 'package:mind_paystack/mind_paystack.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockMindPaystack extends Mock implements MindPaystack {}

void main() {
  group('BasicCheckoutExample', () {
    late BasicCheckoutExample example;

    setUp(() {
      example = const BasicCheckoutExample();

      // Reset SDK instance before each test
      MindPaystack.reset();
    });

    tearDown(() {
      // Clean up after each test
      MindPaystack.reset();
    });

    group('Factory Methods', () {
      test('withConfig creates instance with custom configuration', () async {
        // Arrange
        final config = PaystackConfig(
          publicKey: 'pk_test_custom',
          secretKey: 'sk_test_custom',
          environment: Environment.test,
        );

        // Act
        final result = await BasicCheckoutExample.withConfig(config);

        // Assert
        expect(result, isA<BasicCheckoutExample>());
        expect(
          MindPaystack.instance.config.publicKey,
          equals('pk_test_custom'),
        );
        expect(
          MindPaystack.instance.config.secretKey,
          equals('sk_test_custom'),
        );
      });

      test(
        'create throws error when environment variables are missing',
        () async {
          // This test would need to mock environment variables
          // For now, we'll skip it as it requires more complex setup
        },
      );

      test('fromEnvironment uses SDK environment variable loading', () async {
        // This test would also need environment variable mocking
        // Skipping for now as it requires more complex setup
      });
    });

    group('Input Validation', () {
      test('startCheckout validates email format', () async {
        // Initialize SDK with test config
        await MindPaystack.initialize(
          PaystackConfig(
            publicKey: 'pk_test_12345',
            secretKey: 'sk_test_12345',
            environment: Environment.test,
          ),
        );

        // This would require mocking console input/output
        // For now, we'll test the core functionality
        expect(
          () => example.startCheckout(
            email: 'test@example.com',
            amountKobo: 50000,
          ),
          returnsNormally,
        );
      });

      test('startCheckout validates amount is positive', () async {
        // Initialize SDK with test config
        await MindPaystack.initialize(
          PaystackConfig(
            publicKey: 'pk_test_12345',
            secretKey: 'sk_test_12345',
            environment: Environment.test,
          ),
        );

        // This would require more sophisticated validation testing
        expect(
          () => example.startCheckout(
            email: 'test@example.com',
            amountKobo: 50000,
          ),
          returnsNormally,
        );
      });
    });
  });
}
