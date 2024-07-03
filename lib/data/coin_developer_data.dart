import 'package:coingecko_api/data/coin_developer_data_code_changes.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// A class that encapsulates various developer-related metrics for a cryptocurrency.
class CoinDeveloperData {
  /// The number of forks of the project's repository.
  final int? forks;

  /// The number of stars the project's repository has received.
  final int? stars;

  /// The number of subscribers to the project's repository.
  final int? subscribers;

  /// The total number of issues reported in the project's repository.
  final int? totalIssues;

  /// The number of closed issues in the project's repository.
  final int? closedIssues;

  /// The number of pull requests that have been merged in the project's repository.
  final int? pullRequestsMerged;

  /// The number of contributors who have submitted pull requests to the project's repository.
  final int? pullRequestContributors;

  /// The code changes (additions and deletions) in the last 4 weeks.
  final CoinDeveloperDataCodeChanges? codeAdditionsDeletions4Weeks;

  /// The number of commits made in the last 4 weeks.
  final int? commitCount4Weeks;

  /// A series representing commit activity over the last 4 weeks.
  final List<int>? last4WeeksCommitActivitySeries;

  /// Constructs a [CoinDeveloperData] instance from a JSON map.
  ///
  /// [json] is a map containing key-value pairs corresponding to the fields of this class.
  CoinDeveloperData.fromJson(Map<String, dynamic> json)
      : this.forks = Convert.toIntN(json['forks']),
        this.stars = Convert.toIntN(json['stars']),
        this.subscribers = Convert.toIntN(json['subscribers']),
        this.totalIssues = Convert.toIntN(json['total_issues']),
        this.closedIssues = Convert.toIntN(json['closed_issues']),
        this.pullRequestsMerged = Convert.toIntN(json['pull_requests_merged']),
        this.pullRequestContributors =
            Convert.toIntN(json['pull_request_contributors']),
        this.codeAdditionsDeletions4Weeks =
            json.containsKey('code_additions_deletions_4_weeks')
                ? CoinDeveloperDataCodeChanges.fromJson(
                    json['code_additions_deletions_4_weeks'])
                : null,
        this.commitCount4Weeks = Convert.toIntN(json['commit_count_4_weeks']),
        this.last4WeeksCommitActivitySeries =
            Convert.toListOfInt(json['last_4_weeks_commit_activity_series']);

  /// Returns a string representation of the [CoinDeveloperData] instance.
  @override
  String toString() {
    return '${Helpers.getTypeName(CoinDeveloperData)}';
  }
}
