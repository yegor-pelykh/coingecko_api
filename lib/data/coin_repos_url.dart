import 'package:coingecko_api/helpers/helpers.dart';

class CoinReposUrl {
  final List<String>? github;
  final List<String>? bitbucket;

  CoinReposUrl.fromJson(Map<String, dynamic> json)
      : this.github = Helpers.parseListString(json['homepage']),
        this.bitbucket = Helpers.parseListString(json['bitbucket']) {}

  @override
  String toString() {
    return '${Helpers.getTypeName(CoinReposUrl)}';
  }
}
