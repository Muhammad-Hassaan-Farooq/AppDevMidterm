import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:midterm_app/bloc/MissionBloc.dart';
import 'package:midterm_app/bloc/MissionEvent.dart';
import 'package:midterm_app/missions.dart';
import 'package:midterm_app/providers/MissionListProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    BlocProvider(
        create: (context) => MissionBloc()..add(FetchMissions()),
        child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Space Missions',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Space Missions'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor:const Color(0xff006a69),
       
        title: Text(widget.title,style: const TextStyle(color: Colors.white),),
      ),
      body: const MissionList(),
    
    );
  }
}
