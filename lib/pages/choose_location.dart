import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(urlEndPoint: 'Asia/Kolkata', location: 'India', flag: 'india.png'),
    WorldTime(urlEndPoint: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(urlEndPoint: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(urlEndPoint: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(urlEndPoint: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(urlEndPoint: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(urlEndPoint: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(urlEndPoint: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(urlEndPoint: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async{
    WorldTime instense = locations[index];
    await instense.getTime();
    //navigate to home screen
    Navigator.pop(context,{
      'location': instense.location,
      'falg': instense.flag,
      'time': instense.time,
      'isDayTime' : instense.isDayTime,
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
