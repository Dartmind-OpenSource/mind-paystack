import 'package:flutter/widgets.dart';

import '../models/credit_card_brand.dart';
import '../models/credit_card_model.dart';

typedef CCModelChangeCallback = void Function(CreditCardModel);

typedef CCBrandChangeCallback = void Function(CreditCardBrand);

typedef ValidationCallback = String? Function(String?);

typedef WidgetCallback = Widget Function();
