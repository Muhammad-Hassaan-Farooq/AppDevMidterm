class Mission{
  final String name;
  final String id;
  final String description;
  final List<String> payloads;

  Mission({required this.name,required this.id,required this.description, required this.payloads});

  factory Mission.fromJson(Map<String,dynamic> json){
    return Mission(
      name:json["mission_name"], 
      id:json["mission_id"], 
      description:json["description"],
      payloads: List<String>.from(json["payload_ids"]),
      );
  }

}