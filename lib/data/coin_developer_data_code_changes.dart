import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// A class that represents the code changes data for a coin developer.
class CoinDeveloperDataCodeChanges {
  /// The number of code additions.
  final int? additions;

  /// The number of code deletions.
  final int? deletions;

  /// Constructs an instance of [CoinDeveloperDataCodeChanges] from a JSON object.
  ///
  /// The [json] parameter is a map containing the data to be parsed.
  CoinDeveloperDataCodeChanges.fromJson(Map<String, dynamic> json)
      : this.additions = Convert.toIntN(json['additions']),
        this.deletions = Convert.toIntN(json['deletions']);

  /// Returns a string representation of the instance.
  ///
  /// The string contains the type name and the values of [additions] and [deletions].
  @override
  String toString() {
    return '${Helpers.getTypeName(CoinDeveloperDataCodeChanges)}: additions = $additions, deletions = $deletions';
  }
}
