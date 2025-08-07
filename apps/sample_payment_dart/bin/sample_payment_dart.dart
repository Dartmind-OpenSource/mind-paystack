import 'package:sample_payment_dart/sample_payment_dart.dart' as basic;
import 'package:sample_payment_dart/comprehensive_example.dart' as comprehensive;
import 'dart:io';

/// MindPaystack SDK Examples Entry Point
/// 
/// This provides two example types:
/// 1. Basic example - Original simple demonstration
/// 2. Comprehensive example - Complete SDK feature coverage
void main(List<String> arguments) async {
  print('🎯 MINDPAYSTACK SDK EXAMPLES');
  print('============================\n');
  
  // Check if user specified which example to run
  if (arguments.isNotEmpty) {
    final example = arguments.first.toLowerCase();
    
    switch (example) {
      case 'basic':
        print('🚀 Running basic example...\n');
        await basic.main();
        break;
      case 'comprehensive':
        print('🚀 Running comprehensive example...\n');
        await comprehensive.main();
        break;
      case 'help':
      case '--help':
      case '-h':
        _showHelp();
        break;
      default:
        print('❌ Unknown example: $example');
        _showHelp();
        exit(1);
    }
  } else {
    // Interactive mode
    await _runInteractiveMode();
  }
}

/// Show help information
void _showHelp() {
  print('📚 Available examples:');
  print('');
  print('dart run bin/sample_payment_dart.dart basic');
  print('  └─ Simple payment demonstration');
  print('');
  print('dart run bin/sample_payment_dart.dart comprehensive');
  print('  └─ Complete SDK feature coverage');
  print('');
  print('dart run bin/sample_payment_dart.dart');
  print('  └─ Interactive mode to choose example');
  print('');
  print('Options:');
  print('  help, --help, -h    Show this help message');
}

/// Run interactive mode to let user choose example
Future<void> _runInteractiveMode() async {
  print('📋 Choose an example to run:');
  print('');
  print('1. Basic Example');
  print('   - Simple payment flows');
  print('   - Quick start demonstration');
  print('   - Perfect for beginners');
  print('');
  print('2. Comprehensive Example');
  print('   - All SDK features covered');
  print('   - Best practices and security');
  print('   - Error handling patterns');
  print('   - Production-ready examples');
  print('');
  print('Enter your choice (1, 2, or q to quit):');
  
  final input = stdin.readLineSync()?.trim().toLowerCase();
  
  switch (input) {
    case '1':
    case 'basic':
      print('\n🚀 Running basic example...\n');
      await basic.main();
      break;
    case '2':
    case 'comprehensive':
      print('\n🚀 Running comprehensive example...\n');
      await comprehensive.main();
      break;
    case 'q':
    case 'quit':
    case 'exit':
      print('👋 Goodbye!');
      exit(0);
    default:
      print('❌ Invalid choice. Please enter 1, 2, or q.');
      await _runInteractiveMode();
  }
}
