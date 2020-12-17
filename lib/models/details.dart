class Details {
  final String title;
  final String thumb;
  final String servings;
  final String times;
  final String dificulty;
  final List<Author> author;
  final String desc;
  // final List<NeedItem> needItem;
  final List<String> ingredient;
  final List<String> step;

  Details({
    this.title,
    this.thumb,
    this.servings,
    this.times,
    this.author,
    this.dificulty,
    this.desc,
    // this.needItem,
    this.ingredient,
    this.step,
  });

  factory Details.fromJson(Map<String, dynamic> json) {
    // var list = json['needItem'] as List;
    // List<NeedItem> need = list.map((i) => NeedItem.fromJson(i)).toList();

    // var ingredientsFromJson = json['ingredients'];
    // List<String> ingredientList = ingredientsFromJson.cast<String>();

    // var stepsFromJson = json['step'];
    // List<String> stepsList = stepsFromJson.cast<String>();

    var ingredientsFromJson = json['ingredients'];
    List<String> ingredientsList = new List<String>.from(ingredientsFromJson);
    var stepsFromJson = json['step'];
    List<String> stepsList = new List<String>.from(stepsFromJson);

    return Details(
      title: json['title'],
      thumb: json['thumb'],
      servings: json['servings'],
      times: json['times'],
      author: json['author'] == null
          ? <Author>[]
          : (json['author'] as List<dynamic>)
              .map((dynamic item) => Author.fromJson(item))
              .toList(),
      dificulty: json['dificulty'],
      desc: json['desc'],
      // needItem: need,
      ingredient: ingredientsList,
      // ingredient: List<String>.from(json['ingredient']),
      step: stepsList,
      //step: List<String>.from(json['step']),
    );
  }
}

class Author {
  final String user;
  final String datePublished;

  Author({this.user, this.datePublished});

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(user: json['user'], datePublished: json['datePublished']);
  }
}

class NeedItem {
  final String item_name;
  final String thumb_item;

  NeedItem({this.item_name, this.thumb_item});

  factory NeedItem.fromJson(Map<String, dynamic> json) {
    return NeedItem(
        item_name: json['item_name'], thumb_item: json['thumb_item']);
  }
}
