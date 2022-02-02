import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Image data wrapper
class ImageInfo {
  /// Thumbnail url
  final String? thumb;

  /// Small image url
  final String? small;

  /// Large image url
  final String? large;

  ImageInfo.fromJson(Map<String, dynamic> json)
      : this.thumb = Convert.toNullableString(json['thumb']),
        this.small = Convert.toNullableString(json['small']),
        this.large = Convert.toNullableString(json['large']);

  @override
  String toString() {
    return '${Helpers.getTypeName(ImageInfo)}: thumb = $thumb, small = $small, large = $large';
  }
}
