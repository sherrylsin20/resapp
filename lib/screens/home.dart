import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resapp/models/recipes.dart';
import 'package:resapp/screens/searchlist.dart';
import 'package:resapp/services/webservice.dart';

import 'detail.dart';

class HomePage extends StatefulWidget {
  @override
  final List<Recipes> recipes;
  final String value;

  HomePage({Key key, @required this.recipes, this.value}) : super(key: key);

  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  final searchController = TextEditingController();

  void dispose() {
    searchController.dispose();
  }

  Widget searchView() {
    return Row(
      children: <Widget>[
        Container(
          width: 298.0,
          margin: EdgeInsets.fromLTRB(8.0, 8.0, 1.0, 8.0),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              labelText: "Search",
              labelStyle: TextStyle(
                color: Colors.deepOrange,
              ),
              hintText: "Search",
              filled: true,
              fillColor: Colors.grey.shade200,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade200, width: 5.0),
                borderRadius: BorderRadius.all(
                  Radius.circular(25.0),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade200, width: 5.0),
                borderRadius: BorderRadius.all(
                  Radius.circular(25.0),
                ),
              ),
            ),
          ),
        ),
        RawMaterialButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) =>
                    new SearchList(value: searchController.text),
              ),
            );
          },
          elevation: 2.0,
          fillColor: Colors.deepOrange,
          child: Icon(
            Icons.search,
            size: 20.0,
            color: Colors.white,
          ),
          padding: EdgeInsets.all(15.0),
          shape: CircleBorder(),
        )
      ],
    );
  }

  Widget listViewWidget(List<Recipes> recipes) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            searchView(),
            Container(
              margin: EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'New Recipes',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
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
                    height: 170.0,
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
                                  overflow: TextOverflow.clip,
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
                                    Text('${recipes[index].dificulty}',
                                        style: TextStyle(fontSize: 11.0)),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.timer,
                                      size: 16.0,
                                    ),
                                    Container(width: 8.0),
                                    Text('${recipes[index].times}',
                                        style: TextStyle(fontSize: 11.0)),
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
                          margin: EdgeInsets.fromLTRB(10.0, 27, 0, 11.5),
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
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: FutureBuilder(
        future: APIService().getRecipes(),
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
