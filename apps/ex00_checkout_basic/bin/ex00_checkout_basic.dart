import 'package:ex00_checkout_basic/ex00_checkout_basic.dart'
    as ex00_checkout_basic;

import 'dart:io';

void main(List<String> args) async {
  final example = await ex00_checkout_basic.BasicCheckoutExample.create();

  stdout.writeln('=== Basic Checkout Example ===');
  stdout.writeln('Enter customer email:');
  final email = stdin.readLineSync();
  if (email == null || email.isEmpty) {
    stderr.writeln('Email is required.');
    exit(1);
  }

  stdout.writeln('Enter amount in Naira:');
  final amountInput = stdin.readLineSync();
  final amountNaira = int.tryParse(amountInput ?? '');
  if (amountNaira == null || amountNaira <= 0) {
    stderr.writeln('Invalid amount.');
    exit(1);
  }

  final amountKobo = amountNaira * 100;

  await example.startCheckout(email: email, amountKobo: amountKobo);

  stdout.writeln('\n=== Optional: Verify payment ===');
  stdout.writeln('Enter reference to verify (or press Enter to skip):');
  final ref = stdin.readLineSync();
  if (ref != null && ref.isNotEmpty) {
    await example.verify(ref);
  }

  stdout.writeln('Done.');
}
