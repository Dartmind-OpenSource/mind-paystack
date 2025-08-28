// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'bank_transfer.dart';

class BankTransferMapper extends ClassMapperBase<BankTransfer> {
  BankTransferMapper._();

  static BankTransferMapper? _instance;
  static BankTransferMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BankTransferMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'BankTransfer';

  static DateTime? _$accountExpiresAt(BankTransfer v) => v.accountExpiresAt;
  static const Field<BankTransfer, DateTime> _f$accountExpiresAt = Field(
      'accountExpiresAt', _$accountExpiresAt,
      key: r'account_expires_at', opt: true);

  @override
  final MappableFields<BankTransfer> fields = const {
    #accountExpiresAt: _f$accountExpiresAt,
  };

  static BankTransfer _instantiate(DecodingData data) {
    return BankTransfer(accountExpiresAt: data.dec(_f$accountExpiresAt));
  }

  @override
  final Function instantiate = _instantiate;

  static BankTransfer fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BankTransfer>(map);
  }

  static BankTransfer fromJson(String json) {
    return ensureInitialized().decodeJson<BankTransfer>(json);
  }
}

mixin BankTransferMappable {
  String toJson() {
    return BankTransferMapper.ensureInitialized()
        .encodeJson<BankTransfer>(this as BankTransfer);
  }

  Map<String, dynamic> toMap() {
    return BankTransferMapper.ensureInitialized()
        .encodeMap<BankTransfer>(this as BankTransfer);
  }

  BankTransferCopyWith<BankTransfer, BankTransfer, BankTransfer> get copyWith =>
      _BankTransferCopyWithImpl<BankTransfer, BankTransfer>(
          this as BankTransfer, $identity, $identity);
  @override
  String toString() {
    return BankTransferMapper.ensureInitialized()
        .stringifyValue(this as BankTransfer);
  }

  @override
  bool operator ==(Object other) {
    return BankTransferMapper.ensureInitialized()
        .equalsValue(this as BankTransfer, other);
  }

  @override
  int get hashCode {
    return BankTransferMapper.ensureInitialized()
        .hashValue(this as BankTransfer);
  }
}

extension BankTransferValueCopy<$R, $Out>
    on ObjectCopyWith<$R, BankTransfer, $Out> {
  BankTransferCopyWith<$R, BankTransfer, $Out> get $asBankTransfer =>
      $base.as((v, t, t2) => _BankTransferCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class BankTransferCopyWith<$R, $In extends BankTransfer, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({DateTime? accountExpiresAt});
  BankTransferCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BankTransferCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BankTransfer, $Out>
    implements BankTransferCopyWith<$R, BankTransfer, $Out> {
  _BankTransferCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BankTransfer> $mapper =
      BankTransferMapper.ensureInitialized();
  @override
  $R call({Object? accountExpiresAt = $none}) => $apply(FieldCopyWithData(
      {if (accountExpiresAt != $none) #accountExpiresAt: accountExpiresAt}));
  @override
  BankTransfer $make(CopyWithData data) => BankTransfer(
      accountExpiresAt:
          data.get(#accountExpiresAt, or: $value.accountExpiresAt));

  @override
  BankTransferCopyWith<$R2, BankTransfer, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _BankTransferCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
