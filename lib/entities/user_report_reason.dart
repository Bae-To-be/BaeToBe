import 'dart:ui';

class UserReportReason {
  String name;
  int id;

  UserReportReason({required this.name, required this.id});

  factory UserReportReason.fromJson(Map<String, dynamic> json) {
    return UserReportReason(name: json['name'], id: json['id']);
  }

  @override
  bool operator ==(other) {
    return other is UserReportReason && (other.id == id);
  }

  @override
  int get hashCode => hashValues(id.hashCode, name.hashCode);

  @override
  String toString() {
    return {'id': id, 'name': name}.toString();
  }
}
