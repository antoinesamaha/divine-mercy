import 'package:divine_mercy/message_page.dart';
import 'package:divine_mercy/user_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserState()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Divine Mercy',
      locale: Provider.of<UserState>(context, listen: false).locale,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), // English, no country code
        Locale('pl', ''), // Polish, no country code
      ],
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

  Card diaryCard(bool random) {
    return Card(
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
          if (random)
            {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MessagePage(
                          random: true,
                        )),
              )
            }
          else
            {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MessagePage()),
              )
            }
        },
        trailing:
            /*Icon(
                      Icons.favorite_outline,
                      color: Colors.amber,
                    ) */
            Consumer<UserState>(
                builder: (context, userState, child) => Text(
                    random
                        ? "Random message"
                        : "Next message #" + userState.messageIndex.toString(),
                    style: TextStyle(color: Colors.white))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return

        // MultiProvider(
        //       providers: [
        //     ChangeNotifierProvider.value(
        //       value: Counter(),
        //     ),
        //   ],

        Container(
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
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              /*
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              */
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                title: const Text('Settings'),
                tileColor: Colors.redAccent,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                  );
                },
              ),
            ],
          ),
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
              diaryCard(false),
              diaryCard(true),
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
      ),
    );
  }
}
