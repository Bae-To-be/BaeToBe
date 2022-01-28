import 'dart:ui';

class Gender {
  String name;
  int id;

  Gender({required this.name, required this.id});

  factory Gender.fromJson(Map<String, dynamic> json) {
    return Gender(name: json['name'], id: json['id']);
  }

  @override
  bool operator ==(other) {
    return other is Gender && (other.id == id);
  }

  @override
  int get hashCode => hashValues(id.hashCode, name.hashCode);
}
