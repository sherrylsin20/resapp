import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resapp/models/categories.dart';
import 'package:resapp/screens/categorylist.dart';
import 'package:resapp/services/webservice.dart';

class CategoriesPage extends StatefulWidget {
  @override
  final List<Categories> category;
  CategoriesPage({Key key, @required this.category}) : super(key: key);

  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<CategoriesPage> {
  Widget listViewWidget(List<Categories> category) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Categories',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: category.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryList(),
                        settings: RouteSettings(
                          arguments: category[index],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 150.0,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            color: Colors.deepOrange.shade400,
                            width: 20,
                          ),
                          Stack(
                            children: <Widget>[
                              Opacity(
                                opacity: 0.9,
                                child: Image(
                                  width: 363,
                                  image: AssetImage(
                                      'assets/images/category$index.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(10.0, 100.0, 0.0, 0.0),
                                child: Text(
                                  '${category[index].category}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 28.0,
                                    color: Colors.white,
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(3.0, 3.0),
                                        blurRadius: 3.0,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
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
      body: FutureBuilder(
        future: APIService().getCategories(),
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
