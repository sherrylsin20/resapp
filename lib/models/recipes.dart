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

  factory Recipes.fromMap(Map<String, dynamic> map) {
    return Recipes(
      title: map['title'],
      thumb: map['thumb'],
      key: map['key'],
      times: map['times'],
      portion: map['portion'],
      dificulty: map['dificulty'],
    );
  }
}
