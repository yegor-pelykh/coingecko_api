import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// A class that wraps repository URLs data for a coin.
class CoinReposUrl {
  /// A list of GitHub repository URLs.
  final List<String>? github;

  /// A list of Bitbucket repository URLs.
  final List<String>? bitbucket;

  /// Constructs a [CoinReposUrl] instance from a JSON map.
  ///
  /// The [json] parameter is a map containing the data to be converted.
  CoinReposUrl.fromJson(Map<String, dynamic> json)
      : this.github = Convert.toListOfString(json['homepage']),
        this.bitbucket = Convert.toListOfString(json['bitbucket']);

  /// Returns a string representation of the [CoinReposUrl] instance.
  ///
  /// This method overrides the default [toString] method to provide a custom
  /// string representation.
  @override
  String toString() {
    return '${Helpers.getTypeName(CoinReposUrl)}';
  }
}
