import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  setupWorlTime() async {
    WorldTime worldTime = WorldTime(location: "Dhaka", flag: "bd.jgp", url: "Asia/Dhaka");
    await worldTime.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location': worldTime.location,
      'flag': worldTime.flag,
      'time': worldTime.time,
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
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Text("Loading"),
      ),
    );
  }
}
