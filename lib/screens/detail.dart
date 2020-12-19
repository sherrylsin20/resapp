import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resapp/models/details.dart';
import 'package:resapp/models/recipes.dart';
import 'package:resapp/services/webservice.dart';

class DetailPage extends StatefulWidget {
  @override
  final List<Recipes> recipes;
  DetailPage({Key key, @required this.recipes}) : super(key: key);

  _DetailState createState() => _DetailState();
}

class _DetailState extends State<DetailPage> {
  Future<Details> details;
  Details detail;
  Color _iconColor = Colors.grey;

  Widget detailData(Details details) {
    List<String> ingredients = details.ingredient;
    var ingredientsCount = details.ingredient.length;

    List<String> steps = details.step;
    var stepsCount = details.step.length;

    return Column(children: <Widget>[
      Container(
        child: details.thumb != null
            ? Image.network(
                details.thumb,
                fit: BoxFit.cover,
                height: 200.0,
              )
            : Image.asset(
                'assets/images/resapp.png',
                height: 200.0,
                fit: BoxFit.scaleDown,
              ),
        constraints: new BoxConstraints.expand(height: 200.0),
      ),
      Container(
        height: 450,
        width: 400,
        child: ListView(
          padding: new EdgeInsets.all(18.0),
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "${details.title}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Container(height: 10.0),
                Row(children: <Widget>[
                  Icon(
                    Icons.timer,
                    size: 28.0,
                  ),
                  Container(width: 8.0),
                  Text('${details.times}',
                      style: TextStyle(
                        fontSize: 18.0,
                      )),
                  Container(width: 10.0),
                  Text(
                    "—",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 28.0,
                    ),
                  ),
                  Container(width: 10.0),
                  Icon(
                    Icons.fastfood_outlined,
                    size: 28.0,
                  ),
                  Container(width: 6.0),
                  Text('${details.servings}',
                      style: TextStyle(
                        fontSize: 18.0,
                      )),
                  Container(width: 80.0),
                  IconButton(
                    icon: Icon(Icons.favorite),
                    color: _iconColor,
                    iconSize: 45.0,
                    onPressed: () {
                      setState(() {
                        if (_iconColor == Colors.grey) {
                          _iconColor = Colors.red;
                        } else {
                          _iconColor = Colors.grey;
                        }
                      });
                    },
                  )
                ]),
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, 00.0, 0.0, 9.0),
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'Ingredients',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
                Container(
                  alignment: AlignmentDirectional.centerStart,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(ingredientsCount, (index) {
                      return Text(ingredients[index],
                          style: TextStyle(fontSize: 15.0));
                    }),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 9.0),
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'Langkah-langkah',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
                Container(
                  alignment: AlignmentDirectional.centerStart,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(stepsCount, (index) {
                      return Text(steps[index] + '\n',
                          style: TextStyle(fontSize: 15.0));
                    }),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final Recipes recipe = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        body: FutureBuilder(
            future: APIService().getDetail(recipe.key),
            builder: (context, snapshot) {
              return snapshot.data != null
                  ? detailData(snapshot.data)
                  : Center(child: CircularProgressIndicator());
            }));
  }
}
