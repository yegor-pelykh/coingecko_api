import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// A class that encapsulates image URLs of different sizes.
class ImageInfo {
  /// URL of the thumbnail image.
  final String? thumb;

  /// URL of the small-sized image.
  final String? small;

  /// URL of the large-sized image.
  final String? large;

  /// Constructs an [ImageInfo] instance from a JSON map.
  ///
  /// The [json] parameter is a map containing the image URLs.
  ImageInfo.fromJson(Map<String, dynamic> json)
      : this.thumb = Convert.toStrN(json['thumb']),
        this.small = Convert.toStrN(json['small']),
        this.large = Convert.toStrN(json['large']);

  /// Returns a string representation of the [ImageInfo] instance.
  ///
  /// The string includes the type name and the values of the image URLs.
  @override
  String toString() {
    return '${Helpers.getTypeName(ImageInfo)}: thumb = $thumb, small = $small, large = $large';
  }
}
