import 'dart:ui';

class Religion {
  String name;
  int id;

  Religion({required this.name, required this.id});

  factory Religion.fromJson(Map<String, dynamic> json) {
    return Religion(name: json['name'], id: json['id']);
  }

  @override
  bool operator ==(other) {
    return other is Religion && (other.id == id);
  }

  @override
  int get hashCode => hashValues(id.hashCode, name.hashCode);

  @override
  String toString() {
    return {'id': id, 'name': name}.toString();
  }
}
