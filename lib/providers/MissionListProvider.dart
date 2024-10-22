import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:midterm_app/data/mission.dart';
import 'package:http/http.dart' as http;

class MissionListProvider extends ChangeNotifier{


  List<Mission> _missions = [];
  List<bool> _expanded =[];
  bool _isloading = true;
  bool _isError = false;
  bool _firstCall = false;


  bool get firstCall => _firstCall;
  bool get isLoading => _isloading;
  bool get isError => _isError;
  List<Mission> get missions => _missions;
  List<bool> get expanded => _expanded;

  void expand(int index){
    _expanded[index] = !_expanded[index];
    notifyListeners();
  }

  void fetchMissions() async {
    _firstCall = true;
    final res =
    await http.get(Uri.parse("https://api.spacexdata.com/v3/missions"));

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      _missions = (data as List).map((mission) {
        return Mission.fromJson(mission);
      }).toList();

      for(int i = 0; i<_missions.length; i++){
        expanded.add(false);
      }
      _isloading = false;
    } else {
      _isError = true;
      _isloading = false;
    }
    notifyListeners();
  }
}