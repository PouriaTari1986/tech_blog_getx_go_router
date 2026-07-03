// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/3899618.svg
  String get a3899618 => 'assets/images/3899618.svg';

  /// File path: assets/images/arrow.svg
  String get arrow => 'assets/images/arrow.svg';

  /// File path: assets/images/article_writing.svg
  String get articleWriting => 'assets/images/article_writing.svg';

  /// File path: assets/images/blog.png
  AssetGenImage get blog => const AssetGenImage('assets/images/blog.png');

  /// File path: assets/images/hashtag.png
  AssetGenImage get hashtag => const AssetGenImage('assets/images/hashtag.png');

  /// File path: assets/images/home.png
  AssetGenImage get home => const AssetGenImage('assets/images/home.png');

  /// File path: assets/images/icon.png
  AssetGenImage get icon => const AssetGenImage('assets/images/icon.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/podcast.png
  AssetGenImage get podcast => const AssetGenImage('assets/images/podcast.png');

  /// File path: assets/images/profile.png
  AssetGenImage get profile => const AssetGenImage('assets/images/profile.png');

  /// File path: assets/images/programming1.png
  AssetGenImage get programming1 =>
      const AssetGenImage('assets/images/programming1.png');

  /// File path: assets/images/re.png
  AssetGenImage get re => const AssetGenImage('assets/images/re.png');

  /// File path: assets/images/record.png
  AssetGenImage get record => const AssetGenImage('assets/images/record.png');

  /// File path: assets/images/register.png
  AssetGenImage get register =>
      const AssetGenImage('assets/images/register.png');

  /// File path: assets/images/right_arrow.png
  AssetGenImage get rightArrowPng =>
      const AssetGenImage('assets/images/right_arrow.png');

  /// File path: assets/images/right_arrow.svg
  String get rightArrowSvg => 'assets/images/right_arrow.svg';

  /// File path: assets/images/search.svg
  String get search => 'assets/images/search.svg';

  /// File path: assets/images/singlePr.png
  AssetGenImage get singlePr =>
      const AssetGenImage('assets/images/singlePr.png');

  /// File path: assets/images/single_place_holder.jpg
  AssetGenImage get singlePlaceHolder =>
      const AssetGenImage('assets/images/single_place_holder.jpg');

  /// File path: assets/images/threeLine.svg
  String get threeLine => 'assets/images/threeLine.svg';

  /// File path: assets/images/user.png
  AssetGenImage get user => const AssetGenImage('assets/images/user.png');

  /// File path: assets/images/welcome.svg
  String get welcome => 'assets/images/welcome.svg';

  /// File path: assets/images/write.png
  AssetGenImage get write => const AssetGenImage('assets/images/write.png');

  /// File path: assets/images/write_article.png
  AssetGenImage get writeArticle =>
      const AssetGenImage('assets/images/write_article.png');

  /// File path: assets/images/write_podcast_icon.png
  AssetGenImage get writePodcastIcon =>
      const AssetGenImage('assets/images/write_podcast_icon.png');

  /// List of all assets
  List<dynamic> get values => [
    a3899618,
    arrow,
    articleWriting,
    blog,
    hashtag,
    home,
    icon,
    logo,
    podcast,
    profile,
    programming1,
    re,
    record,
    register,
    rightArrowPng,
    rightArrowSvg,
    search,
    singlePr,
    singlePlaceHolder,
    threeLine,
    user,
    welcome,
    write,
    writeArticle,
    writePodcastIcon,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
