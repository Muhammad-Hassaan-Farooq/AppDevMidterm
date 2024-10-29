import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:midterm_app/bloc/MissionBloc.dart';
import 'package:midterm_app/bloc/MissionState.dart';
import 'package:midterm_app/data/mission.dart';
import 'package:midterm_app/expandable_desc.dart';
import 'package:midterm_app/providers/MissionListProvider.dart';
import 'package:provider/provider.dart';



class MissionList extends StatelessWidget {
  const MissionList({super.key});



  @override
  Widget build(BuildContext context) {


    return BlocBuilder<MissionBloc,MissionState>(builder: (context,state){

      if(state is MissionLoading){
        return const CircularProgressIndicator();
      }
      else if(state is MissionLoaded){
        return ListView.builder(

            itemCount: state.missions.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                        children: [
                          Text(

                            state.missions[index].name,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )
                        ]),
                    ExpandableDesc(
                        desc: state.missions[index].description,
                        index: index,
                        isExpanded: false,
                        onPress:(){ }
                    ),
                    Wrap(
                      spacing: 5,
                      runSpacing: 5,
                      children: [
                        for (String chip
                        in state.missions[index].payloads)
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
      else if(state is MissionError){return Center(child: Text(state.error));}
      return const Center(child: Text("Press button to fetch missions"));
    });


    }



  }

