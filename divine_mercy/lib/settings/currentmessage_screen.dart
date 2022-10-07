import 'package:divine_mercy/l10n/l10n.dart';
import 'package:divine_mercy/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

class CurrentMessageScreen extends StatefulWidget {
  @override
  _CurrentMessageScreenState createState() => _CurrentMessageScreenState();
}

class _CurrentMessageScreenState extends State<CurrentMessageScreen> {
  int languageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Current message')),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Enter Number'),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          )
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
    Navigator.of(context).pop();
  }
}
