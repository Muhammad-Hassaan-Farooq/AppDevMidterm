import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:midterm_app/bloc/MissionEvent.dart';
import 'package:midterm_app/bloc/MissionState.dart';
import 'package:http/http.dart' as http;
import 'package:midterm_app/data/mission.dart';

class MissionBloc extends Bloc<MissionEvent,MissionState>{
  MissionBloc():super(MissionInitial()){
    on<FetchMissions>(_onFetchMissions);
  }


  Future<void> _onFetchMissions(
      FetchMissions event,
      Emitter<MissionState> emit,
      ) async {

    emit(MissionLoading());

    try{

      final res = await http.get(Uri.parse("https://api.spacexdata.com/v3/missions"));

      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        List<Mission> missions = (data as List).map((mission) {
          return Mission.fromJson(mission);
        }).toList();

        emit(MissionLoaded(missions));

      } else {

        throw Exception("Error loading missions");
      }
    }
    catch(e){

      emit(MissionError('Error: $e'));
    }
  }
}