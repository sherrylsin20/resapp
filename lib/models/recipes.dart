class Recipes {
  final String title;
  final String thumb;
  final String key;
  final String times;
  final String portion;
  final String dificulty;

  Recipes({
    this.title,
    this.thumb,
    this.key,
    this.times,
    this.portion,
    this.dificulty,
  });

  factory Recipes.fromJson(Map<String, dynamic> json) {
    return Recipes(
      title: json['title'],
      thumb: json['thumb'],
      key: json['key'],
      times: json['times'],
      portion: json['portion'],
      dificulty: json['dificulty'],
    );
  }
}
