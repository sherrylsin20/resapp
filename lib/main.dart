import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:resapp/screens/categories.dart';
import 'package:resapp/screens/home.dart';
import 'package:resapp/screens/saved.dart';
import 'screens/splash.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ResApp',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class ResApp extends StatefulWidget {
  @override
  _ResAppState createState() => _ResAppState();
}

class _ResAppState extends State<ResApp> {
  int _page = 1;

  final PageController controller =
      PageController(initialPage: 1, keepPage: true);

  GlobalKey _bottomNavigationKey = GlobalKey();

  Widget buildPageView() {
    return PageView(
      controller: controller,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[CategoriesPage(), HomePage(), SavedPage()],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void pageChanged(int index) {
    setState(() {
      _page = index;
    });
  }

  void bottomTapped(int index) {
    setState(
      () {
        _page = index;
        controller.animateToPage(index,
            duration: Duration(milliseconds: 500), curve: Curves.linear);
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset('assets/images/resapp.png', width: 100),
        centerTitle: true,
        elevation: 0,
      ),
      body: buildPageView(),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        backgroundColor: Colors.white,
        color: Colors.deepOrange,
        index: _page,
        animationDuration: Duration(milliseconds: 500),
        items: <Widget>[
          Icon(
            Icons.list,
            size: 35,
            color: Colors.white,
          ),
          Icon(
            Icons.home,
            size: 35,
            color: Colors.white,
          ),
          Icon(
            Icons.bookmark,
            size: 35,
            color: Colors.white,
          )
        ],
        onTap: (index) {
          debugPrint(index.toString());
          setState(
            () {
              bottomTapped(index);
            },
          );
        },
      ),
    );
  }
}
