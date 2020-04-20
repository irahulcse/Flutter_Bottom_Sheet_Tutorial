import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.purple,
        backgroundColor: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  VoidCallback _showBottomSheetCallBack;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _showBottomSheetCallBack = _showBottomSheet;
  }

  void _showBottomSheet() {
    setState(() {
      _showBottomSheetCallBack = null;
    });

    _scaffoldKey.currentState
        .showBottomSheet((context) {
          return new Container(
            height: 200,
            color: Colors.greenAccent,
            child: new Center(
              child: new Text(
                'Hi Bottom Sheet',
              ),
            ),
          );
        })
        .closed
        .whenComplete(() {
          if (mounted) {
            setState(() {
              _showBottomSheetCallBack = _showBottomSheet;
            });
          }
        });
  }

  void _showModalSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            height: 800,
            color: Colors.greenAccent,
            child: new Center(
              child: new Text(
                'Hi Modal Sheet',
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Column(
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.only(
                top: 2.0,
              ),
            ),
            new Center(
              child: Text("Flutter Learning Path Course"),
            ),
            new Padding(
              padding: EdgeInsets.only(
                top: 12.0,
              ),
            ),
            new Center(
              child: Text("Difference Between Bottomsheet and Modal Sheet "),
            ),
          ],
        ),
      ),
      body: new Padding(
        padding: EdgeInsets.all(20.0),
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new RaisedButton(
                color: Colors.red,
                highlightColor: Colors.pink,
                onPressed: _showBottomSheetCallBack,
                child: new Text("Persistent"),
              ),
              new Padding(
                padding: const EdgeInsets.only(
                  top: 10.0,
                ),
              ),
              new RaisedButton(
                color: Colors.deepPurpleAccent,
                child: new Text("Modals"),
                onPressed: _showModalSheet,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
