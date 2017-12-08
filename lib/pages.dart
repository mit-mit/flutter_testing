import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text('Page 1'),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text('Page 3'),
    );
  }
}

class Page2 extends StatefulWidget {
  @override
  Page2State createState() => new Page2State();
}

class Page2State extends State<Page2> {
  int counter = 0;

  onTap() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new RaisedButton(
        child: new Text('Clicked $counter times'),
        onPressed: onTap,
      ),
    );
  }
}
