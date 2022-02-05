class Readers {
  static int parseInt(Map map, String key) => int.parse(map[key]);
  static int readId(Map map, String key) => map['id'];
}
