class BankResponse {
  final String name;
  final String code;

  BankResponse({
    required this.name,
    required this.code,
  });

  /// Factory method to create a Bank instance from JSON
  factory BankResponse.fromJson(Map<String, dynamic> json) {
    return BankResponse(
      name: json['name'] as String,
      code: json['code'] as String,
    );
  }

  /// Converts a Bank instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
    };
  }
}