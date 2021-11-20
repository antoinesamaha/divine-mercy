import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserState extends ChangeNotifier {
  static const int MAX = 1828;
  static const String KEY_MESSAGE_INDEX = 'message-index';
  static const String KEY_MESSAGE_LANGUAGE = 'message-language';

  static const String LANGUAGE_ENGLISH = 'en';
  static const String LANGUAGE_POLISH = 'pl';

  int fontSize = 22;
  int messageIndex = 1;
  Locale _locale = Locale(LANGUAGE_ENGLISH);

  UserState() {
    load();
  }

  Locale get locale {
    return _locale;
  }

  set locale(Locale l) {
    _locale = l;
    notifyListeners();
  }

  load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey(KEY_MESSAGE_INDEX)) {
      messageIndex = prefs.getInt(KEY_MESSAGE_INDEX) ?? 1;
    } else {
      messageIndex = 1;
      await prefs.setInt(KEY_MESSAGE_INDEX, messageIndex);
    }

    if (prefs.containsKey(KEY_MESSAGE_LANGUAGE)) {
      String language =
          prefs.getString(KEY_MESSAGE_LANGUAGE) ?? LANGUAGE_ENGLISH;
      _locale = Locale(language);
    } else {
      _locale = Locale(LANGUAGE_ENGLISH);
      await prefs.setString(KEY_MESSAGE_LANGUAGE, LANGUAGE_ENGLISH);
    }

    notifyListeners();
  }

  save() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(KEY_MESSAGE_INDEX, messageIndex);
    await prefs.setString(KEY_MESSAGE_LANGUAGE, _locale.languageCode);
  }

  nextPage() {
    messageIndex++;
    if (messageIndex > MAX) messageIndex = 1;
    notifyListeners();
    save();
  }

  previousPage() {
    messageIndex--;
    if (messageIndex <= 0) messageIndex = MAX;
    notifyListeners();
    save();
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    double textWidth = MediaQuery.of(context).size.width * 0.8;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Row(
                        children: <Widget>[
                          ListTile(
                            title: Icon(Icons.flag),
                            leading: Radio<Locale>(
                              value: Locale("en"),
                              groupValue:
                                  Provider.of<UserState>(context, listen: false)
                                      .locale,
                              onChanged: (Locale? value) {
                                Provider.of<UserState>(context, listen: false)
                                    .locale = Locale("en");
                              },
                            ),
                          ),
                          ListTile(
                            title: Icon(Icons.flag),
                            leading: Radio<Locale>(
                              value: Locale("pl"),
                              groupValue:
                                  Provider.of<UserState>(context, listen: false)
                                      .locale,
                              onChanged: (Locale? value) {
                                Provider.of<UserState>(context, listen: false)
                                    .locale = Locale("pl");
                              },
                            ),
                          ),
                        ],
                      )))
            ],
          ))),
    );
    //);
  }
}
