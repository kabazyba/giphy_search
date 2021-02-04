
import 'dart:convert';

class GiphyData {
  GiphyData({
    this.gifList,
    this.pagination,
    this.meta,
  });

  List<Gif> gifList;
  Pagination pagination;
  Meta meta;

  factory GiphyData.fromRawJson(String str) => GiphyData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GiphyData.fromJson(Map<String, dynamic> json) => GiphyData(
    gifList: json["data"] == null ? null : List<Gif>.from(json["data"].map((x) => Gif.fromJson(x))),
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": gifList == null ? null : List<dynamic>.from(gifList.map((x) => x.toJson())),
    "pagination": pagination == null ? null : pagination.toJson(),
    "meta": meta == null ? null : meta.toJson(),
  };
}

class Gif {
  Gif({
    this.type,
    this.id,
    this.url,
    this.slug,
    this.bitlyGifUrl,
    this.bitlyUrl,
    this.embedUrl,
    this.username,
    this.source,
    this.title,
    this.rating,
    this.contentUrl,
    this.sourceTld,
    this.sourcePostUrl,
    this.isSticker,
    this.importDatetime,
    this.trendingDatetime,
    this.images,
    this.user,
    this.analyticsResponsePayload,
    this.analytics,
  });

  String type;
  String id;
  String url;
  String slug;
  String bitlyGifUrl;
  String bitlyUrl;
  String embedUrl;
  String username;
  String source;
  String title;
  String rating;
  String contentUrl;
  String sourceTld;
  String sourcePostUrl;
  int isSticker;
  DateTime importDatetime;
  DateTime trendingDatetime;
  Images images;
  User user;
  String analyticsResponsePayload;
  Analytics analytics;

