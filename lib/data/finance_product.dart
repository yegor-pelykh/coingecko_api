import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Finance product data wrapper
class FinanceProduct {
  /// Finance platform
  final String platform;

  /// Product identifier
  final String identifier;

  /// Supply rate percentage
  final double? supplyRatePercentage;

  /// Borrow rate percentage
  final double? borrowRatePercentage;

  /// Number duration
  final double? numberDuration;

  /// Length duration
  final double? lengthDuration;

  /// Start date
  final DateTime? startAt;

  /// End date
  final DateTime? endAt;

  /// Value date
  final DateTime? valueAt;

  /// Redeem date
  final DateTime? redeemAt;

  static DateTime? _parseDate(dynamic d) {
    final date = Convert.toDateTime(d);
    return date != null && date.millisecondsSinceEpoch > 0 ? date : null;
  }

  FinanceProduct.fromJson(Map<String, dynamic> json)
      : this.platform = Convert.toNotNullableString(json['platform'], ''),
        this.identifier = Convert.toNotNullableString(json['identifier'], ''),
        this.supplyRatePercentage =
            Convert.toDouble(json['supply_rate_percentage']),
        this.borrowRatePercentage =
            Convert.toDouble(json['borrow_rate_percentage']),
        this.numberDuration = Convert.toDouble(json['number_duration']),
        this.lengthDuration = Convert.toDouble(json['length_duration']),
        this.startAt = _parseDate(json['start_at']),
        this.endAt = _parseDate(json['end_at']),
        this.valueAt = _parseDate(json['value_at']),
        this.redeemAt = _parseDate(json['redeem_at']) {}

  @override
  String toString() {
    return '${Helpers.getTypeName(FinanceProduct)}: platform = $platform, identifier = $identifier';
  }
}
