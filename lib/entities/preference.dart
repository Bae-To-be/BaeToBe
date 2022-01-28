import 'dart:ui';

class Preference {
  String name;
  int id;

  Preference({required this.name, required this.id});

  factory Preference.fromJson(Map<String, dynamic> json) {
    return Preference(name: json['name'], id: json['id']);
  }

  @override
  bool operator ==(other) {
    return other is Preference && (other.id == id);
  }

  @override
  int get hashCode => hashValues(id.hashCode, name.hashCode);

  @override
  String toString() {
    return {'name': name, 'id': id}.toString();
  }
}
