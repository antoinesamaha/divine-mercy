import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserState extends ChangeNotifier {
  static const int MAX = 1828;

  int messageIndex = 1;

  UserState() {
    load();
  }

  load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    messageIndex = prefs.getInt('message-index') ?? 1;
    await prefs.setInt('message-index', messageIndex);
    notifyListeners();
  }

  save() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('message-index', messageIndex);
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
