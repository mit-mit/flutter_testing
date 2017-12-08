import 'package:flutter/material.dart';

import 'pages.dart';

main() async {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'My App',
      theme: new ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.grey[800],
        accentColor: Colors.blue,
        primarySwatch: Colors.blue,
      ),
      home: new MyAppHome(title: 'My App'),
    );
  }
}

class MyAppHome extends StatefulWidget {
  // This widget is the home page of the app.
  MyAppHome({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyAppHomeState createState() => new _MyAppHomeState();
}

class _MyAppHomeState extends State<MyAppHome> {
  // The currently selected page in the bottom navigation.
  int _currentPage = 0;

  // The entries in the bottom navigation, and builders for their associated
  // pages.
  static final menuItems = <_MainMenuItem>[
    new _MainMenuItem(
      icon: Icons.local_bar,
      pageName: 'tab1',
      pageBuilder: new Builder(builder: (_) => new Page1()),
    ),
    new _MainMenuItem(
      icon: Icons.lock_outline,
      pageName: 'tab2',
      pageBuilder: new Builder(builder: (_) => new Page2()),
    ),
    new _MainMenuItem(
      icon: Icons.info,
      pageName: 'tab3',
      pageBuilder: new Builder(builder: (_) => new Page3()),
    ),
  ];

  // Build the home page of the app.
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: menuItems[_currentPage].pageBuilder,
      bottomNavigationBar: buildBottomNavigation(context),
    );
  }

  // Build the bottom navigation bar.
  Widget buildBottomNavigation(BuildContext context) {
    // The menu items are built by mapping from the list of general menu items
    // to a list of `BottomNavigationBarItem`'s.
    final List<BottomNavigationBarItem> bottomNavigationItems = menuItems
        .map((_MainMenuItem menuItem) => new BottomNavigationBarItem(
              icon: new Icon(menuItem.icon),
              title: new Text(menuItem.pageName),
            ))
        .toList();

    return new BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: bottomNavigationItems,
      currentIndex: _currentPage,
      onTap: (int index) {
        setState(() {
          _currentPage = index;
        });
      },
    );
  }
}

// An abstract top-level menu item.
class _MainMenuItem {
  // The name of the top-level page.
  final String pageName;

  // The icon for the top-level page.
  final IconData icon;

  // A builder for the content of the top-level page.
  final Builder pageBuilder;

  _MainMenuItem({this.pageBuilder, this.pageName, this.icon});
}