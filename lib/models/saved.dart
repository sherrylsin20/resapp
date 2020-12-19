class Saved {
  String title;
  String thumb;
  String key;
  String times;
  String portion;
  String dificulty;

  Saved({
    this.title,
    this.thumb,
    this.key,
    this.times,
    this.portion,
    this.dificulty,
  });

  factory Saved.fromMap(Map<String, dynamic> map) {
    return Saved(
      title: map['title'],
      thumb: map['thumb'],
      key: map['key'],
      times: map['times'],
      portion: map['portion'],
      dificulty: map['dificulty'],
    );
  }
  // factory Saved.toMap(Map<String, dynamic> map) {
  //   return (
  //     'title' : title,
  //     'thumb': thumb,
  //     'key': key,
  //     'times': times,
  //     'portion': portion,
  //     'dificulty': dificulty,
  //   );
  // }
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'thumb': thumb,
      'key': key,
      'times': times,
      'portion': portion,
      'dificulty': dificulty,
    };
  }
}
