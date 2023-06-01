class ProductionCountryData{
  late String iso_3166_1;
  late String name;

  ProductionCountryData({
    required this.iso_3166_1,
    required this.name
  });

  static ProductionCountryData getObjectFromJson(Map<String,dynamic> jsonData) {
    return ProductionCountryData(iso_3166_1: jsonData['iso_3166_1'], name: jsonData['name']);
  }
    
}