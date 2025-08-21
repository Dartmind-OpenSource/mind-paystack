import 'package:mind_paystack/mind_paystack.dart';

/// Builder for creating ChargeAuthorizationOptions with a fluent API
class ChargeAuthorizationBuilder {
  String? _email;
  String? _amount;
  String? _authorizationCode;
  String? _reference;
  String? _currency;
  Map<String, dynamic>? _metadata;
  List<String>? _channels;
  String? _subaccount;
  int? _transactionCharge;
  String? _bearer;
  bool? _queue;

  /// Sets the customer email address
  ChargeAuthorizationBuilder email(String email) {
    _email = email;
    return this;
  }

  /// Sets the transaction amount in subunits (kobo for NGN)
  ChargeAuthorizationBuilder amount(int amount) {
    _amount = amount.toString();
    return this;
  }

  /// Sets the transaction amount as string
  ChargeAuthorizationBuilder amountString(String amount) {
    _amount = amount;
    return this;
  }

  /// Sets the authorization code to charge
  ChargeAuthorizationBuilder authorizationCode(String authorizationCode) {
    _authorizationCode = authorizationCode;
    return this;
  }

  /// Sets a unique transaction reference
  ChargeAuthorizationBuilder reference(String reference) {
    _reference = reference;
    return this;
  }

  /// Sets the transaction currency (default: NGN)
  ChargeAuthorizationBuilder currency(String currency) {
    _currency = currency;
    return this;
  }

  /// Sets transaction metadata
  ChargeAuthorizationBuilder metadata(Map<String, dynamic> metadata) {
    _metadata = metadata;
    return this;
  }

  /// Adds a metadata entry
  ChargeAuthorizationBuilder addMetadata(String key, dynamic value) {
    _metadata ??= {};
    _metadata![key] = value;
    return this;
  }

  /// Sets allowed payment channels
  ChargeAuthorizationBuilder channels(List<String> channels) {
    _channels = channels;
    return this;
  }

  /// Adds a payment channel
  ChargeAuthorizationBuilder addChannel(String channel) {
    _channels ??= [];
    _channels!.add(channel);
    return this;
  }

  /// Sets the subaccount for the transaction
  ChargeAuthorizationBuilder subaccount(String subaccount) {
    _subaccount = subaccount;
    return this;
  }

  /// Sets the transaction charge
  ChargeAuthorizationBuilder transactionCharge(int transactionCharge) {
    _transactionCharge = transactionCharge;
    return this;
  }

  /// Sets who bears the transaction charge
  ChargeAuthorizationBuilder bearer(String bearer) {
    _bearer = bearer;
    return this;
  }

  /// Sets whether to queue the transaction
  ChargeAuthorizationBuilder queue({
    bool queue = false,
  }) {
    _queue = queue;
    return this;
  }

  /// Builds the ChargeAuthorizationOptions instance
  ChargeAuthorizationOptions build() {
    if (_email == null) {
      throw MindException.validation(
        message: 'Email is required for authorization charge',
        errors: [],
      );
    }
    if (_amount == null) {
      throw MindException.validation(
        message: 'Amount is required for authorization charge',
        errors: [],
      );
    }
    if (_authorizationCode == null) {
      throw MindException.validation(
        message: 'Authorization code is required for authorization charge',
        errors: [],
      );
    }

    return ChargeAuthorizationOptions(
      email: _email!,
      amount: _amount!,
      authorizationCode: _authorizationCode!,
      reference: _reference,
      currency: _currency,
      metadata: _metadata,
      channels: _channels,
      subaccount: _subaccount,
      transactionCharge: _transactionCharge,
      bearer: _bearer,
      queue: _queue,
    );
  }
}
