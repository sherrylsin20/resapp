import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resapp/models/recipes.dart';
import 'package:resapp/models/saved.dart';
import 'package:resapp/screens/searchlist.dart';
import 'package:resapp/services/webservice.dart';

import 'detail.dart';

class SavedPage extends StatefulWidget {
  @override
  final List<Saved> saved;
  final String value;

  SavedPage({Key key, @required this.saved, this.value}) : super(key: key);

  _SavedPageState createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  Future<List<Saved>> saved;

  Widget listViewWidget(List<Saved> saved) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Saved Recipes',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: saved.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(),
                        settings: RouteSettings(arguments: saved[index]),
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
                                  '${saved[index].title}',
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
                                    Text('${saved[index].dificulty}',
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
                                    Text('${saved[index].times}',
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
                                      '${saved[index].portion}',
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
                              image: NetworkImage('${saved[index].thumb}'),
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
        future: saved,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return listViewWidget(snapshot.data);
          }

          if (null == snapshot.data || snapshot.data.length == 0) {
            return Center(child: Text("No favorites yet!"));
          }

          return CircularProgressIndicator();
          // return snapshot.data != null
          //     ? listViewWidget(snapshot.data)
          //     : Center(
          //         child: CircularProgressIndicator(),
          //       );
        },
      ),
    );
  }
}
