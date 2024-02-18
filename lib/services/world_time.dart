import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location = '';
  String time = '';
  String flag = '';
  String url = '';

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try{
      // Make Request
      Response response =
      await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);

      // Get Properties
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // create a datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // Set the time property
      time = now.toString();
    }
    catch(e){
      time = "Unable to get Time Data";
    }

  }
}
