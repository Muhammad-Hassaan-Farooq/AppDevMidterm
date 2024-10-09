class Mission{
  final String name;
  final String id;
  final String description;

  Mission({required this.name,required this.id,required this.description});

  factory Mission.fromJson(Map<String,dynamic> json){
    return Mission(
      name:json["mission_name"], 
      id:json["mission_id"], 
      description:json["description"]
      );
  }

}