import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// CoinCommunityData class represents the community data of a cryptocurrency.
class CoinCommunityData {
  /// The number of Facebook likes.
  final int? facebookLikes;

  /// The number of Twitter followers.
  final int? twitterFollowers;

  /// The average number of Reddit posts in the last 48 hours.
  final double? redditAveragePosts48h;

  /// The average number of Reddit comments in the last 48 hours.
  final double? redditAverageComments48h;

  /// The number of Reddit subscribers.
  final int? redditSubscribers;

  /// The number of active Reddit accounts in the last 48 hours.
  final double? redditAccountsActive48h;

  /// The number of users in the Telegram channel.
  final int? telegramChannelUserCount;

  /// Constructs a CoinCommunityData instance from a JSON map.
  ///
  /// [json] is a map containing the community data.
  CoinCommunityData.fromJson(Map<String, dynamic> json)
      : this.facebookLikes = Convert.toIntN(json['facebook_likes']),
        this.twitterFollowers = Convert.toIntN(json['twitter_followers']),
        this.redditAveragePosts48h =
            Convert.toDoubleN(json['reddit_average_posts_48h']),
        this.redditAverageComments48h =
            Convert.toDoubleN(json['reddit_average_comments_48h']),
        this.redditSubscribers = Convert.toIntN(json['reddit_subscribers']),
        this.redditAccountsActive48h =
            Convert.toDoubleN(json['reddit_accounts_active_48h']),
        this.telegramChannelUserCount =
            Convert.toIntN(json['telegram_channel_user_count']);

  /// Returns a string representation of the CoinCommunityData instance.
  @override
  String toString() {
    return '${Helpers.getTypeName(CoinCommunityData)}';
  }
}
