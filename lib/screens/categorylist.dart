import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resapp/models/categories.dart';
import 'package:resapp/models/recipes.dart';
import 'package:resapp/services/webservice.dart';

import 'detail.dart';

class CategoryList extends StatefulWidget {
  @override
  final Categories categories;
  CategoryList({Key key, @required this.categories}) : super(key: key);

  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  Color _iconButtonColor = Colors.grey;
  String header;

  Widget listViewWidget(List<Recipes> recipes) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(8.0, 30.0, 0.0, 0.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Category',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.w900),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '$header',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 9,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(),
                        settings: RouteSettings(arguments: recipes[index]),
                      ),
                    );
                  },
                  child: Container(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(85.0, 10.0, 16.0, 16.0),
                            constraints: BoxConstraints.expand(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(height: 4.0),
                                Text(
                                  '${recipes[index].title}',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                Container(height: 20.0),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.warning_amber_outlined,
                                      size: 16.0,
                                    ),
                                    Container(width: 8.0),
                                    Text(
                                      '${recipes[index].dificulty}',
                                      style: TextStyle(fontSize: 11.0),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.timer,
                                      size: 16.0,
                                    ),
                                    Container(width: 8.0),
                                    Text(
                                      '${recipes[index].times}',
                                      style: TextStyle(fontSize: 11.0),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.food_bank_outlined,
                                      size: 16.0,
                                    ),
                                    Container(width: 6.0),
                                    Text(
                                      '${recipes[index].portion}',
                                      style: TextStyle(fontSize: 11.0),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          height: 154.0,
                          margin: EdgeInsets.fromLTRB(72.0, 16.0, 10.0, 0.0),
                          decoration: new BoxDecoration(
                            color: Colors.lightBlue.shade50,
                            shape: BoxShape.rectangle,
                            borderRadius: new BorderRadius.circular(8.0),
                            boxShadow: <BoxShadow>[
                              new BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10.0,
                                offset: new Offset(0.0, 10.0),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10.0, 23.0, 0, 11.5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6.0),
                            child: Image(
                              image: NetworkImage('${recipes[index].thumb}'),
                              height: 140.0,
                              width: 140.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    final Categories categories = ModalRoute.of(context).settings.arguments;
    header = categories.category;

    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: APIService().getRecipesCat(categories.key),
        builder: (context, snapshot) {
          return snapshot.data != null
              ? listViewWidget(snapshot.data)
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
