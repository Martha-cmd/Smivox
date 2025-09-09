class CountryModel {
  final String name;
  final String dialCode;
  final String flag;
  final String code;

  CountryModel({
    required this.name,
    required this.dialCode,
    required this.flag,
    required this.code,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name'],
      dialCode: json['dial_code'],
      flag: json['flag'],
      code: json['code'],
    );
  }
  @override
  String toString() {
    return '$flag $name';
  }
}