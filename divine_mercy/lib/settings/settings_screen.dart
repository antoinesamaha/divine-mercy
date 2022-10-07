import 'package:divine_mercy/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'currentmessage_screen.dart';
import 'languages_screen.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool lockInBackground = true;
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.settings)),
      body: buildSettingsList(),
    );
  }

  void changeLanguage(String langText) {
    print('changing language ' + langText);
    Provider.of<UserState>(context, listen: false).locale = Locale(langText);
    // Navigator.of(context).pop();
  }

  Widget buildSettingsList() {
    return Consumer<UserState>(
        builder: (context, userState, child) => Center(
                child: Column(
              children: [
                Row(children: [
                  SizedBox(width: 30),
                  Text(
                    'Language',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(width: 30),
                  Expanded(
                    child: DropdownButton(
                        isExpanded: true,
                        items: const [
                          DropdownMenuItem(child: Text("English"), value: "en"),
                          DropdownMenuItem(child: Text("Polish"), value: "pl")
                        ],
                        value: userState.locale.languageCode,
                        onChanged: (String? value) {
                          print(value.toString());
                          changeLanguage(value.toString());
                        }),
                  ),
                  Expanded(child: SizedBox(height: 10)),
                ]),
                SizedBox(height: 10),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(width: 30),
                  Text('Current message', style: TextStyle(fontSize: 16)),
                  SizedBox(width: 30),
                  Expanded(
                      child: TextFormField(
                    initialValue: userState.messageIndex.toString(),
                    decoration: InputDecoration(labelText: 'Enter Number'),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  )),
                  Expanded(child: SizedBox(height: 10)),
                ])
              ],
            )));
  }

  Widget buildSettingsList_old() {
    return Consumer<UserState>(
        builder: (context, userState, child) => SettingsList(
              sections: [
                SettingsSection(
                  title: Text('Common'),
                  tiles: [
                    SettingsTile(
                      title: Text('Language'),
                      description: Text(userState.localeLabel()),
                      leading: Icon(Icons.language),
                      onPressed: (context) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => LanguagesScreen(),
                        ));
                      },
                    ),
                    SettingsTile(
                      title: Text('Current message'),
                      description: Text(userState.messageIndex.toString()),
                      leading: Icon(Icons.bookmark),
                      onPressed: (context) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => CurrentMessageScreen(),
                        ));
                      },
                    ),
                    // SettingsTile(
                    //   title: DropdownButton(
                    //       items: const [
                    //         DropdownMenuItem(
                    //             child: Text("English"), value: "en"),
                    //         DropdownMenuItem(child: Text("Polish"), value: "pl")
                    //       ],
                    //       value: userState.locale.countryCode,
                    //       onChanged: (String? value) {
                    //         print(value.toString());
                    //       }), //Text('Text size'),
                    //   description: Text(userState.fontSize.toString()),
                    //   leading: Icon(Icons.font_download),
                    //   trailing: DropdownButton(
                    //       items: const [
                    //         DropdownMenuItem(
                    //             child: Text("English"), value: "en"),
                    //         DropdownMenuItem(child: Text("Polish"), value: "pl")
                    //       ],
                    //       value: userState.locale.countryCode,
                    //       onChanged: (String? value) {
                    //         print(value.toString());
                    //       }),
                    //   onPressed: (context) {
                    //     Navigator.of(context).push(MaterialPageRoute(
                    //       builder: (_) => LanguagesScreen(),
                    //     ));
                    //   },
                    // ),
                    /*
                    CustomSettingsTile(
                      child: Container(
                        color: Color(0xFFEFEFF4),
                        padding: EdgeInsetsDirectional.only(
                          start: 14,
                          top: 12,
                          bottom: 30,
                          end: 14,
                        ),
                        child: Text(
                          'You can setup the language you want',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w400,
                            fontSize: 13.5,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ),
                    ),
                    */
                    // SettingsTile(
                    //   title: Text('Environment'),
                    //   description: Text('Production'),
                    //   leading: Icon(Icons.cloud_queue),
                    // ),
                  ],
                ),
                // SettingsSection(
                //   title: Text('Account'),
                //   tiles: [
                //     SettingsTile(
                //         title: Text('Phone number'),
                //         leading: Icon(Icons.phone)),
                //     SettingsTile(
                //         title: Text('Email'), leading: Icon(Icons.email)),
                //     SettingsTile(
                //         title: Text('Sign out'),
                //         leading: Icon(Icons.exit_to_app)),
                //   ],
                // ),
                // SettingsSection(
                //   title: Text('Security'),
                //   tiles: [
                //     SettingsTile.switchTile(
                //       title: Text('Lock app in background'),
                //       leading: Icon(Icons.phonelink_lock),
                //       initialValue: lockInBackground,
                //       onToggle: (bool value) {
                //         setState(() {
                //           lockInBackground = value;
                //           notificationsEnabled = value;
                //         });
                //       },
                //     ),
                //     SettingsTile.switchTile(
                //       title: Text('Use fingerprint'),
                //       description: Text(
                //           'Allow application to access stored fingerprint IDs.'),
                //       leading: Icon(Icons.fingerprint),
                //       onToggle: (bool value) {},
                //       initialValue: false,
                //     ),
                //     SettingsTile.switchTile(
                //       title: Text('Change password'),
                //       leading: Icon(Icons.lock),
                //       initialValue: true,
                //       // switchValue: true,
                //       onToggle: (bool value) {},
                //     ),
                //     SettingsTile.switchTile(
                //       title: Text('Enable Notifications'),
                //       // enabled: notificationsEnabled,
                //       leading: Icon(Icons.notifications_active),
                //       initialValue: true,
                //       onToggle: (value) {},
                //     ),
                //   ],
                // ),
                // SettingsSection(
                //   title: Text('Misc'),
                //   tiles: [
                //     SettingsTile(
                //         title: Text('Terms of Service'),
                //         leading: Icon(Icons.description)),
                //     SettingsTile(
                //         title: Text('Open source licenses'),
                //         leading: Icon(Icons.collections_bookmark)),
                //   ],
                // ),
                // CustomSettingsSection(
                //   child: Column(
                //     children: [
                //       Padding(
                //         padding: const EdgeInsets.only(top: 22, bottom: 8),
                //         child: Image.asset(
                //           'assets/settings.png',
                //           height: 50,
                //           width: 50,
                //           color: Color(0xFF777777),
                //         ),
                //       ),
                //       Text(
                //         'Version: 2.4.0 (287)',
                //         style: TextStyle(color: Color(0xFF777777)),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ));
  }
}
