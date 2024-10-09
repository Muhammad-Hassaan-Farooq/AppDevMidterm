
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:midterm_app/data/mission.dart';

Future<List<Mission>> fetchMissions() async{
  final res = await http.get(Uri.parse("https://api.spacexdata.com/v3/missions"));

  if (res.statusCode == 200) {
    final data = jsonDecode(res.body);
    List<Mission> missions = (data as List).map((mission){
        return Mission.fromJson(mission);
    }).toList();
    return missions;
  }
  else{
    
    throw Exception("failed to load missions");
  }
} 

class MissionList extends StatefulWidget{
    const MissionList({super.key});
    @override
  State<StatefulWidget> createState() => _MissionList();
}

class _MissionList extends State<MissionList>{
  late Future<List<Mission>> missions;
  @override
        void initState() {
            super.initState();
            missions = fetchMissions();
        } 
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(future: missions, builder: (context,snapshot){
        if (snapshot.hasData) { 
          print(snapshot.data);
          return ListView.builder(itemCount: snapshot.data!.length,itemBuilder: (context,index){
            return Card(
              child: Column(
                children: [
                  Text(snapshot.data![index].name),
                 Text(snapshot.data![index].description) 
                ],
              ),
            );
          });
        }
        else if(snapshot.hasError){
          print(snapshot.error);
          return Text("Error loading data");
        }
        return CircularProgressIndicator();
      }),
    );
  }
}