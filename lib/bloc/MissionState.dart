import 'package:midterm_app/data/mission.dart';

abstract class MissionState{}

class MissionInitial extends MissionState{}
class MissionLoading extends MissionState{}
class MissionLoaded extends MissionState{
  final List<Mission> missions;
  MissionLoaded(this.missions);
}
class MissionError extends MissionState{
  final String error;
  MissionError(this.error);
}
