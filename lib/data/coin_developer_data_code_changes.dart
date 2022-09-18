import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Code changes data wrapper
class CoinDeveloperDataCodeChanges {
  /// Number of code additions
  final int? additions;

  /// Number of code deletions
  final int? deletions;

  CoinDeveloperDataCodeChanges.fromJson(Map<String, dynamic> json)
      : this.additions = Convert.toIntN(json['additions']),
        this.deletions = Convert.toIntN(json['deletions']);

  @override
  String toString() {
    return '${Helpers.getTypeName(CoinDeveloperDataCodeChanges)}: additions = $additions, deletions = $deletions';
  }
}
