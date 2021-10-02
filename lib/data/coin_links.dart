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
      : this.homepage = Helpers.parseListString(json['homepage']),
        this.blockchainSite = Helpers.parseListString(json['blockchain_site']),
        this.officialForumUrl =
            Helpers.parseListString(json['official_forum_url']),
        this.chatUrl = Helpers.parseListString(json['chat_url']),
        this.announcementUrl =
            Helpers.parseListString(json['announcement_url']),
        this.twitterScreenName =
            Convert.toNullableString(json['twitter_screen_name']),
        this.facebookUsername =
            Convert.toNullableString(json['facebook_username']),
        this.bitcointalkThreadIdentifier =
            Convert.toNullableString(json['bitcointalk_thread_identifier']),
        this.telegramChannelIdentifier =
            Convert.toNullableString(json['telegram_channel_identifier']),
        this.subredditUrl = Convert.toNullableString(json['subreddit_url']),
        this.reposUrl = json.containsKey('repos_url')
            ? CoinReposUrl.fromJson(json['repos_url'])
            : null {}

  @override
  String toString() {
    return '${Helpers.getTypeName(CoinLinks)}';
  }
}