  factory Gif.fromRawJson(String str) => Gif.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Gif.fromJson(Map<String, dynamic> json) => Gif(
    type: json["type"] == null ? null : json["type"],
    id: json["id"] == null ? null : json["id"],
    url: json["url"] == null ? null : json["url"],
    slug: json["slug"] == null ? null : json["slug"],
    bitlyGifUrl: json["bitly_gif_url"] == null ? null : json["bitly_gif_url"],
    bitlyUrl: json["bitly_url"] == null ? null : json["bitly_url"],
    embedUrl: json["embed_url"] == null ? null : json["embed_url"],
    username: json["username"] == null ? null : json["username"],
    source: json["source"] == null ? null : json["source"],
    title: json["title"] == null ? null : json["title"],
    rating: json["rating"] == null ? null : json["rating"],
    contentUrl: json["content_url"] == null ? null : json["content_url"],
    sourceTld: json["source_tld"] == null ? null : json["source_tld"],
    sourcePostUrl: json["source_post_url"] == null ? null : json["source_post_url"],
    isSticker: json["is_sticker"] == null ? null : json["is_sticker"],
    importDatetime: json["import_datetime"] == null ? null : DateTime.parse(json["import_datetime"]),
    trendingDatetime: json["trending_datetime"] == null ? null : DateTime.parse(json["trending_datetime"]),
    images: json["images"] == null ? null : Images.fromJson(json["images"]),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    analyticsResponsePayload: json["analytics_response_payload"] == null ? null : json["analytics_response_payload"],
    analytics: json["analytics"] == null ? null : Analytics.fromJson(json["analytics"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type == null ? null : type,
    "id": id == null ? null : id,
    "url": url == null ? null : url,
    "slug": slug == null ? null : slug,
    "bitly_gif_url": bitlyGifUrl == null ? null : bitlyGifUrl,
    "bitly_url": bitlyUrl == null ? null : bitlyUrl,
    "embed_url": embedUrl == null ? null : embedUrl,
    "username": username == null ? null : username,
    "source": source == null ? null : source,
    "title": title == null ? null : title,
    "rating": rating == null ? null : rating,
    "content_url": contentUrl == null ? null : contentUrl,
    "source_tld": sourceTld == null ? null : sourceTld,
    "source_post_url": sourcePostUrl == null ? null : sourcePostUrl,
    "is_sticker": isSticker == null ? null : isSticker,
    "import_datetime": importDatetime == null ? null : importDatetime.toIso8601String(),
    "trending_datetime": trendingDatetime == null ? null : trendingDatetime.toIso8601String(),
    "images": images == null ? null : images.toJson(),
    "user": user == null ? null : user.toJson(),
    "analytics_response_payload": analyticsResponsePayload == null ? null : analyticsResponsePayload,
    "analytics": analytics == null ? null : analytics.toJson(),
  };
}

class Analytics {
  Analytics({
    this.onload,
    this.onclick,
    this.onsent,
  });

  Onclick onload;
  Onclick onclick;
  Onclick onsent;

  factory Analytics.fromRawJson(String str) => Analytics.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Analytics.fromJson(Map<String, dynamic> json) => Analytics(
    onload: json["onload"] == null ? null : Onclick.fromJson(json["onload"]),
    onclick: json["onclick"] == null ? null : Onclick.fromJson(json["onclick"]),
    onsent: json["onsent"] == null ? null : Onclick.fromJson(json["onsent"]),
  );

  Map<String, dynamic> toJson() => {
    "onload": onload == null ? null : onload.toJson(),
    "onclick": onclick == null ? null : onclick.toJson(),
    "onsent": onsent == null ? null : onsent.toJson(),
  };
}

class Onclick {
  Onclick({
    this.url,
  });

  String url;

  factory Onclick.fromRawJson(String str) => Onclick.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Onclick.fromJson(Map<String, dynamic> json) => Onclick(
    url: json["url"] == null ? null : json["url"],
  );

  Map<String, dynamic> toJson() => {
    "url": url == null ? null : url,
  };
}

class Images {
  Images({
    this.original,
    this.downsized,
    this.downsizedLarge,
    this.downsizedMedium,
    this.downsizedSmall,
    this.downsizedStill,
    this.fixedHeight,
    this.fixedHeightDownsampled,
    this.fixedHeightSmall,
    this.fixedHeightSmallStill,
    this.fixedHeightStill,
    this.fixedWidth,
    this.fixedWidthDownsampled,
    this.fixedWidthSmall,
    this.fixedWidthSmallStill,
    this.fixedWidthStill,
    this.looping,
    this.originalStill,
    this.originalMp4,
    this.preview,
    this.previewGif,
    this.previewWebp,
    this.the480WStill,
  });

  FixedHeight original;
  The480WStill downsized;
  The480WStill downsizedLarge;
  The480WStill downsizedMedium;
  DownsizedSmall downsizedSmall;
  The480WStill downsizedStill;
  FixedHeight fixedHeight;
  FixedHeight fixedHeightDownsampled;
  FixedHeight fixedHeightSmall;
  The480WStill fixedHeightSmallStill;
  The480WStill fixedHeightStill;
  FixedHeight fixedWidth;
  FixedHeight fixedWidthDownsampled;
  FixedHeight fixedWidthSmall;
  The480WStill fixedWidthSmallStill;
  The480WStill fixedWidthStill;
  Looping looping;
  The480WStill originalStill;
  DownsizedSmall originalMp4;
  DownsizedSmall preview;
  The480WStill previewGif;
  The480WStill previewWebp;
  The480WStill the480WStill;

  factory Images.fromRawJson(String str) => Images.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    original: json["original"] == null ? null : FixedHeight.fromJson(json["original"]),
    downsized: json["downsized"] == null ? null : The480WStill.fromJson(json["downsized"]),
    downsizedLarge: json["downsized_large"] == null ? null : The480WStill.fromJson(json["downsized_large"]),
    downsizedMedium: json["downsized_medium"] == null ? null : The480WStill.fromJson(json["downsized_medium"]),
    downsizedSmall: json["downsized_small"] == null ? null : DownsizedSmall.fromJson(json["downsized_small"]),
    downsizedStill: json["downsized_still"] == null ? null : The480WStill.fromJson(json["downsized_still"]),
    fixedHeight: json["fixed_height"] == null ? null : FixedHeight.fromJson(json["fixed_height"]),
    fixedHeightDownsampled: json["fixed_height_downsampled"] == null ? null : FixedHeight.fromJson(json["fixed_height_downsampled"]),
    fixedHeightSmall: json["fixed_height_small"] == null ? null : FixedHeight.fromJson(json["fixed_height_small"]),
    fixedHeightSmallStill: json["fixed_height_small_still"] == null ? null : The480WStill.fromJson(json["fixed_height_small_still"]),
    fixedHeightStill: json["fixed_height_still"] == null ? null : The480WStill.fromJson(json["fixed_height_still"]),
    fixedWidth: json["fixed_width"] == null ? null : FixedHeight.fromJson(json["fixed_width"]),
    fixedWidthDownsampled: json["fixed_width_downsampled"] == null ? null : FixedHeight.fromJson(json["fixed_width_downsampled"]),
    fixedWidthSmall: json["fixed_width_small"] == null ? null : FixedHeight.fromJson(json["fixed_width_small"]),
    fixedWidthSmallStill: json["fixed_width_small_still"] == null ? null : The480WStill.fromJson(json["fixed_width_small_still"]),
    fixedWidthStill: json["fixed_width_still"] == null ? null : The480WStill.fromJson(json["fixed_width_still"]),
    looping: json["looping"] == null ? null : Looping.fromJson(json["looping"]),
    originalStill: json["original_still"] == null ? null : The480WStill.fromJson(json["original_still"]),
    originalMp4: json["original_mp4"] == null ? null : DownsizedSmall.fromJson(json["original_mp4"]),
    preview: json["preview"] == null ? null : DownsizedSmall.fromJson(json["preview"]),
    previewGif: json["preview_gif"] == null ? null : The480WStill.fromJson(json["preview_gif"]),
    previewWebp: json["preview_webp"] == null ? null : The480WStill.fromJson(json["preview_webp"]),
    the480WStill: json["480w_still"] == null ? null : The480WStill.fromJson(json["480w_still"]),
  );

  Map<String, dynamic> toJson() => {
    "original": original == null ? null : original.toJson(),
    "downsized": downsized == null ? null : downsized.toJson(),
    "downsized_large": downsizedLarge == null ? null : downsizedLarge.toJson(),
    "downsized_medium": downsizedMedium == null ? null : downsizedMedium.toJson(),
    "downsized_small": downsizedSmall == null ? null : downsizedSmall.toJson(),
    "downsized_still": downsizedStill == null ? null : downsizedStill.toJson(),
    "fixed_height": fixedHeight == null ? null : fixedHeight.toJson(),
    "fixed_height_downsampled": fixedHeightDownsampled == null ? null : fixedHeightDownsampled.toJson(),
    "fixed_height_small": fixedHeightSmall == null ? null : fixedHeightSmall.toJson(),
    "fixed_height_small_still": fixedHeightSmallStill == null ? null : fixedHeightSmallStill.toJson(),
    "fixed_height_still": fixedHeightStill == null ? null : fixedHeightStill.toJson(),
    "fixed_width": fixedWidth == null ? null : fixedWidth.toJson(),
    "fixed_width_downsampled": fixedWidthDownsampled == null ? null : fixedWidthDownsampled.toJson(),
    "fixed_width_small": fixedWidthSmall == null ? null : fixedWidthSmall.toJson(),
    "fixed_width_small_still": fixedWidthSmallStill == null ? null : fixedWidthSmallStill.toJson(),
    "fixed_width_still": fixedWidthStill == null ? null : fixedWidthStill.toJson(),
    "looping": looping == null ? null : looping.toJson(),
    "original_still": originalStill == null ? null : originalStill.toJson(),
    "original_mp4": originalMp4 == null ? null : originalMp4.toJson(),
    "preview": preview == null ? null : preview.toJson(),
    "preview_gif": previewGif == null ? null : previewGif.toJson(),
    "preview_webp": previewWebp == null ? null : previewWebp.toJson(),
    "480w_still": the480WStill == null ? null : the480WStill.toJson(),
  };
}

class The480WStill {
  The480WStill({
    this.height,
    this.width,
    this.size,
    this.url,
  });

