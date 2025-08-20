import 'package:dart_mappable/dart_mappable.dart';

part 'customer.mapper.dart';

@MappableClass()
class Customer with CustomerMappable {

  const Customer({
    required this.id,
    required this.email, required this.customerCode, this.firstName,
    this.lastName,
    this.phone,
    this.metadata,
    this.riskAction,
  });
  final int id;
  final String? firstName;
  final String? lastName;
  final String email;
  @MappableField(key: 'customer_code')
  final String customerCode;
  final String? phone;
  final dynamic metadata; // Paystack allows arbitrary metadata shape
  @MappableField(key: 'risk_action')
  final String? riskAction;
}
