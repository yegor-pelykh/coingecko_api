import 'package:coingecko_api/data/coin_developer_data_code_changes.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Coin developer data wrapper
class CoinDeveloperData {
  /// Number of forks
  final int? forks;

  /// Number of stars
  final int? stars;

  /// Number of subscribers
  final int? subscribers;

  /// Total number of issues
  final int? totalIssues;

  /// Number of closed issues
  final int? closedIssues;

  /// Number of merged pull requests
  final int? pullRequestsMerged;

  /// Number of pull requests contributors
  final int? pullRequestContributors;

  /// Code changes in last 4 weeks
  final CoinDeveloperDataCodeChanges? codeAdditionsDeletions4Weeks;

  /// Commit count in last 4 weeks
  final int? commitCount4Weeks;

  /// Commit activity series in last 4 weeks
  final List<int>? last4WeeksCommitActivitySeries;

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

  @override
  String toString() {
    return '${Helpers.getTypeName(CoinDeveloperData)}';
  }
}
