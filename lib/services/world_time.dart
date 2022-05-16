import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';


class WorldTime {

  late String location;
  late String time;
  late String flag;
  late String urlEndPoint;
  late bool isDayTime;


  WorldTime({required this.location, required this.flag, required this.urlEndPoint});

  Future<void> getTime() async{
    // print("get time");
    // Response response = await get(Uri.parse("http://worldtimeapi.org/api/timezone/Asia/Kolkata"));
    // print(response.body);
    try{
      var url = Uri.parse( "http://worldtimeapi.org/api/timezone/$urlEndPoint" );
      var response = await http.get(url);
      Map data = jsonDecode(response.body);

      // print(data);
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      DateTime now = DateTime.parse(dateTime);
      now =now.add(Duration(hours:int.parse(offset) ));
      isDayTime = now.hour >6 && now.hour <20 ? true : false;
      time= DateFormat.jm().format(now);
    }
    catch(e){
      print("error got:$e");
      time = "Could not fetch the data";
    }
    // print(now);
    // print(offset);
  }


}

