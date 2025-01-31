import 'package:mind_paystack/mind_paystack.dart';

void main(List<String> arguments) {
  MindPaystack(PaystackConfig(
    publicKey: '',
    secretKey: '',
  ))
    ..initialize();
}
