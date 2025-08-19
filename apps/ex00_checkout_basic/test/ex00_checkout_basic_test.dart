import 'package:ex00_checkout_basic/ex00_checkout_basic.dart';
import 'package:test/test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mind_paystack/mind_paystack.dart';

class MockTransactionService extends Mock implements TransactionService {}

void main() {
  group('BasicCheckoutExample', () {
    late MockTransactionService mockService;
    late BasicCheckoutExample example;

    setUp(() {
      mockService = MockTransactionService();
      example = BasicCheckoutExample(transactionService: mockService);
    });

    test('startCheckout calls initializeTransaction and prints URL', () async {
      // Arrange
      const testEmail = 'test@example.com';
      const testAmount = 50000;
      const testCurrency = 'NGN';
      const testAuthUrl = 'https://paystack.com/pay/checkout123';
      const testReference = 'txn_123';

      final txResponse = TransactionResponse(
        status: true,
        message: 'Authorization URL created',
        authorizationUrl: testAuthUrl,
        accessCode: 'code_123',
        reference: testReference,
      );

      when(
        () => mockService.initializeTransaction(
          amount: any(named: 'amount'),
          email: any(named: 'email'),
          currency: any(named: 'currency'),
          reference: any(named: 'reference'),
        ),
      ).thenAnswer((_) async => txResponse);

      // Act
      await example.startCheckout(
        email: testEmail,
        amountKobo: testAmount,
        currency: testCurrency,
      );

      // Assert
      verify(
        () => mockService.initializeTransaction(
          amount: testAmount,
          email: testEmail,
          currency: testCurrency,
          reference: any(named: 'reference'),
        ),
      ).called(1);
    });

    test('verify calls verifyTransaction and prints result', () async {
      // Arrange
      const testReference = 'txn_123';
      final verifyResponse = TransactionResponse(
        status: true,
        message: 'Transaction verified',
        authorizationUrl: null,
        accessCode: null,
        reference: testReference,
      );

      when(
        () => mockService.verifyTransaction(testReference),
      ).thenAnswer((_) async => verifyResponse);

      // Act
      await example.verify(testReference);

      // Assert
      verify(() => mockService.verifyTransaction(testReference)).called(1);
    });
  });
}
