import 'package:divine_mercy/message_page.dart';
import 'package:divine_mercy/messages.dart';
import 'package:divine_mercy/settings/settings_screen.dart';
import 'package:divine_mercy/user_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'l10n/app_localizations.dart';

import 'cards/diary_card.dart';
import 'chapelet_page.dart';
import 'novena_page.dart';
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
    Locale locale = Provider.of<UserState>(context, listen: true).locale;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Divine Mercy',
      locale: locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
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
  final TextEditingController _entryController = TextEditingController();

  @override
  void dispose() {
    _entryController.dispose();
    super.dispose();
  }

  void _navigateToEntry(BuildContext context) {
    int? entryNumber = int.tryParse(_entryController.text);
    if (entryNumber != null &&
        entryNumber >= 1 &&
        entryNumber <= Messages().getMax(context)) {
      Provider.of<UserState>(context, listen: false).randomMode = true;
      Provider.of<UserState>(context, listen: false).randomIndex = entryNumber;
      Navigator.push(
        context,
        MaterialPageRoute(
            //builder: (context) => MessagePage(messageNumber: entryNumber)),
            builder: (context) => MessagePage()),
      );
      _entryController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a number between 1 and ' +
              Messages().getMax(context).toString()),
          backgroundColor: Colors.red,
        ),
      );
    }
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
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                print("Settings pushed");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()));
                /*SettingsPage()*/
              },
            )
          ],
        ),
        /*
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                title: const Text('Settings'),
                tileColor: Colors.redAccent,
                onTap: () {
                  print("Settings pushed");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                  );
                },
              ),
            ],
          ),
        ),
        */
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              /*
              AnimatedTextKit(animatedTexts: [
                ScaleAnimatedText("Jesus"),
                ScaleAnimatedText("I Trust"),
                ScaleAnimatedText("In You"),
                ScaleAnimatedText("Jesus I Trust In You")
              ]),*/
              DiaryCard(random: false),
              DiaryCard(random: true),
              Consumer<UserState>(
                builder: (context, userState, child) => Card(
                  elevation: 0,
                  color: Colors.transparent.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      side: BorderSide(width: 2, color: Colors.redAccent)),
                  child: ListTile(
                    title: Text(
                        "Novena day " + userState.currentNovenaDay().toString(),
                        style: TextStyle(color: Colors.white)),
                    // subtitle: Text("Divine Mercy Novena",
                    //     style: TextStyle(color: Colors.white.withOpacity(0.6))),
                    // trailing: Text(
                    //     "Day #" + userState.currentNovenaDay().toString(),
                    //     style: TextStyle(color: Colors.white)),
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NovenaPage()),
                      )
                    },
                    //trailing: Icon(Icons.favorite_outline),
                  ),
                ),
              ),
              Card(
                elevation: 0,
                color: Colors.transparent.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    side: BorderSide(width: 2, color: Colors.redAccent)),
                child: ListTile(
                  title: Text("Chaplet", style: TextStyle(color: Colors.white)),
                  // subtitle: Text("Divine Mercy Chapelet",
                  //     style: TextStyle(color: Colors.white.withOpacity(0.6))),
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChapeletPage()),
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
                  title: Text("Go to diary message #",
                      style: TextStyle(color: Colors.white)),
                  subtitle: TextField(
                    controller: _entryController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Enter number (1-" +
                          Messages().getMax(context).toString() +
                          ")",
                      hintStyle:
                          TextStyle(color: Colors.white.withOpacity(0.6)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white.withOpacity(0.5)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.redAccent),
                      ),
                    ),
                    onSubmitted: (_) => _navigateToEntry(context),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.arrow_forward, color: Colors.white),
                    onPressed: () => _navigateToEntry(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
