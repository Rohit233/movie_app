class ProductionCompanyData {
  late int id;
  late String? logoPath;
  late String name;
  late String originCountry;

  ProductionCompanyData({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  static ProductionCompanyData getObjectFromJson(Map<String,dynamic> jsonData) {
    return ProductionCompanyData(
      id: jsonData['id'],
      logoPath: jsonData['logo_path'],
      name: jsonData['name'],
      originCountry: jsonData['origin_country'],
    );
  }
}