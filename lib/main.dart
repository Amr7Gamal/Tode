import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/home.dart';
import 'package:todo/myTheme.dart';
import 'package:todo/provider/setting_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(ChangeNotifierProvider<SettingProvider>(
    create: (_) => SettingProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  late SettingProvider settingsProvider;

  @override
  Widget build(BuildContext context) {
    settingsProvider = Provider.of(context);
    sharedPreferences();

    return MaterialApp(
        title: 'Tode',
        theme: settingsProvider.theme,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [Locale("en"), Locale("ar")],
        locale: Locale(settingsProvider.languaga),
        initialRoute: Home.nameKey,
        routes: {
          Home.nameKey: (_) => Home(),
        });
  }

  void sharedPreferences() async {
    final shPref = await SharedPreferences.getInstance();

    settingsProvider.changeLanguaga(shPref.getString("language") ?? "ar");
    if (shPref.getString("theme") == "light") {
      settingsProvider.changeTheme(MyTheme.lightTheme);
    } else if (shPref.getString("theme") == "dark") {
      settingsProvider.changeTheme(MyTheme.darkTheme);
    }
  }
}

