import 'package:ex02_charge_terminal/ex02_charge_terminal.dart';

/// Entry point for the MindPaystack Charge Terminal application.
///
/// This application demonstrates charge flows with card processing using
/// the MindPaystack SDK. It provides an interactive command-line interface
/// for creating charges and handling various submission flows.
Future<void> main(List<String> arguments) async {
  try {
    // Initialize the charge terminal with SDK configuration
    final terminal = await ChargeTerminal.create();
    
    // Start the interactive session
    await terminal.runInteractiveSession();
  } catch (e) {
    print('Failed to start charge terminal: $e');
  }
}
