import 'package:coingecko_api/helpers/helpers.dart';

/// Repository urls data wrapper
class CoinReposUrl {
  /// Github repository urls
  final List<String>? github;

  /// Bitbucket repository urls
  final List<String>? bitbucket;

  CoinReposUrl.fromJson(Map<String, dynamic> json)
      : this.github = Helpers.parseListString(json['homepage']),
        this.bitbucket = Helpers.parseListString(json['bitbucket']);

  @override
  String toString() {
    return '${Helpers.getTypeName(CoinReposUrl)}';
  }
}
