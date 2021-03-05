class TemperatureModel {
  final String weatherStatus;
  final String chanceOfRain;
  final String weatherTemperature;

  TemperatureModel(
      this.weatherStatus, this.chanceOfRain, this.weatherTemperature);

  factory TemperatureModel.fromMap(Map<String, dynamic> data) {
    return TemperatureModel(data['weatherStatus'] ?? "--", data['chanceOfRain'],
        data['weatherTemperature']);
  }
}
