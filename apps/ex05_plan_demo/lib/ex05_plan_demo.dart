import 'dart:io';
import 'package:dotenv/dotenv.dart';
import 'package:mind_paystack/mind_paystack.dart';

/// Demonstrates plan management operations using the MindPaystack SDK
class PlanDemo {
  /// Initialize the SDK with environment variables or test keys
  static Future<void> initializeSdk() async {
    try {
      // Try to initialize from environment variables first
      await MindPaystack.fromEnvironment();
      print('✅ SDK initialized from environment variables');
    } catch (e) {
      final env = DotEnv(includePlatformEnvironment: true)..load();
      final secretKey = env['PAYSTACK_SECRET_KEY'];
      final publicKey = env['PAYSTACK_PUBLIC_KEY'];

      // Fallback to test configuration
      await MindPaystack.initialize(
        PaystackConfig(
          publicKey: publicKey!,
          secretKey: secretKey!,
          environment: Environment.test,
        ),
      );
      print('✅ SDK initialized with test configuration');
      print(
          '💡 Set PAYSTACK_PUBLIC_KEY and PAYSTACK_SECRET_KEY environment variables for automatic configuration');
    }
  }

  /// Demonstrates creating a new subscription plan
  static Future<Plan?> createPlan() async {
    print('\n🔄 Creating a new subscription plan...');

    final sdk = MindPaystack.instance;

    final createResult = await sdk.plan.create(
      CreatePlanOptions(
        name: 'Premium Monthly Plan',
        amount: 500000, // ₦5,000 in kobo
        interval: 'monthly',
        // planCode: 'premium_monthly_${DateTime.now().millisecondsSinceEpoch}',
        description: 'Premium features with monthly billing',
        currency: 'NGN',
        invoiceLimit: 12, // 12 months
        sendInvoices: true,
        sendSms: true,
      ),
    );

    if (createResult.isSuccess) {
      final plan = createResult.data!;
      print('✅ Plan created successfully!');
      print('   Plan Code: ${plan.planCode}');
      print('   Plan ID: ${plan.id}');
      print('   Name: ${plan.name}');
      print('   Amount: ₦${(plan.amount! / 100).toStringAsFixed(2)}');
      print('   Interval: ${plan.interval}');
      return plan;
    } else {
      print('❌ Plan creation failed: ${createResult.message}');
      return null;
    }
  }

  /// Demonstrates listing subscription plans
  static Future<void> listPlans() async {
    print('\n🔄 Fetching subscription plans...');

    final sdk = MindPaystack.instance;

    final listResult = await sdk.plan.list(
      ListPlansOptions(
        perPage: 10,
        page: 1,
        status: 'active',
      ),
    );

    if (listResult.isSuccess) {
      final planList = listResult.data!;
      print('✅ Found ${planList.length} plans (${listResult.meta} total)');

      if (listResult.data?.isEmpty ?? false) {
        print('   No plans found. Create one first!');
        return;
      }

      print('   Available Plans:');
      for (int i = 0; i < planList.length; i++) {
        final plan = planList[i];
        print('   ${i + 1}. ${plan.name}');
        print('      Code: ${plan.planCode}');
        print(
            '      Amount: ₦${(plan.amount! / 100).toStringAsFixed(2)} per ${plan.interval}');
      }
    } else {
      print('❌ Plan listing failed: ${listResult.message}');
    }
  }

  /// Demonstrates fetching a specific plan
  static Future<void> fetchPlan(String planIdOrCode) async {
    print('\n🔄 Fetching plan: $planIdOrCode');

    final sdk = MindPaystack.instance;

    final fetchResult = await sdk.plan.fetch(planIdOrCode);

    if (fetchResult.isSuccess) {
      final plan = fetchResult.data!;
      print('✅ Plan fetched successfully!');
      print('   Name: ${plan.name}');
      print('   Code: ${plan.planCode}');
      print('   Amount: ₦${(plan.amount! / 100).toStringAsFixed(2)}');
      print('   Interval: ${plan.interval}');
    } else {
      print('❌ Plan fetch failed: ${fetchResult.message}');
    }
  }

  /// Demonstrates updating a subscription plan
  static Future<void> updatePlan(String planIdOrCode) async {
    print('\n🔄 Updating plan: $planIdOrCode');

    final sdk = MindPaystack.instance;

    final updateResult = await sdk.plan.update(
      planIdOrCode,
      UpdatePlanOptions(
        name: 'Premium Monthly Plan (Updated)',
        amount: 600000, // ₦6,000 in kobo
        description: 'Enhanced premium features with monthly billing',
      ),
    );

    if (updateResult.isSuccess) {
      final updatedPlan = updateResult.data!;
      print('✅ Plan updated successfully!');
      print('   New Name: ${updatedPlan.name}');
      print(
          '   New Amount: ₦${(updatedPlan.amount! / 100).toStringAsFixed(2)}');
    } else {
      print('❌ Plan update failed: ${updateResult.message}');
    }
  }

  /// Interactive menu for plan operations
  static Future<void> showMenu() async {
    while (true) {
      print('\n📋 Plan Management Demo');
      print('1. Create a new plan');
      print('2. List all plans');
      print('3. Fetch a specific plan');
      print('4. Update a plan');
      print('5. Exit');
      print('');
      stdout.write('Choose an option (1-5): ');

      final choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          await createPlan();
          break;
        case '2':
          await listPlans();
          break;
        case '3':
          stdout.write('Enter plan ID or code: ');
          final planId = stdin.readLineSync();
          if (planId?.isNotEmpty == true) {
            await fetchPlan(planId!);
          }
          break;
        case '4':
          stdout.write('Enter plan ID or code to update: ');
          final planId = stdin.readLineSync();
          if (planId?.isNotEmpty == true) {
            await updatePlan(planId!);
          }
          break;
        case '5':
          print('👋 Goodbye!');
          return;
        default:
          print('❌ Invalid option. Please choose 1-5.');
      }
    }
  }

  /// Runs a complete demo of all plan operations
  static Future<void> runCompleteDemo() async {
    print('🚀 Running complete plan management demo...');

    // Create a plan
    final createdPlan = await createPlan();
    if (createdPlan == null) return;

    // List plans
    await listPlans();

    // Fetch the created plan
    await fetchPlan(createdPlan.planCode!);

    // Update the plan
    await updatePlan(createdPlan.planCode!);

    print('\n✅ Complete demo finished!');
  }
}
