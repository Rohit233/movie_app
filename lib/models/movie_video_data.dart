class MovieVideoData {
  late String name;
  late String key;
  late String site;
  late String type;
  late String publishedAt;
  late String id;

  MovieVideoData({
    required this.name,
    required this.key,
    required this.site,
    required this.type,
    required this.publishedAt,
    required this.id,
  });

  static MovieVideoData getObjectFromJson(Map<String,dynamic> jsonData) {
    return MovieVideoData(
      name: jsonData['name'], 
      key: jsonData['key'], 
      site: jsonData['site'], 
      type: jsonData['type'], 
      publishedAt: jsonData['published_at'], 
      id: jsonData['id']
    );
  }

}