  String height;
  String width;
  String size;
  String url;

  factory The480WStill.fromRawJson(String str) => The480WStill.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory The480WStill.fromJson(Map<String, dynamic> json) => The480WStill(
    height: json["height"] == null ? null : json["height"],
    width: json["width"] == null ? null : json["width"],
    size: json["size"] == null ? null : json["size"],
    url: json["url"] == null ? null : json["url"],
  );

  Map<String, dynamic> toJson() => {
    "height": height == null ? null : height,
    "width": width == null ? null : width,
    "size": size == null ? null : size,
    "url": url == null ? null : url,
  };
}

class DownsizedSmall {
  DownsizedSmall({
    this.height,
    this.width,
    this.mp4Size,
    this.mp4,
  });

  String height;
  String width;
  String mp4Size;
  String mp4;

  factory DownsizedSmall.fromRawJson(String str) => DownsizedSmall.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DownsizedSmall.fromJson(Map<String, dynamic> json) => DownsizedSmall(
    height: json["height"] == null ? null : json["height"],
    width: json["width"] == null ? null : json["width"],
    mp4Size: json["mp4_size"] == null ? null : json["mp4_size"],
    mp4: json["mp4"] == null ? null : json["mp4"],
  );

  Map<String, dynamic> toJson() => {
    "height": height == null ? null : height,
    "width": width == null ? null : width,
    "mp4_size": mp4Size == null ? null : mp4Size,
    "mp4": mp4 == null ? null : mp4,
  };
}

class FixedHeight {
  FixedHeight({
    this.height,
    this.width,
    this.size,
    this.url,
    this.mp4Size,
    this.mp4,
    this.webpSize,
    this.webp,
    this.frames,
    this.hash,
  });

  String height;
  String width;
  String size;
  String url;
  String mp4Size;
  String mp4;
  String webpSize;
  String webp;
  String frames;
  String hash;

