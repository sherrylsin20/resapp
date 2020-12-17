import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resapp/models/details.dart';
import 'package:resapp/models/recipes.dart';
import 'package:resapp/services/webservice.dart';

class DetailPage extends StatelessWidget {
  Widget detailData(Details details) {
    return Container(
      child: Text(details.title),
      // child: new Image.network(
      //   details.thumb,
      //   fit: BoxFit.cover,
      //   height: 300.0,
      // ),
    );
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
