import 'package:coingecko_api/data/coin_repos_url.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Link data wrapper
class CoinLinks {
  /// Homepage
  final List<String>? homepage;

  /// Blockchain site
  final List<String>? blockchainSite;

  /// Official forum url
  final List<String>? officialForumUrl;

  /// Chat url
  final List<String>? chatUrl;

  /// Announcement url
  final List<String>? announcementUrl;

  /// Twitter screen name
  final String? twitterScreenName;

  /// Facebook username
  final String? facebookUsername;

  /// Bitcointalk thread identifier
  final String? bitcointalkThreadIdentifier;

  /// Telegram channel identifier
  final String? telegramChannelIdentifier;

  /// Subreddit url
  final String? subredditUrl;

  /// Repository urls
  final CoinReposUrl? reposUrl;

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

  @override
  String toString() {
    return '${Helpers.getTypeName(CoinLinks)}';
  }
}
