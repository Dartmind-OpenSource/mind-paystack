class Validators {
  const Validators._();

  static String? cardNumberValidator(String? value, String errorMsg) {
    // Validate less that 13 digits +3 white spaces
    return (value?.isEmpty ?? true) || (value?.length ?? 16) < 16
        ? errorMsg
        : null;
  }

  static String? expiryDateValidator(String? value, String errorMsg) {
    if (value?.isEmpty ?? true) {
      return errorMsg;
    }

    final now = DateTime.now();
    final date = value!.split(RegExp('/'));

    final month = int.parse(date.first);
    final year = int.parse('20${date.last}');

    final lastDayOfMonth = month < 12
        ? DateTime(year, month + 1, 0).day
        : DateTime(year + 1, 1, 0).day;

    final cardDate =
        DateTime(year, month, lastDayOfMonth, 23, 59, 59, 999);

    if (cardDate.isBefore(now) || month > 12 || month == 0) {
      return errorMsg;
    }

    return null;
  }

  static String? cvvValidator(String? value, String errorMsg) {
    return (value?.isEmpty ?? true) || ((value?.length ?? 3) < 3)
        ? errorMsg
        : null;
  }
}
