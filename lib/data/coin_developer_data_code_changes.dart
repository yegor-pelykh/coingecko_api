import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

class CoinDeveloperDataCodeChanges {
  final int? additions;
  final int? deletions;

  CoinDeveloperDataCodeChanges.fromJson(Map<String, dynamic> json)
      : this.additions = Convert.toInt(json['additions']),
        this.deletions = Convert.toInt(json['deletions']) {}

  @override
  String toString() {
    return '${Helpers.getTypeName(CoinDeveloperDataCodeChanges)}: additions = $additions, deletions = $deletions';
  }
}
