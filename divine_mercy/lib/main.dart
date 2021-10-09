import 'package:divine_mercy/message_page.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Divine Mercy',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'St Faustina Kovalska'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black87,
          image: DecorationImage(
              image: AssetImage("assets/images/divine_mercy_1934.jpg"),
              fit: BoxFit.scaleDown)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              /*
              AnimatedTextKit(animatedTexts: [
                ScaleAnimatedText("Jesus"),
                ScaleAnimatedText("I Trust"),
                ScaleAnimatedText("In You"),
                ScaleAnimatedText("Jesus I Trust In You")
              ]),*/
              Card(
                elevation: 0,
                color: Colors.transparent.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    side: BorderSide(width: 2, color: Colors.redAccent)),
                child: ListTile(
                  title: Text("St Faustina's Diary",
                      style: TextStyle(color: Colors.white.withOpacity(0.8))),
                  subtitle: Text("Divine Mercy In My Saul",
                      style: TextStyle(color: Colors.white.withOpacity(0.6))),
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MessagePage()),
                    )
                  },
                  //trailing: Icon(Icons.favorite_outline),
                ),
              ),
              Card(
                elevation: 0,
                color: Colors.transparent.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    side: BorderSide(width: 2, color: Colors.redAccent)),
                child: ListTile(
                  title: Text("Novena",
                      style: TextStyle(color: Colors.white.withOpacity(0.8))),
                  subtitle: Text("Divine Mercy Novena",
                      style: TextStyle(color: Colors.white.withOpacity(0.6))),
                  //trailing: Icon(Icons.favorite_outline),
                ),
              ),
              Card(
                elevation: 0,
                color: Colors.transparent.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    side: BorderSide(width: 2, color: Colors.redAccent)),
                child: ListTile(
                  title: Text("Chapelet",
                      style: TextStyle(color: Colors.white.withOpacity(0.8))),
                  subtitle: Text("Divine Mercy Chapelet",
                      style: TextStyle(color: Colors.white.withOpacity(0.6))),
                  //trailing: Icon(Icons.favorite_outline),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
