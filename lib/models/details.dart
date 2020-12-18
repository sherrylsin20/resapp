// class Details {
//   final String title;
//   final String thumb;
//   final String servings;
//   final String times;
//   final String dificulty;
//   final List<Author> author;
//   final String desc;
//   // final List<NeedItem> needItem;
//   final List<String> ingredient;
//   final List<String> step;

//   Details({
//     this.title,
//     this.thumb,
//     this.servings,
//     this.times,
//     this.author,
//     this.dificulty,
//     this.desc,
//     // this.needItem,
//     this.ingredient,
//     this.step,
//   });

//   factory Details.fromJson(Map<String, dynamic> json) {
//     // var list = json['needItem'] as List;
//     // List<NeedItem> need = list.map((i) => NeedItem.fromJson(i)).toList();

//     // var ingredientsFromJson = json['ingredients'];
//     // List<String> ingredientList = ingredientsFromJson.cast<String>();

//     // var stepsFromJson = json['step'];
//     // List<String> stepsList = stepsFromJson.cast<String>();

//     var ingredientsFromJson = json['ingredients'];
//     List<String> ingredientsList = new List<String>.from(ingredientsFromJson);
//     var stepsFromJson = json['step'];
//     List<String> stepsList = new List<String>.from(stepsFromJson);

//     return Details(
//       title: json['title'],
//       thumb: json['thumb'],
//       servings: json['servings'],
//       times: json['times'],
//       author: json['author'] == null
//           ? <Author>[]
//           : (json['author'] as List<dynamic>)
//               .map((dynamic item) => Author.fromJson(item))
//               .toList(),
//       dificulty: json['dificulty'],
//       desc: json['desc'],
//       // needItem: need,
//       ingredient: ingredientsList,
//       // ingredient: List<String>.from(json['ingredient']),
//       step: stepsList,
//       //step: List<String>.from(json['step']),
//     );
//   }
// }

// class Author {
//   final String user;
//   final String datePublished;

//   Author({this.user, this.datePublished});

//   factory Author.fromJson(Map<String, dynamic> json) {
//     return Author(user: json['user'], datePublished: json['datePublished']);
//   }
// }

// class NeedItem {
//   final String item_name;
//   final String thumb_item;

//   NeedItem({this.item_name, this.thumb_item});

//   factory NeedItem.fromJson(Map<String, dynamic> json) {
//     return NeedItem(
//         item_name: json['item_name'], thumb_item: json['thumb_item']);
//   }
// }

class Details {
  String title;
  String thumb;
  String servings;
  String times;
  String dificulty;
  // Author author;
  String desc;
  // List<NeedItem> needItem;
  List<String> ingredient;
  List<String> step;

  Details(
      {this.title,
      this.thumb,
      this.servings,
      this.times,
      this.dificulty,
      // this.author,
      this.desc,
      // this.needItem,
      this.ingredient,
      this.step});

  Details.fromJson(Map<String, dynamic> json) {
    title = json['results']['title'];
    thumb = json['results']['thumb'];
    servings = json['results']['servings'];
    times = json['results']['times'];
    dificulty = json['results']['dificulty'];
    // author =
    //     json['author'] != null ? new Author.fromJson(json['author']) : null;
    desc = json['results']['desc'];
    // if (json['needItem'] != null) {
    //   needItem = new List<NeedItem>();
    //   json['needItem'].forEach((v) {
    //     needItem.add(new NeedItem.fromJson(v));
    //   });
    // }
    ingredient = json['results']['ingredient'].cast<String>();
    step = json['results']['step'].cast<String>();
  }
}

class Author {
  String user;
  String datePublished;

  Author({this.user, this.datePublished});

  Author.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    datePublished = json['datePublished'];
  }
}

class NeedItem {
  String itemName;
  String thumbItem;

  NeedItem({this.itemName, this.thumbItem});

  NeedItem.fromJson(Map<String, dynamic> json) {
    itemName = json['item_name'];
    thumbItem = json['thumb_item'];
  }
}
