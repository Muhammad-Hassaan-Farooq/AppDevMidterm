import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:midterm_app/data/mission.dart';
import 'package:midterm_app/expandable_desc.dart';
import 'package:midterm_app/providers/MissionListProvider.dart';
import 'package:provider/provider.dart';



class MissionList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    if(!context.read<MissionListProvider>().firstCall){
      context.read<MissionListProvider>().fetchMissions();
    }

    bool isLoading = context.watch<MissionListProvider>().isLoading;


    if(isLoading){
      return const CircularProgressIndicator();
    }
    else{
      if(context.watch<MissionListProvider>().isError){
        return const Text("Error loading data");
      }
      List<Mission> missions = context.watch<MissionListProvider>().missions;
      return ListView.builder(

          itemCount: missions.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                      children: [
                        Text(

                          missions[index].name,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )
                      ]),
                  ExpandableDesc(
                    desc: missions[index].description,
                  ),
                  Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: [
                      for (String chip
                      in missions[index].payloads)
                        Chip(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                          label: Text(
                              style:
                              const TextStyle(color: Colors.black),
                              chip),
                          backgroundColor: Colors.primaries[Random()
                              .nextInt(Colors.primaries.length)],

                        ),
                    ],
                  )
                ],
              ),
            );
          });
    }



  }
}
