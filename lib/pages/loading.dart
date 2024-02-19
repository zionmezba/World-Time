import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/services/world_time.dart';
import 'package:world_time/services/weather.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  setupWorlTime() async {
    WorldTime worldTime =
        WorldTime(location: "Dhaka", flag: "bd.jgp", url: "Asia/Dhaka");
    await worldTime.getTime();

    Weather weather =
    Weather(locationW: "Dhaka");
    await weather.getWeather();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': worldTime.location,
      'flag': worldTime.flag,
      'time': worldTime.time,
      'isDayTime': worldTime.isDayTime,
      'temperature': weather.temperature,
      'windSpeed': weather.windSpeed,
      'weatherDescription': weather.weatherDescription,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorlTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitPouringHourGlass(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
