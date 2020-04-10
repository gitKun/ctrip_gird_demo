import 'package:ctrip_gird_demo/grid_widget.dart';
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
        body: Container(
          padding: EdgeInsets.only(top: 146),
          margin: EdgeInsets.only(left: 16, right: 16),
          child: GridWidget(),
        ),
      ),
    );
  }
}
