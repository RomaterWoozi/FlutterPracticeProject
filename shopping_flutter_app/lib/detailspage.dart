import 'package:flutter/material.dart';

class TitleRightWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: [
          new Expanded(
              child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new Text(
                  'Oeschinen Lake Campground',
                  style: new TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              new Text(
                'Kandersteg,Switzerland',
                style: new TextStyle(
                  color: Colors.grey[500],
                ),
              )
            ],
          )),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text('41'),
        ],
      ),
    );
    return null;
  }
}


class BottomWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new MaterialApp(title: 'Flutter Demo',theme: new ThemeData(primaryColor: Colors.blue),);
  }
}