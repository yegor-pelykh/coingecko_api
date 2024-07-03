import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// A class that represents public interest statistics for a coin.
class CoinPublicInterestsStats {
  /// The Alexa rank of the coin's website.
  final int? alexaRank;

  /// The number of Bing matches for the coin.
  final int? bingMatches;

  /// Constructs a [CoinPublicInterestsStats] instance from a JSON map.
  ///
  /// The [json] parameter is a map containing the data to be converted.
  CoinPublicInterestsStats.fromJson(Map<String, dynamic> json)
      : this.alexaRank = Convert.toIntN(json['alexa_rank']),
        this.bingMatches = Convert.toIntN(json['bing_matches']);

  /// Returns a string representation of the [CoinPublicInterestsStats] instance.
  @override
  String toString() {
    return '${Helpers.getTypeName(CoinPublicInterestsStats)}';
  }
}
