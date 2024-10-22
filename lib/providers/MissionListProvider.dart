import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:midterm_app/data/mission.dart';
import 'package:http/http.dart' as http;

class MissionListProvider extends ChangeNotifier{


  List<Mission> _missions = [];
  bool _isloading = true;
  bool _isError = false;
  bool _firstCall = false;


  bool get firstCall => _firstCall;
  bool get isLoading => _isloading;
  bool get isError => _isError;
  List<Mission> get missions => _missions;

  void fetchMissions() async {
    _firstCall = true;
    final res =
    await http.get(Uri.parse("https://api.spacexdata.com/v3/missions"));

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      _missions = (data as List).map((mission) {
        return Mission.fromJson(mission);
      }).toList();


      _isloading = false;
    } else {
      _isError = true;
      _isloading = false;
    }
    notifyListeners();
  }
}