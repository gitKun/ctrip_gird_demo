import 'package:ctrip_gird_demo/grid_widget.dart';
import 'package:ctrip_gird_demo/sub_nav/sub_nav_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(CtripGridApp());

class CtripGridApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "携程grid布局",
            style: TextStyle(fontSize: 18),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(16, 50, 16, 0),
              child: GridWidget(),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16, 10, 16, 0),
              child: SubNavWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
