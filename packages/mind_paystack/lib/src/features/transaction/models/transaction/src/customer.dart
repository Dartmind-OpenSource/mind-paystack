import 'package:dart_mappable/dart_mappable.dart';

part 'customer.mapper.dart';

@MappableClass()
class Customer with CustomerMappable {
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

  const Customer({
    required this.id,
    this.firstName,
    this.lastName,
    required this.email,
    required this.customerCode,
    this.phone,
    this.metadata,
    this.riskAction,
  });
}
