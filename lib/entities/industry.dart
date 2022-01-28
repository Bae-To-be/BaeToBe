import 'dart:ui';

class Industry {
  String name;
  int id;

  Industry({required this.name, required this.id});

  factory Industry.fromJson(Map<String, dynamic> json) {
    return Industry(name: json['name'], id: json['id']);
  }

  @override
  bool operator ==(other) {
    return other is Industry && (other.id == id);
  }

  @override
  int get hashCode => hashValues(id.hashCode, name.hashCode);
}
