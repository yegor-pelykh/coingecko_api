import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Coin developer data wrapper
class CoinCommunityData {
  /// Facebook likes
  final int? facebookLikes;

  /// Twitter followers
  final int? twitterFollowers;

  /// Reddit average posts in 48 hours
  final double? redditAveragePosts48h;

  /// Reddit average comments in 48 hours
  final double? redditAverageComments48h;

  /// Reddit subscribers
  final int? redditSubscribers;

  /// Reddit accounts active in 48hours
  final double? redditAccountsActive48h;

  /// Telegram channel user count
  final int? telegramChannelUserCount;

  CoinCommunityData.fromJson(Map<String, dynamic> json)
      : this.facebookLikes = Convert.toInt(json['facebook_likes']),
        this.twitterFollowers = Convert.toInt(json['twitter_followers']),
        this.redditAveragePosts48h =
            Convert.toDouble(json['reddit_average_posts_48h']),
        this.redditAverageComments48h =
            Convert.toDouble(json['reddit_average_comments_48h']),
        this.redditSubscribers = Convert.toInt(json['reddit_subscribers']),
        this.redditAccountsActive48h =
            Convert.toDouble(json['reddit_accounts_active_48h']),
        this.telegramChannelUserCount =
            Convert.toInt(json['telegram_channel_user_count']);

  @override
  String toString() {
    return '${Helpers.getTypeName(CoinCommunityData)}';
  }
}
