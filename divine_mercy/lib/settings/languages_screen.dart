import 'package:divine_mercy/l10n/l10n.dart';
import 'package:divine_mercy/user_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

class LanguagesScreen extends StatefulWidget {
  @override
  _LanguagesScreenState createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  int languageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Languages')),
      body: SettingsList(
        sections: [
          SettingsSection(tiles: [
            SettingsTile(
              title: Text("English"),
              //trailing: trailingWidget(0),
              onPressed: (BuildContext context) {
                changeLanguage('en');
              },
            ),
            SettingsTile(
              title: Text("Polish"),
              //trailing: trailingWidget(1),
              onPressed: (BuildContext context) {
                changeLanguage('pl');
              },
            ),
            // SettingsTile(
            //   title: Text("Chinese"),
            //   //trailing: trailingWidget(2),
            //   onPressed: (BuildContext context) {
            //     changeLanguage(2);
            //   },
            // ),
            // SettingsTile(
            //   title: Text("German"),
            //   //trailing: trailingWidget(3),
            //   onPressed: (BuildContext context) {
            //     changeLanguage(3);
            //   },
            //),
          ]),
        ],
      ),
    );
  }

  Widget trailingWidget(int index) {
    return (languageIndex == index)
        ? Icon(Icons.check, color: Colors.blue)
        : Icon(null);
  }

  void changeLanguage(String langText) {
    print('changing language ' + langText);
    Provider.of<UserState>(context, listen: false).locale = Locale(langText);
    // setState(() {
    //   languageIndex = index;
    // });
  }
}
