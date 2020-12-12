import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() => runApp(ResApp());

class ResApp extends StatefulWidget {
  @override
  _ResAppState createState() => _ResAppState();
}

class _ResAppState extends State<ResApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white12,
        title: Image.asset('assets/images/resapp.png', width: 100),
        centerTitle: true,
        elevation: 0,
      ),
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white12,
          color: Colors.deepOrange,
          items: <Widget>[
            Icon(
              Icons.list,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.home,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.bookmark,
              size: 30,
              color: Colors.white,
            )
          ],
          onTap: (index) {
            //Handle button tap
          }),
    ));
  }
}
