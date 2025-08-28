// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'card.dart';

class CardMapper extends ClassMapperBase<Card> {
  CardMapper._();

  static CardMapper? _instance;
  static CardMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CardMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Card';

  static String _$number(Card v) => v.number;
  static const Field<Card, String> _f$number = Field('number', _$number);
  static String _$cvv(Card v) => v.cvv;
  static const Field<Card, String> _f$cvv = Field('cvv', _$cvv);
  static String _$expiryMonth(Card v) => v.expiryMonth;
  static const Field<Card, String> _f$expiryMonth =
      Field('expiryMonth', _$expiryMonth, key: r'expiry_month');
  static String _$expiryYear(Card v) => v.expiryYear;
  static const Field<Card, String> _f$expiryYear =
      Field('expiryYear', _$expiryYear, key: r'expiry_year');
  static String? _$pin(Card v) => v.pin;
  static const Field<Card, String> _f$pin = Field('pin', _$pin, opt: true);

  @override
  final MappableFields<Card> fields = const {
    #number: _f$number,
    #cvv: _f$cvv,
    #expiryMonth: _f$expiryMonth,
    #expiryYear: _f$expiryYear,
    #pin: _f$pin,
  };

  static Card _instantiate(DecodingData data) {
    return Card(
        number: data.dec(_f$number),
        cvv: data.dec(_f$cvv),
        expiryMonth: data.dec(_f$expiryMonth),
        expiryYear: data.dec(_f$expiryYear),
        pin: data.dec(_f$pin));
  }

  @override
  final Function instantiate = _instantiate;

  static Card fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Card>(map);
  }

  static Card fromJson(String json) {
    return ensureInitialized().decodeJson<Card>(json);
  }
}

mixin CardMappable {
  String toJson() {
    return CardMapper.ensureInitialized().encodeJson<Card>(this as Card);
  }

  Map<String, dynamic> toMap() {
    return CardMapper.ensureInitialized().encodeMap<Card>(this as Card);
  }

  CardCopyWith<Card, Card, Card> get copyWith =>
      _CardCopyWithImpl<Card, Card>(this as Card, $identity, $identity);
  @override
  String toString() {
    return CardMapper.ensureInitialized().stringifyValue(this as Card);
  }

  @override
  bool operator ==(Object other) {
    return CardMapper.ensureInitialized().equalsValue(this as Card, other);
  }

  @override
  int get hashCode {
    return CardMapper.ensureInitialized().hashValue(this as Card);
  }
}

extension CardValueCopy<$R, $Out> on ObjectCopyWith<$R, Card, $Out> {
  CardCopyWith<$R, Card, $Out> get $asCard =>
      $base.as((v, t, t2) => _CardCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CardCopyWith<$R, $In extends Card, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? number,
      String? cvv,
      String? expiryMonth,
      String? expiryYear,
      String? pin});
  CardCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CardCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Card, $Out>
    implements CardCopyWith<$R, Card, $Out> {
  _CardCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Card> $mapper = CardMapper.ensureInitialized();
  @override
  $R call(
          {String? number,
          String? cvv,
          String? expiryMonth,
          String? expiryYear,
          Object? pin = $none}) =>
      $apply(FieldCopyWithData({
        if (number != null) #number: number,
        if (cvv != null) #cvv: cvv,
        if (expiryMonth != null) #expiryMonth: expiryMonth,
        if (expiryYear != null) #expiryYear: expiryYear,
        if (pin != $none) #pin: pin
      }));
  @override
  Card $make(CopyWithData data) => Card(
      number: data.get(#number, or: $value.number),
      cvv: data.get(#cvv, or: $value.cvv),
      expiryMonth: data.get(#expiryMonth, or: $value.expiryMonth),
      expiryYear: data.get(#expiryYear, or: $value.expiryYear),
      pin: data.get(#pin, or: $value.pin));

  @override
  CardCopyWith<$R2, Card, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CardCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
