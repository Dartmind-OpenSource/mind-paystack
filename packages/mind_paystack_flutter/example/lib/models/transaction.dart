class Transaction {
  final String id;
  final String reference;
  final double amount;
  final String email;
  final String status;
  final String paymentMethod;
  final DateTime dateTime;
  final Map<String, dynamic>? metadata;

  Transaction({
    required this.id,
    required this.reference,
    required this.amount,
    required this.email,
    required this.status,
    required this.paymentMethod,
    required this.dateTime,
    this.metadata,
  });

  // Create from JSON (useful when storing/retrieving from local storage)
  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      reference: json['reference'],
      amount: json['amount'],
      email: json['email'],
      status: json['status'],
      paymentMethod: json['paymentMethod'],
      dateTime: DateTime.parse(json['dateTime']),
      metadata: json['metadata'],
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reference': reference,
      'amount': amount,
      'email': email,
      'status': status,
      'paymentMethod': paymentMethod,
      'dateTime': dateTime.toIso8601String(),
      'metadata': metadata,
    };
  }
}
