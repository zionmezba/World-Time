import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    // print(data);

    // set bg
    String bgImage = data['isDayTime'] ? 'day.jpg' : 'night.jpg';
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/$bgImage'), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: [
              IconButton(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'time': result['time'],
                      'location': result['location'],
                      'isDayTime': result['isDayTime'],
                      'flag': result['flag'],
                      'locationW' : result['locationW'],
                      'temperature' : result['temperature'],
                      'windSpeed' : result['windSpeed'],
                      'weatherDescription' : result['weatherDescription'],
                    };
                  });
                },
                icon: const Icon(
                  Icons.edit_location,
                  size: 30,
                ),
                color: Colors.grey[100],
                tooltip: "Select Location",
              ),
              const Text(
                "Choose Location",
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: const TextStyle(
                        fontSize: 28, letterSpacing: 2.0, color: Colors.white),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                data['time'],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 66,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Text(
                "${data['temperature']}\u00B0c",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 55,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "${data['weatherDescription']}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.wind_power,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10,),
                  Text(
                    "${data['windSpeed']} km/h",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
