import 'package:flutter/material.dart';

void main() => runApp(new SampleApp());

class SampleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sample App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: new SampleAppPage(),
      home: new MyFadeTest(),
    );
  }
}

class MyFadeTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Fade Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyFadeTestApp(title: 'Fade Demo'),
    );
  }
}

class MyFadeTestApp extends StatefulWidget {
  final title;

  MyFadeTestApp({Key key, this.title}) : super(key: key);

  @override
  _MyFadeTestAppState createState() => new _MyFadeTestAppState();
}

class _MyFadeTestAppState extends State<MyFadeTestApp>
    with TickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation curvedAnimation;

  @override
  void initState() {
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    curvedAnimation =
        new CurvedAnimation(parent: controller, curve: Curves.bounceIn);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
          child: new Container(
        child: new FadeTransition(
          opacity: curvedAnimation,
          child: new FlutterLogo(
            size: 100.0,
          ),
        ),
      )),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          controller.forward();
        },
        child: new Icon(Icons.brush),
        tooltip: 'Fade',
      ),
    );
  }
}

/*
* Toggle */

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => new _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  // Default value for toggle
  bool toggle = true;

  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  _getToggleChild() {
    if (toggle) {
      return new Text('Toggle One');
    } else {
      return new MaterialButton(
          onPressed: () {}, child: new Text('Toggle Two'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sample App"),
      ),
      body: new Center(
        child: _getToggleChild(),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _toggle,
        tooltip: 'Update Text',
        child: new Icon(Icons.update),
      ),
    );
  }
}
