import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Data wrapper for the object with native currency and usd
class NativeCurrencyUsdData {
  /// Native currency
  final double nativeCurrency;

  /// USD
  final double usd;

  NativeCurrencyUsdData.fromJson(Map<String, dynamic> json)
      : this.nativeCurrency = Convert.toDouble(json['native_currency'], 0),
        this.usd = Convert.toDouble(json['usd'], 0) {}

  @override
  String toString() {
    return '${Helpers.getTypeName(NativeCurrencyUsdData)}: nativeCurrency = $nativeCurrency, usd = $usd';
  }
}
