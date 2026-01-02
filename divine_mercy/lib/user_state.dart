import 'dart:math';

import 'package:divine_mercy/messages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:divine_mercy/l10n/app_localizations.dart';
import 'package:settings_ui/settings_ui.dart';

import 'messages_polish.dart';

class UserState extends ChangeNotifier {
  static const int MAX = 1828;
  static const String KEY_NOVENA_DAY = 'novena-day';
  static const String KEY_MESSAGE_INDEX = 'message-index';
  static const String KEY_MESSAGE_LANGUAGE = 'message-language';

  static const String LANGUAGE_ENGLISH = 'en';
  static const String LANGUAGE_POLISH = 'pl';

  int fontSize = 22;
  int _messageIndex = 1;
  int _novenaDay = 1;
  Locale _locale = Locale(LANGUAGE_ENGLISH);

  bool _randomMode = false;
  int _randomIndex = 0;

  UserState() {
    load();
  }

  Locale get locale {
    return _locale;
  }

  String localeLabel() {
    String lang = locale.languageCode;
    if (lang == UserState.LANGUAGE_POLISH) {
      return "Polish";
    } else {
      return "English";
    }
  }

  int get max {
    String lang = locale.languageCode;
    if (lang == UserState.LANGUAGE_POLISH) {
      return MessagesPolish().MAX;
    } else {
      return MessagesEnglish().MAX;
    }
  }

  bool get randomMode {
    return _randomMode;
  }

  set randomMode(bool mode) {
    _randomMode = mode;
    if (mode == false) {
      _randomIndex = 0;
    } else {
      var randomGenerator = new Random();
      _randomIndex = randomGenerator.nextInt(max);
    }
  }

  int get randomIndex {
    // if (_randomIndex == 0) {
    //   var randomGenerator = new Random();
    //   _randomIndex = randomGenerator.nextInt(max);
    // }

    return _randomIndex;
  }

  set randomIndex(int index) {
    _randomIndex = index;
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

    if (prefs.containsKey(KEY_NOVENA_DAY)) {
      _novenaDay = prefs.getInt(KEY_NOVENA_DAY) ?? 1;
    } else {
      _novenaDay = 1;
      await prefs.setInt(KEY_NOVENA_DAY, _novenaDay);
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
    await prefs.setInt(KEY_NOVENA_DAY, _novenaDay);
  }

  // --------------
  // Messages Pages
  // --------------

  int currentIndex() {
    return randomMode ? randomIndex : messageIndex;
  }

  int get messageIndex {
    return _messageIndex;
  }

  set messageIndex(int idx) {
    _messageIndex = idx;
    notifyListeners();
  }

  String currentMessage() {
    String lang = locale.languageCode;
    if (lang == UserState.LANGUAGE_POLISH) {
      return MessagesPolish().getMessage(currentIndex());
    } else {
      return MessagesEnglish().getMessage(currentIndex());
    }
  }

  nextPage() {
    if (randomMode) {
      randomIndex++;
      if (randomIndex > max) randomIndex = 1;
      notifyListeners();
    } else {
      messageIndex++;
      if (messageIndex > MAX) messageIndex = 1;
      notifyListeners();
      save();
    }
  }

  previousPage() {
    if (randomMode) {
      randomIndex--;
      if (randomIndex <= 0) randomIndex = MAX;
      notifyListeners();
    } else {
      messageIndex--;
      if (messageIndex <= 0) messageIndex = MAX;
      notifyListeners();
      save();
    }
  }

  // ----------
  // Novena Day
  // ----------

  int currentNovenaDay() {
    return _novenaDay;
  }

  nextNovenaDay() {
    _novenaDay++;
    if (_novenaDay > 9) _novenaDay = 1;
    notifyListeners();
    save();
  }

  previousNovenaDay() {
    _novenaDay--;
    if (_novenaDay <= 0) _novenaDay = 9;
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
    //double textWidth = MediaQuery.of(context).size.width * 0.8;

    return Consumer<UserState>(
        builder: (context, userState, child) => Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.redAccent,
                title: Text(AppLocalizations.of(context)!.settings),
              ),
              body: SettingsList(
                sections: [
                  SettingsSection(
                    title: Text('Common'),
                    tiles: <SettingsTile>[
                      SettingsTile.navigation(
                        leading: Icon(Icons.language),
                        title: Text('Language'),
                        value: Text(userState.locale.toString()),
                      ),
                      SettingsTile.switchTile(
                        onToggle: (value) {},
                        initialValue: true,
                        leading: Icon(Icons.format_paint),
                        title: Text('Enable custom theme'),
                      ),
                    ],
                  ),
                ],
              ),
              /*
      Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              ListTile(
                title: Icon(Icons.flag),
                leading: Radio<Locale>(
                  value: Locale("en"),
                  groupValue:
                      Provider.of<UserState>(context, listen: false).locale,
                  onChanged: (Locale? value) {
                    Provider.of<UserState>(context, listen: false).locale =
                        Locale("en");
                  },
                ),
              ),
              ListTile(
                title: Icon(Icons.flag),
                leading: Radio<Locale>(
                  value: Locale("pl"),
                  groupValue:
                      Provider.of<UserState>(context, listen: false).locale,
                  onChanged: (Locale? value) {
                    Provider.of<UserState>(context, listen: false).locale =
                        Locale("pl");
                  },
                ),
              ),
            ],
          )
        ],
      ),
      */
            ));
    //);
  }
}
