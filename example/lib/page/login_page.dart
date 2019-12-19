import 'package:flutter/material.dart';
import 'package:airoute/airoute.dart';
import 'dart:ui';

///
/// LaunchPage
class LaunchPage extends StatefulWidget with AirArgumentReceiver {
  dynamic _content = "";
  @override
  void receive(AirArgument argument) {
    _content = argument.argument['content'];
  }

  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

/// _LoginState
class _LoginState extends State<LaunchPage> {
  String _content = "";
  @override
  Widget build(BuildContext context) {
    Size size = window.physicalSize;
    double width = size.width / window.devicePixelRatio;
    double height = size.height / window.devicePixelRatio;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Text("Hello world ${widget._content}"),
          Container(
            width: width,
            height: height / 2,
            padding: EdgeInsets.only(
              left: 20,
              top: 20,
              right: 20,
              bottom: 20,
            ),
            child: Center(
              child: TextField(
                enabled: true,
                decoration: InputDecoration(
                  icon: Text("参数"),
                  prefixIcon: Icon(Icons.phone_android),
                ),
                onChanged: (String content) {
                  _content = content;
                },
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              Airoute.pushNamed(
                routeName: "/SecondPage",
                argument: "$_content \n 遇见你，我很开心😄😄😄",
              );
            },
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            child: Text("跳转下一页"),
          ),
        ],
      ),
    );
  }
}
