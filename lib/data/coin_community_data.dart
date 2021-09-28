import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

class CoinCommunityData {
  final int? facebookLikes;
  final int? twitterFollowers;
  final double? redditAveragePosts48h;
  final double? redditAverageComments48h;
  final int? redditSubscribers;
  final double? redditAccountsActive48h;
  final int? telegramChannelUserCount;

  CoinCommunityData.fromJson(Map<String, dynamic> json)
      : this.facebookLikes = Convert.toInt(json['facebook_likes']),
        this.twitterFollowers = Convert.toInt(json['twitter_followers']),
        this.redditAveragePosts48h = Convert.toDouble(json['reddit_average_posts_48h']),
        this.redditAverageComments48h = Convert.toDouble(json['reddit_average_comments_48h']),
        this.redditSubscribers = Convert.toInt(json['reddit_subscribers']),
        this.redditAccountsActive48h = Convert.toDouble(json['reddit_accounts_active_48h']),
        this.telegramChannelUserCount = Convert.toInt(json['telegram_channel_user_count']) {}

  @override
  String toString() {
    return '${Helpers.getTypeName(CoinCommunityData)}';
  }
}