  factory FixedHeight.fromRawJson(String str) => FixedHeight.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FixedHeight.fromJson(Map<String, dynamic> json) => FixedHeight(
    height: json["height"] == null ? null : json["height"],
    width: json["width"] == null ? null : json["width"],
    size: json["size"] == null ? null : json["size"],
    url: json["url"] == null ? null : json["url"],
    mp4Size: json["mp4_size"] == null ? null : json["mp4_size"],
    mp4: json["mp4"] == null ? null : json["mp4"],
    webpSize: json["webp_size"] == null ? null : json["webp_size"],
    webp: json["webp"] == null ? null : json["webp"],
    frames: json["frames"] == null ? null : json["frames"],
    hash: json["hash"] == null ? null : json["hash"],
  );

  Map<String, dynamic> toJson() => {
    "height": height == null ? null : height,
    "width": width == null ? null : width,
    "size": size == null ? null : size,
    "url": url == null ? null : url,
    "mp4_size": mp4Size == null ? null : mp4Size,
    "mp4": mp4 == null ? null : mp4,
    "webp_size": webpSize == null ? null : webpSize,
    "webp": webp == null ? null : webp,
    "frames": frames == null ? null : frames,
    "hash": hash == null ? null : hash,
  };
}

class Looping {
  Looping({
    this.mp4Size,
    this.mp4,
  });

  String mp4Size;
  String mp4;

  factory Looping.fromRawJson(String str) => Looping.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Looping.fromJson(Map<String, dynamic> json) => Looping(
    mp4Size: json["mp4_size"] == null ? null : json["mp4_size"],
    mp4: json["mp4"] == null ? null : json["mp4"],
  );

  Map<String, dynamic> toJson() => {
    "mp4_size": mp4Size == null ? null : mp4Size,
    "mp4": mp4 == null ? null : mp4,
  };
}

class User {
  User({
    this.avatarUrl,
    this.bannerImage,
    this.bannerUrl,
    this.profileUrl,
    this.username,
    this.displayName,
    this.description,
    this.instagramUrl,
    this.websiteUrl,
    this.isVerified,
  });

  String avatarUrl;
  String bannerImage;
  String bannerUrl;
  String profileUrl;
  String username;
  String displayName;
  String description;
  String instagramUrl;
  String websiteUrl;
  bool isVerified;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    avatarUrl: json["avatar_url"] == null ? null : json["avatar_url"],
    bannerImage: json["banner_image"] == null ? null : json["banner_image"],
    bannerUrl: json["banner_url"] == null ? null : json["banner_url"],
    profileUrl: json["profile_url"] == null ? null : json["profile_url"],
    username: json["username"] == null ? null : json["username"],
    displayName: json["display_name"] == null ? null : json["display_name"],
    description: json["description"] == null ? null : json["description"],
    instagramUrl: json["instagram_url"] == null ? null : json["instagram_url"],
    websiteUrl: json["website_url"] == null ? null : json["website_url"],
    isVerified: json["is_verified"] == null ? null : json["is_verified"],
  );

  Map<String, dynamic> toJson() => {
    "avatar_url": avatarUrl == null ? null : avatarUrl,
    "banner_image": bannerImage == null ? null : bannerImage,
    "banner_url": bannerUrl == null ? null : bannerUrl,
    "profile_url": profileUrl == null ? null : profileUrl,
    "username": username == null ? null : username,
    "display_name": displayName == null ? null : displayName,
    "description": description == null ? null : description,
    "instagram_url": instagramUrl == null ? null : instagramUrl,
    "website_url": websiteUrl == null ? null : websiteUrl,
    "is_verified": isVerified == null ? null : isVerified,
  };
}

class Meta {
  Meta({
    this.status,
    this.msg,
    this.responseId,
  });

  int status;
  String msg;
  String responseId;

  factory Meta.fromRawJson(String str) => Meta.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    status: json["status"] == null ? null : json["status"],
    msg: json["msg"] == null ? null : json["msg"],
    responseId: json["response_id"] == null ? null : json["response_id"],
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "msg": msg == null ? null : msg,
    "response_id": responseId == null ? null : responseId,
  };
}

class Pagination {
  Pagination({
    this.totalCount,
    this.count,
    this.offset,
  });

  int totalCount;
  int count;
  int offset;

  factory Pagination.fromRawJson(String str) => Pagination.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    totalCount: json["total_count"] == null ? null : json["total_count"],
    count: json["count"] == null ? null : json["count"],
    offset: json["offset"] == null ? null : json["offset"],
  );

  Map<String, dynamic> toJson() => {
    "total_count": totalCount == null ? null : totalCount,
    "count": count == null ? null : count,
    "offset": offset == null ? null : offset,
  };
}
