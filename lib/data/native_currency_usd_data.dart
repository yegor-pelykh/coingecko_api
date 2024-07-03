import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Data wrapper for the object with native currency and USD values.
class NativeCurrencyUsdData {
  /// The value of the native currency.
  final double nativeCurrency;

  /// The value in USD.
  final double usd;

  /// Constructs an instance of [NativeCurrencyUsdData] from a JSON map.
  ///
  /// The [json] parameter is a map containing the keys 'native_currency' and 'usd'.
  NativeCurrencyUsdData.fromJson(Map<String, dynamic> json)
      : this.nativeCurrency = Convert.toDouble(json['native_currency'], 0),
        this.usd = Convert.toDouble(json['usd'], 0) {}

  /// Returns a string representation of the [NativeCurrencyUsdData] instance.
  ///
  /// The string includes the type name and the values of [nativeCurrency] and [usd].
  @override
  String toString() {
    return '${Helpers.getTypeName(NativeCurrencyUsdData)}: nativeCurrency = $nativeCurrency, usd = $usd';
  }
}
