import 'package:flutter/material.dart';
import 'package:weathers/weathers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weathers Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Weathers Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WeatherService weatherService = WeatherService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: StreamBuilder(
        stream: weatherService
            .getTemperatureByTown("TR", "Erdemli",
                language: "tr", tempUnit: "c")
            .asStream(),
        builder: (context, snapshot) {
          DayTemperatureModel model = snapshot.data;
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Text(
                    model.title,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  leading: Text(model.currentTemperature.weatherTemperature),
                  title: Text(model.currentTemperature.weatherStatus),
                ),
                ListTile(
                  leading: Text("Morining"),
                  title: Text(model.morningTemperature.weatherTemperature +
                      " Chance of Rain: " +
                      model.morningTemperature.chanceOfRain),
                ),
                ListTile(
                  leading: Text("Evening"),
                  title: Text(model.eveningTemperature.weatherTemperature +
                      " Chance of Rain: " +
                      model.eveningTemperature.chanceOfRain),
                ),
                ListTile(
                  leading: Text("Overnight"),
                  title: Text(model.overnightTemperature.weatherTemperature +
                      " Chance of Rain: " +
                      model.overnightTemperature.chanceOfRain),
                ),
                ListTile(
                  title: Text("Humidity: " + model.humidity),
                ),
                ListTile(
                  title: Text("Pressure: " + model.pressure),
                ),
                ListTile(
                  title: Text("High Low Rate: " + model.highLowRate),
                ),
                ListTile(
                  title: Text("Dew Point: " + model.devPoint),
                ),
                ListTile(
                  title: Text("Moon Phase: " + model.moonPhase),
                ),
                ListTile(
                  title: Text("Uv Index: " + model.uvIndex),
                ),
                ListTile(
                  title: Text("Sunrise Time: " + model.sunriseTime),
                ),
                ListTile(
                  title: Text("Sunset Time: " + model.sunsetTime),
                ),
                ListTile(
                  title: Text("Wind: " + model.wind),
                ),
              ],
            ),
          );
        },
      )),
    );
  }
}
