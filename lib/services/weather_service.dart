import 'package:http/http.dart' as http;
import 'package:weathers/models/dayTemperatureModel.dart';
import 'dart:convert';

import 'package:weathers/models/townModel.dart';

class WeatherService {
  String baseURL =
      "https://weathersapi.herokuapp.com/v1"; // Coding by Python - Flask

  Future<List<TownModel>> getSupportedCounties() async {
    String url = baseURL + "/towns";

    http.Response res = await http.get(Uri.parse(url));
    List<Map<String, dynamic>> jsonData = jsonDecode(res.body);
    List<TownModel> modelList =
        List<TownModel>.generate(jsonData.length, (index) {
      return TownModel.fromMap(jsonData[index]);
    });

    return modelList;
  }

  Future<DayTemperatureModel> getTemperatureByTown(
      String countryID, String townName,
      {String language, tempUnit}) async {
    String languageCode =
        language.isNotEmpty ? language + "-" + language.toUpperCase() : "en-US";
    String url = baseURL +
        "/country/$countryID/town/$townName/lang/$languageCode/tempUnit/${tempUnit ?? "c"}";

    http.Response res = await http.get(Uri.parse(url));
    Map<String, dynamic> data = jsonDecode(res.body);
    DayTemperatureModel dayTemperatureModel = DayTemperatureModel.fromMap(data);
    return dayTemperatureModel;
  }

  Future<DayTemperatureModel> getTemperatureByLatitudeLongitude(
      double latitude, double longitude,
      {String language, String tempUnit}) async {
    String languageCode =
        language.isNotEmpty ? language + "-" + language.toUpperCase() : "en-US";
    String url = baseURL +
        "/latitude/${latitude.toString()}/longitude/${longitude.toString()}/tempUnit/${tempUnit ?? "c"}/lang/$languageCode";

    http.Response res = await http.get(Uri.parse(url));
    Map<String, dynamic> data = jsonDecode(res.body);
    DayTemperatureModel dayTemperatureModel = DayTemperatureModel.fromMap(data);
    return dayTemperatureModel;
  }
}
