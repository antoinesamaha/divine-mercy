import 'package:divine_mercy/chapelet/chapelet_prayer.dart';
import 'package:divine_mercy/novena_page.dart';
import 'package:divine_mercy/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

import 'messages.dart';
import 'novena/novena_days_prayer.dart';

class ChapeletPage extends StatefulWidget {
  int randomIndex = 0;

  ChapeletPage({Key? key}) : super(key: key) {}

  @override
  _ChapeletPageState createState() => _ChapeletPageState();
}

class _ChapeletPageState extends State<ChapeletPage> {
  String _chapeletContent(int fontSize) {
    String content = "";
    for (int i = 1; i < 10; i++) {
      content += NovenaPage.htmlText(fontSize + 3, true, Chapelet.getTitle(i));
      content += NovenaPage.htmlText(fontSize, false, Chapelet.getText(i));
    }
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserState>(
        builder: (context, userState, child) => Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.redAccent,
              iconTheme: IconThemeData(color: Colors.white),
              title: Text("Divine Mercy Chapelet",
                  style: TextStyle(color: Colors.white)),
            ),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 30.0),
              child: Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                    Flexible(
                        child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          Image(
                              image:
                                  AssetImage('assets/images/chapletbeads.jpg')),
                          SelectionArea(
                              child: Html(
                                  data: _chapeletContent(userState.fontSize)))
                        ],
                      ),
                    ))
                  ])),
            )));
    //);
  }
}
