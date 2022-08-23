import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/myTheme.dart';
import 'package:todo/provider/setting_provider.dart';
import 'package:todo/settings/showLanguageEdit.dart';
import 'package:todo/settings/showThemeEdit.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var settingProvider = Provider.of<SettingProvider>(context);
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Language", style: Theme.of(context).textTheme.headline2),
          InkWell(
            onTap: () {
              showLanguageEdit();
            },
            child: Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.all(12),
              width: double.infinity,
              height: 50,
              color: MyTheme.whiteColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    settingProvider.languaga == "en" ? "English" : "العربية",
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: MyTheme.lightBlueColor),
                  ),
                  Icon(Icons.redo_outlined)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Text("Theme", style: Theme.of(context).textTheme.headline2),
          InkWell(
            onTap: () {
              showThemeEdit();
            },
            child: Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.all(12),
              width: double.infinity,
              height: 50,
              color: MyTheme.whiteColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    settingProvider.isDark() ? "Dark" : "Light",
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: MyTheme.lightBlueColor),
                  ),
                  Icon(Icons.redo_outlined)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void showThemeEdit() {
    showModalBottomSheet(context: context, builder: (_) => ShowThemeEdit());
  }

  void showLanguageEdit() {
    showModalBottomSheet(context: context, builder: (_) => ShowLanguageEdit());
  }
}
