# ex02_charge_terminal

Terminal application demonstrating MindPaystack charge flows with card processing.

## Overview

This command-line application showcases the complete charge lifecycle using the MindPaystack SDK, including:

**💳 Charge Creation Options:**
- **Card Charges**: Process payments with new card details (number, CVV, expiry, PIN)
- **Bank Transfer Charges**: Generate temporary account numbers for bank transfers
- **USSD Charges**: Enable USSD dial codes for mobile payments (*737#, *966#, etc.)
- **Mobile Money Charges**: Support MTN, Vodafone, Airtel-Tigo, M-Pesa payments
- **QR Code Charges**: Generate QR codes for scan-to-pay transactions
- **Saved Card Charges**: Use authorization codes from previous successful payments

**🔐 Authorization Submissions:**
- **PIN Submission**: Handle PIN-based authorization for debit cards
- **OTP Submission**: Process one-time password verification
- **Phone Verification**: Submit phone numbers for verification
- **Birthday Verification**: Handle date of birth verification
- **Address Verification**: Submit billing address details

**📊 Status Management:**
- **Charge Status Checking**: Monitor pending charge status and progress

## Features

- ✨ **Interactive CLI Menu**: User-friendly command-line interface
- 💳 **Card Validation**: Built-in Luhn algorithm and card type detection
- 🔐 **Comprehensive Auth Flows**: Support for all Paystack authorization methods
- 📊 **Detailed Response Display**: Formatted charge status and transaction details
- 🛡️ **Error Handling**: Proper exception handling with user-friendly messages
- 🔧 **Environment Configuration**: Flexible SDK initialization options

## Setup

### 1. Environment Configuration

Create a `.env` file in the project root with your Paystack credentials:

```env
PAYSTACK_PUBLIC_KEY=pk_test_your_public_key_here
PAYSTACK_SECRET_KEY=sk_test_your_secret_key_here
PAYSTACK_ENVIRONMENT=test
PAYSTACK_LOG_LEVEL=info
```

### 2. Install Dependencies

```bash
dart pub get
```

### 3. Run the Application

```bash
dart run
```

## Usage

The application provides an interactive menu with the following operations:

## 💳 CREATE CHARGES

### 1. Create Card Charge
Process a payment using card details:
- Enter customer email and amount
- Provide card number, CVV, expiry date
- Optional PIN for debit cards
- Automatic card validation and type detection

**Test Card Numbers:**
- Visa: `4084084084084081`
- Mastercard: `5060666666666666666`
- Verve: `5061020000000000094`

### 2. Create Bank Transfer Charge
Generate temporary account for bank transfers:
- Enter customer email and amount
- Optional account expiry date
- Customer transfers to generated account number

### 3. Create USSD Charge
Enable mobile USSD payments:
- Enter customer email and amount
- Choose from popular USSD codes:
  - GTB: *737#
  - Zenith: *966#
  - UBA: *919#
  - Custom USSD code

### 4. Create Mobile Money Charge
Process mobile money payments:
- Enter customer email and amount
- Select provider:
  - 🇬🇭 Ghana: MTN, Vodafone, AirtelTigo
  - 🇰🇪 Kenya: M-Pesa
- Provide mobile number

### 5. Create QR Code Charge
Generate QR codes for payments:
- Enter customer email and amount
- Choose QR provider:
  - Scan-to-Pay
  - Visa QR
  - Custom provider

### 6. Create Saved Card Charge
Use previously saved payment methods:
- Enter customer email and amount
- Provide authorization code from previous transaction
- One-click payment experience

## 🔐 SUBMIT AUTHORIZATION

### 7. Submit PIN
Authorize charge using card PIN:
- Enter charge reference
- Provide card PIN (4 digits)

### 8. Submit OTP
Complete OTP verification:
- Enter charge reference
- Provide OTP from SMS/email

### 9. Submit Phone
Verify phone number:
- Enter charge reference
- Provide phone number (international format)

### 10. Submit Birthday
Verify date of birth:
- Enter charge reference
- Provide birthday (YYYY-MM-DD format)

### 11. Submit Address
Provide billing address:
- Enter charge reference
- Complete address (street, city, state, ZIP)

## 📊 STATUS CHECK

### 12. Check Pending Charge
Monitor charge status:
- Enter charge reference
- View current status and details

## Example Flows

### Card Payment Flow
1. **Start Application**: `dart run`
2. **Create Card Charge**: Select option 1, enter email/amount, provide card details
3. **Handle Authorization**: Based on response, use options 7-11 for verification
4. **Check Status**: Use option 12 to monitor progress
5. **Complete**: Charge shows "success" status when processed

### Bank Transfer Flow
1. **Create Bank Transfer**: Select option 2, enter email and amount
2. **Customer Action**: Customer transfers to generated account number
3. **Monitor Status**: Use option 12 to check when transfer is received

### USSD Payment Flow
1. **Create USSD Charge**: Select option 3, choose USSD code
2. **Customer Action**: Customer dials USSD code on phone
3. **Complete**: Payment processed through mobile banking

### Mobile Money Flow
1. **Create Mobile Money**: Select option 4, choose provider and phone
2. **Customer Action**: Customer approves payment on mobile wallet
3. **Verify**: Payment confirmed through mobile money service

### Saved Card Flow
1. **Create Saved Card**: Select option 6, enter authorization code
2. **Complete**: Instant payment using saved payment method

## Response Statuses

- **success**: Payment completed successfully
- **pending**: Requires additional verification (PIN, OTP, etc.)
- **failed**: Payment was declined or failed
- **abandoned**: Customer abandoned the payment flow

## Development

### Project Structure

```
lib/
  ex02_charge_terminal.dart    # Main ChargeTerminal class
bin/
  ex02_charge_terminal.dart    # Entry point
pubspec.yaml                   # Dependencies
README.md                      # This file
```

### Key Components

- **ChargeTerminal**: Main application class handling all charge operations
- **Interactive Menu**: Command-line interface for user interactions
- **Card Validation**: Built-in validation using Luhn algorithm
- **Response Display**: Formatted output for charge responses and status

## Dependencies

- **mind_paystack**: Core SDK for Paystack integration
- **dotenv**: Environment variable management for configuration

## Security Notes

- Never commit `.env` files containing real API keys
- Use test keys during development
- Ensure HTTPS when handling card data in production
- Follow PCI DSS compliance guidelines for card data handling

## Troubleshooting

**Import Errors**: Run `dart pub get` to install dependencies
**SDK Initialization**: Verify `.env` file contains valid Paystack keys
**Network Issues**: Check internet connection for API calls
**Test Cards**: Use provided test card numbers for development

For more examples and documentation, visit the [MindPaystack GitHub repository](https://github.com/mind-paystack).
