class SpokenLanguageData {
  late String englishName;
  late String iso_639_1;
  late String name;

  SpokenLanguageData({
    required this.englishName,
    required this.iso_639_1,
    required this.name
  });

  static SpokenLanguageData getObjectFromJson(Map<String,dynamic> jsonData) {
    return SpokenLanguageData(
      englishName: jsonData['english_name'],
      iso_639_1: jsonData['iso_639_1'], 
      name: jsonData['name']);
  }

}

