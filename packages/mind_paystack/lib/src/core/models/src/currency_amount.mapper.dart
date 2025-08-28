// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'currency_amount.dart';

class CurrencyAmountMapper extends ClassMapperBase<CurrencyAmount> {
  CurrencyAmountMapper._();

  static CurrencyAmountMapper? _instance;
  static CurrencyAmountMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CurrencyAmountMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CurrencyAmount';

  static String _$currency(CurrencyAmount v) => v.currency;
  static const Field<CurrencyAmount, String> _f$currency =
      Field('currency', _$currency);
  static int _$amount(CurrencyAmount v) => v.amount;
  static const Field<CurrencyAmount, int> _f$amount = Field('amount', _$amount);

  @override
  final MappableFields<CurrencyAmount> fields = const {
    #currency: _f$currency,
    #amount: _f$amount,
  };

  static CurrencyAmount _instantiate(DecodingData data) {
    return CurrencyAmount(
        currency: data.dec(_f$currency), amount: data.dec(_f$amount));
  }

  @override
  final Function instantiate = _instantiate;

  static CurrencyAmount fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CurrencyAmount>(map);
  }

  static CurrencyAmount fromJson(String json) {
    return ensureInitialized().decodeJson<CurrencyAmount>(json);
  }
}

mixin CurrencyAmountMappable {
  String toJson() {
    return CurrencyAmountMapper.ensureInitialized()
        .encodeJson<CurrencyAmount>(this as CurrencyAmount);
  }

  Map<String, dynamic> toMap() {
    return CurrencyAmountMapper.ensureInitialized()
        .encodeMap<CurrencyAmount>(this as CurrencyAmount);
  }

  CurrencyAmountCopyWith<CurrencyAmount, CurrencyAmount, CurrencyAmount>
      get copyWith =>
          _CurrencyAmountCopyWithImpl<CurrencyAmount, CurrencyAmount>(
              this as CurrencyAmount, $identity, $identity);
  @override
  String toString() {
    return CurrencyAmountMapper.ensureInitialized()
        .stringifyValue(this as CurrencyAmount);
  }

  @override
  bool operator ==(Object other) {
    return CurrencyAmountMapper.ensureInitialized()
        .equalsValue(this as CurrencyAmount, other);
  }

  @override
  int get hashCode {
    return CurrencyAmountMapper.ensureInitialized()
        .hashValue(this as CurrencyAmount);
  }
}

extension CurrencyAmountValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CurrencyAmount, $Out> {
  CurrencyAmountCopyWith<$R, CurrencyAmount, $Out> get $asCurrencyAmount =>
      $base.as((v, t, t2) => _CurrencyAmountCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CurrencyAmountCopyWith<$R, $In extends CurrencyAmount, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? currency, int? amount});
  CurrencyAmountCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CurrencyAmountCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CurrencyAmount, $Out>
    implements CurrencyAmountCopyWith<$R, CurrencyAmount, $Out> {
  _CurrencyAmountCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CurrencyAmount> $mapper =
      CurrencyAmountMapper.ensureInitialized();
  @override
  $R call({String? currency, int? amount}) => $apply(FieldCopyWithData({
        if (currency != null) #currency: currency,
        if (amount != null) #amount: amount
      }));
  @override
  CurrencyAmount $make(CopyWithData data) => CurrencyAmount(
      currency: data.get(#currency, or: $value.currency),
      amount: data.get(#amount, or: $value.amount));

  @override
  CurrencyAmountCopyWith<$R2, CurrencyAmount, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CurrencyAmountCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
