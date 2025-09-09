class StateModel {
  final String name;
  final String stateCode;

  StateModel({
    required this.name,
    required this.stateCode,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) {
    return StateModel(
      name: json['name'] ?? "Unknown",
      stateCode: json['state_code'] ?? 'N/A',
    );
  }

  @override
  String toString() {
    return name;
  }
}