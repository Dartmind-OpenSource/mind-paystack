import 'package:mind_paystack/mind_paystack.dart';

/// Builder for creating InitializeTransactionOptions with a fluent API
class InitializeTransactionBuilder {
  String? _email;
  String? _amount;
  String? _currency;
  String? _reference;
  String? _callbackUrl;
  String? _plan;
  int? _invoiceLimit;
  Map<String, dynamic>? _metadata;
  List<String>? _channels;
  String? _splitCode;
  String? _subaccount;
  int? _transactionCharge;
  String? _bearer;

  /// Sets the customer email address
  InitializeTransactionBuilder email(String email) {
    _email = email;
    return this;
  }

  /// Sets the transaction amount in subunits (kobo for NGN)
  InitializeTransactionBuilder amount(int amount) {
    _amount = amount.toString();
    return this;
  }

  /// Sets the transaction amount as string
  InitializeTransactionBuilder amountString(String amount) {
    _amount = amount;
    return this;
  }

  /// Sets the transaction currency (default: NGN)
  InitializeTransactionBuilder currency(String currency) {
    _currency = currency;
    return this;
  }

  /// Sets a unique transaction reference
  InitializeTransactionBuilder reference(String reference) {
    _reference = reference;
    return this;
  }

  /// Sets the callback URL for transaction status updates
  InitializeTransactionBuilder callbackUrl(String callbackUrl) {
    _callbackUrl = callbackUrl;
    return this;
  }

  /// Sets a subscription plan code
  InitializeTransactionBuilder plan(String plan) {
    _plan = plan;
    return this;
  }

  /// Sets the invoice limit for subscriptions
  InitializeTransactionBuilder invoiceLimit(int invoiceLimit) {
    _invoiceLimit = invoiceLimit;
    return this;
  }

  /// Sets transaction metadata
  InitializeTransactionBuilder metadata(Map<String, dynamic> metadata) {
    _metadata = metadata;
    return this;
  }

  /// Adds a metadata entry
  InitializeTransactionBuilder addMetadata(String key, dynamic value) {
    _metadata ??= {};
    _metadata![key] = value;
    return this;
  }

  /// Sets allowed payment channels
  InitializeTransactionBuilder channels(List<String> channels) {
    _channels = channels;
    return this;
  }

  /// Adds a payment channel
  InitializeTransactionBuilder addChannel(String channel) {
    _channels ??= [];
    _channels!.add(channel);
    return this;
  }

  /// Sets the split code for split payments
  InitializeTransactionBuilder splitCode(String splitCode) {
    _splitCode = splitCode;
    return this;
  }

  /// Sets the subaccount for the transaction
  InitializeTransactionBuilder subaccount(String subaccount) {
    _subaccount = subaccount;
    return this;
  }

  /// Sets the transaction charge
  InitializeTransactionBuilder transactionCharge(int transactionCharge) {
    _transactionCharge = transactionCharge;
    return this;
  }

  /// Sets who bears the transaction charge
  InitializeTransactionBuilder bearer(String bearer) {
    _bearer = bearer;
    return this;
  }

  /// Builds the InitializeTransactionOptions instance
  InitializeTransactionOptions build() {
    if (_email == null) {
      throw MindException.validation(
        message: 'Email is required for transaction initialization',
        errors: [],
      );
    }
    if (_amount == null) {
      throw MindException.validation(
        message: 'Amount is required for transaction initialization',
        errors: [],
      );
    }

    return InitializeTransactionOptions(
      email: _email!,
      amount: _amount!,
      currency: _currency,
      reference: _reference,
      callbackUrl: _callbackUrl,
      plan: _plan,
      invoiceLimit: _invoiceLimit,
      metadata: _metadata,
      channels: _channels,
      splitCode: _splitCode,
      subaccount: _subaccount,
      transactionCharge: _transactionCharge,
      bearer: _bearer,
    );
  }
}
