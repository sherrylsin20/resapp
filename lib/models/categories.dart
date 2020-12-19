class Categories {
  final String category;
  final String url;
  final String key;

  Categories({
    this.category,
    this.url,
    this.key,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      category: json['category'],
      url: json['url'],
      key: json['key'],
    );
  }
}
