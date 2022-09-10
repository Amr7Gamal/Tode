import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
          Text(AppLocalizations.of(context)!.language,
              style: Theme.of(context).textTheme.headline2),
          InkWell(
            onTap: () {
              showLanguageEdit();
            },
            child: Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.all(12),
              width: double.infinity,
              height: 51,
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
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Text(AppLocalizations.of(context)!.theme,
              style: Theme.of(context).textTheme.headline2),
          InkWell(
            onTap: () {
              showThemeEdit();
            },
            child: Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.all(12),
              width: double.infinity,
              height: 51,
              color: MyTheme.whiteColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    settingProvider.isDark()
                        ? AppLocalizations.of(context)!.dark
                        : AppLocalizations.of(context)!.light,
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: MyTheme.lightBlueColor),
                  ),
                  Icon(Icons.arrow_drop_down)
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
