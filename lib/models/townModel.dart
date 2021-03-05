class TownModel {
  final String countryID;
  final String townName;
  final String latitude;
  final String longitude;

  TownModel(this.countryID, this.townName, this.latitude, this.longitude);

  factory TownModel.fromMap(Map<String, dynamic> data) {
    return TownModel(data['country'], data['name'], data['lat'], data['lng']);
  }
}
