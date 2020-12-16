class Details {
  final String title;
  final String thumb;
  final String servings;
  final String times;
  final String dificulty;
  final Object author;
  final String desc;
  final Object needItem;
  final Object ingredient;
  final Object step;

  Details({
    this.title,
    this.thumb,
    this.servings,
    this.times,
    this.author,
    this.dificulty,
    this.desc,
    this.needItem,
    this.ingredient,
    this.step,
  });

  factory Details.fromMap(Map<String, dynamic> map) {
    return Details(
      title: map['title'],
      thumb: map['thumb'],
      servings: map['servings'],
      times: map['times'],
      author: map['author'],
      dificulty: map['dificulty'],
      desc: map['desc'],
      needItem: map['needItem'],
      ingredient: map['ingredient'],
      step: map['step'],
    );
  }
}
