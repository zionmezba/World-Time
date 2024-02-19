import 'package:flutter/material.dart';
import 'package:world_time/services/weather.dart';

import '../services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(location: "Dhaka", flag: "bd.png", url: "Asia/Dhaka"),
    WorldTime(location: 'London', flag: 'uk.png', url: 'Europe/London'),
    WorldTime(location: 'Athens', flag: 'greece.png', url: 'Europe/Berlin'),
    WorldTime(location: 'Cairo', flag: 'egypt.png', url: 'Africa/Cairo'),
    WorldTime(location: 'New York', flag: 'usa.png', url: 'America/New_York'),
    WorldTime(location: 'Tokyo', flag: 'japan.png', url: 'Asia/Tokyo'),
    WorldTime(
        location: 'Sydney', flag: 'australia.png', url: 'Australia/Sydney'),
    WorldTime(location: 'Dubai', flag: 'uae.png', url: 'Asia/Dubai'),
    WorldTime(
        location: 'Rio de Janeiro',
        flag: 'brazil.png',
        url: 'America/Sao_Paulo'),
    WorldTime(location: 'Moscow', flag: 'russia.png', url: 'Europe/Moscow'),
    WorldTime(location: 'Beijing', flag: 'china.png', url: 'Asia/Shanghai'),
    WorldTime(location: 'Paris', flag: 'france.png', url: 'Europe/Paris'),
    WorldTime(
        location: 'Los Angeles', flag: 'usa.png', url: 'America/Los_Angeles'),
    WorldTime(location: 'Toronto', flag: 'canada.png', url: 'America/Toronto'),
    WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin'),
    WorldTime(location: 'Mumbai', flag: 'india.png', url: 'Asia/Kolkata'),
    WorldTime(
        location: 'Singapore', flag: 'singapore.png', url: 'Asia/Singapore'),
    WorldTime(
        location: 'Mexico City',
        flag: 'mexico.png',
        url: 'America/Mexico_City'),
    WorldTime(location: 'Istanbul', flag: 'turkey.png', url: 'Europe/Istanbul'),
    WorldTime(location: 'Bangkok', flag: 'thailand.png', url: 'Asia/Bangkok'),
    WorldTime(location: 'Seoul', flag: 'south_korea.png', url: 'Asia/Seoul'),
    WorldTime(location: 'Rome', flag: 'italy.png', url: 'Europe/Rome'),
    WorldTime(
        location: 'Sao Paulo', flag: 'brazil.png', url: 'America/Sao_Paulo'),
  ];

  void updateTime(index) async {
    WorldTime inst = locations[index];
    await inst.getTime();

    Weather weather = Weather(locationW: locations[index].location);
    await weather.getWeather();

    // print(weather.weatherDescription);
    // navigate to home
    Navigator.pop(context,{
      'location': inst.location,
      'flag': inst.flag,
      'time': inst.time,
      'isDayTime': inst.isDayTime,
      'temperature': weather.temperature,
      'windSpeed': weather.windSpeed,
      'weatherDescription': weather.weatherDescription,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text("Choose a Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/flags/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
        itemCount: locations.length,
      ),
    );
  }
}
