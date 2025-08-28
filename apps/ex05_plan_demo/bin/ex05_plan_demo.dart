import 'dart:io';
import 'package:ex05_plan_demo/ex05_plan_demo.dart';

/// Plan Management Demo Application
/// 
/// This demo application showcases the plan management features of the
/// MindPaystack SDK including creating, listing, fetching, and updating
/// subscription plans.
/// 
/// Usage:
/// 1. Set environment variables (optional):
///    - PAYSTACK_PUBLIC_KEY=pk_test_your_key
///    - PAYSTACK_SECRET_KEY=sk_test_your_key
/// 
/// 2. Run the demo:
///    dart run bin/ex05_plan_demo.dart
/// 
/// 3. Choose from interactive mode or complete demo
void main(List<String> arguments) async {
  print('🎯 MindPaystack Plan Management Demo');
  print('=====================================');
  
  try {
    // Initialize the SDK
    await PlanDemo.initializeSdk();
    
    if (arguments.contains('--complete') || arguments.contains('-c')) {
      // Run complete automated demo
      await PlanDemo.runCompleteDemo();
    } else {
      // Run interactive menu
      print('\n💡 Tip: Use --complete flag to run automated demo');
      await PlanDemo.showMenu();
    }
    
  } catch (e) {
    print('❌ Demo failed: $e');
    exit(1);
  }
}