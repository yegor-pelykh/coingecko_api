import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Repository urls data wrapper
class CoinReposUrl {
  /// Github repository urls
  final List<String>? github;

  /// Bitbucket repository urls
  final List<String>? bitbucket;

  CoinReposUrl.fromJson(Map<String, dynamic> json)
      : this.github = Convert.toListOfString(json['homepage']),
        this.bitbucket = Convert.toListOfString(json['bitbucket']);

  @override
  String toString() {
    return '${Helpers.getTypeName(CoinReposUrl)}';
  }
}
