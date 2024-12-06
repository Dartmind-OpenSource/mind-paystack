import 'package:mind_paystack/src/core/client.dart';

class CustomerService {
  CustomerService({
    required this.client,
  });

  final MindPaystackClient client;

  Future<void> createCustomer({
    required String email,
    required String name,
    String? phone,
    String? metadata,
  }) async {
    final result = client.put()
  }
}
