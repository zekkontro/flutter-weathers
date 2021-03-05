import 'package:weathers/models/temperatureModel.dart';

class DayTemperatureModel {
  final TemperatureModel currentTemperature;
  final TemperatureModel morningTemperature;
  final TemperatureModel afternoonTemperature;
  final TemperatureModel eveningTemperature;
  final TemperatureModel overnightTemperature;
  final String devPoint;
  final String highLowRate;
  final String humidity;
  final String moonPhase;
  final String pressure;
  final String sunriseTime;
  final String sunsetTime;
  final String title;
  final String uvIndex;
  final String wind;

  DayTemperatureModel(
      this.currentTemperature,
      this.morningTemperature,
      this.afternoonTemperature,
      this.eveningTemperature,
      this.overnightTemperature,
      this.devPoint,
      this.highLowRate,
      this.humidity,
      this.moonPhase,
      this.pressure,
      this.sunriseTime,
      this.sunsetTime,
      this.title,
      this.uvIndex,
      this.wind);

  factory DayTemperatureModel.fromMap(Map<String, dynamic> mapData) {
    return DayTemperatureModel(
        TemperatureModel.fromMap(mapData['currentTemperature']),
        TemperatureModel.fromMap(mapData['morningTemperature']),
        TemperatureModel.fromMap(mapData['afternoonTemperature']),
        TemperatureModel.fromMap(mapData['eveningTemperature']),
        TemperatureModel.fromMap(mapData['overnightTemperature']),
        mapData['dewPoint'],
        mapData['highLowRate'],
        mapData['humidity'],
        mapData['moonPhase'],
        mapData['pressure'],
        mapData['sunriseTime'],
        mapData['sunsetTime'],
        mapData['title'],
        mapData['uvIndex'],
        mapData['wind']);
  }
}
