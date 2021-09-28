import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

class FinanceProduct {
  final String platform;
  final String identifier;
  final double? supplyRatePercentage;
  final double? borrowRatePercentage;
  final double? numberDuration;
  final double? lengthDuration;
  final int startAt;
  final int endAt;
  final int valueAt;
  final int redeemAt;

  FinanceProduct.fromJson(Map<String, dynamic> json)
      : this.platform = Convert.toNotNullableString(json['platform'], ''),
        this.identifier = Convert.toNotNullableString(json['identifier'], ''),
        this.supplyRatePercentage = Convert.toDouble(json['supply_rate_percentage']),
        this.borrowRatePercentage = Convert.toDouble(json['borrow_rate_percentage']),
        this.numberDuration = Convert.toDouble(json['number_duration']),
        this.lengthDuration = Convert.toDouble(json['length_duration']),
        this.startAt = Convert.toInt(json['start_at']) ?? 0,
        this.endAt = Convert.toInt(json['end_at']) ?? 0,
        this.valueAt = Convert.toInt(json['value_at']) ?? 0,
        this.redeemAt = Convert.toInt(json['redeem_at']) ?? 0 {}

  @override
  String toString() {
    return '${Helpers.getTypeName(FinanceProduct)}: platform = $platform, identifier = $identifier';
  }
}
