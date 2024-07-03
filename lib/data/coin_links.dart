import 'package:coingecko_api/data/coin_repos_url.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// A class that wraps various links related to a cryptocurrency.
class CoinLinks {
  /// A list of homepage URLs.
  final List<String>? homepage;

  /// A list of blockchain site URLs.
  final List<String>? blockchainSite;

  /// A list of official forum URLs.
  final List<String>? officialForumUrl;

  /// A list of chat URLs.
  final List<String>? chatUrl;

  /// A list of announcement URLs.
  final List<String>? announcementUrl;

  /// The Twitter screen name.
  final String? twitterScreenName;

  /// The Facebook username.
  final String? facebookUsername;

  /// The Bitcointalk thread identifier.
  final String? bitcointalkThreadIdentifier;

  /// The Telegram channel identifier.
  final String? telegramChannelIdentifier;

  /// The subreddit URL.
  final String? subredditUrl;

  /// The repository URLs.
  final CoinReposUrl? reposUrl;

  /// Constructs a [CoinLinks] instance from a JSON map.
  ///
  /// [json] is a map containing the JSON data.
  CoinLinks.fromJson(Map<String, dynamic> json)
      : this.homepage = Convert.toListOfString(json['homepage']),
        this.blockchainSite = Convert.toListOfString(json['blockchain_site']),
        this.officialForumUrl =
            Convert.toListOfString(json['official_forum_url']),
        this.chatUrl = Convert.toListOfString(json['chat_url']),
        this.announcementUrl = Convert.toListOfString(json['announcement_url']),
        this.twitterScreenName = Convert.toStrN(json['twitter_screen_name']),
        this.facebookUsername = Convert.toStrN(json['facebook_username']),
        this.bitcointalkThreadIdentifier =
            Convert.toStrN(json['bitcointalk_thread_identifier']),
        this.telegramChannelIdentifier =
            Convert.toStrN(json['telegram_channel_identifier']),
        this.subredditUrl = Convert.toStrN(json['subreddit_url']),
        this.reposUrl = json.containsKey('repos_url')
            ? CoinReposUrl.fromJson(json['repos_url'])
            : null;

  /// Returns a string representation of the [CoinLinks] instance.
  @override
  String toString() {
    return '${Helpers.getTypeName(CoinLinks)}';
  }
}
