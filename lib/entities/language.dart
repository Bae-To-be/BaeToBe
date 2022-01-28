import 'dart:ui';

class Language {
  String name;
  int id;

  Language({required this.name, required this.id});

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(name: json['name'], id: json['id']);
  }

  @override
  bool operator ==(other) {
    return other is Language && (other.id == id);
  }

  @override
  int get hashCode => hashValues(id.hashCode, name.hashCode);

  @override
  String toString() {
    return {'id': id, 'name': name}.toString();
  }
}
