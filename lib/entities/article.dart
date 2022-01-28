class Article {
  int id;
  String title;

  Article(this.id, this.title);

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(json['id'] as int, json['title']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
    };
  }
}
