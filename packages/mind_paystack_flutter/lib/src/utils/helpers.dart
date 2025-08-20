import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:mind_paystack_flutter/src/models/custom_card_type_icon.dart';
import 'package:mind_paystack_flutter/src/utils/constants.dart';
import 'package:mind_paystack_flutter/src/utils/enumerations.dart';

/// Uses the predefined prefixes from [AppConstants.cardNumPatterns] to match
/// with the prefix of the [cardNumber] in order to detect the [CardType].
/// Defaults to [CardType.otherBrand] if unable to detect a type.
CardType detectCCType(String cardNumber) {
  if (cardNumber.isEmpty) {
    return CardType.otherBrand;
  }

  // Remove any spaces
  cardNumber = cardNumber.replaceAll(RegExp(r'\s+\b|\b\s'), '');

  final firstDigit = int.parse(
    cardNumber.length <= 1 ? cardNumber : cardNumber.substring(0, 1),
  );

  if (!AppConstants.cardNumPatterns.containsKey(firstDigit)) {
    return CardType.otherBrand;
  }

  final cardNumPatternSubMap =
      AppConstants.cardNumPatterns[firstDigit]!;

  final ccPatternNum = int.parse(cardNumber);

  for (final range in cardNumPatternSubMap.keys) {
    var subPatternNum = ccPatternNum;

    if (range.length != 2 || range.first == null) {
      continue;
    }

    final start = range.first!;
    final end = range.last;

    // Adjust the cardNumber prefix as per the length of start prefix range.
    final startLen = start.toString().length;
    if (startLen < cardNumber.length) {
      subPatternNum = int.parse(cardNumber.substring(0, startLen));
    }

    if ((end == null && subPatternNum == start) ||
        ((subPatternNum <= (end ?? -double.maxFinite)) &&
            subPatternNum >= start)) {
      return cardNumPatternSubMap[range]!;
    }
  }

  return CardType.otherBrand;
}

/// Returns the icon for the card type if detected else will return a
/// [SizedBox].
Widget getCardTypeImage({
  required List<CustomCardTypeIcon> customIcons,
  CardType? cardType,
}) {
  const Widget blankSpace =
      SizedBox.square(dimension: AppConstants.creditCardIconSize);

  if (cardType == null) {
    return blankSpace;
  }

  return customIcons.firstWhere(
    (CustomCardTypeIcon element) => element.cardType == cardType,
    orElse: () {
      final isKnownCardType =
          AppConstants.cardTypeIconAsset.containsKey(cardType);

      return CustomCardTypeIcon(
        cardType: isKnownCardType ? cardType : CardType.otherBrand,
        cardImage: isKnownCardType
            ? Image.asset(
                AppConstants.cardTypeIconAsset[cardType]!,
                height: AppConstants.creditCardIconSize,
                width: AppConstants.creditCardIconSize,
                package: AppConstants.packageName,
              )
            : blankSpace,
      );
    },
  ).cardImage;
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue,) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
