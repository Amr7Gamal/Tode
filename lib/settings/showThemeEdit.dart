import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo/myTheme.dart';

import '../provider/setting_provider.dart';

class ShowThemeEdit extends StatefulWidget {
  @override
  State<ShowThemeEdit> createState() => _ShowThemeEditState();
}

class _ShowThemeEditState extends State<ShowThemeEdit> {
  late SettingProvider settingProvider;

  @override
  Widget build(BuildContext context) {
    settingProvider = Provider.of<SettingProvider>(context);

    return Container(
        padding: EdgeInsets.all(21),
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                settingProvider.changeTheme(MyTheme.lightTheme);
                setState(() {});
              },
              child: Container(
                width: double.infinity,
                height: 60,
                child: settingProvider.isDark()
                    ? unSelect(AppLocalizations.of(context)!.light)
                    : select(AppLocalizations.of(context)!.light),
              ),
            ),
            InkWell(
              onTap: () {
                settingProvider.changeTheme(MyTheme.darkTheme);
                setState(() {});
              },
              child: Container(
                width: double.infinity,
                height: 60,
                child: settingProvider.isDark()
                    ? select(AppLocalizations.of(context)!.dark)
                    : unSelect(AppLocalizations.of(context)!.dark),
              ),
            ),
          ],
        ));
  }

  Widget select(String theme) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            theme,
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  color: MyTheme.lightBlueColor,
                ),
          ),
          Icon(
            Icons.done,
            color: settingProvider.isDark()
                ? MyTheme.whiteColor
                : MyTheme.blackColor,
          )
        ],
      ),
    );
  }

  Widget unSelect(String theme) {
    return Container(
      child: Row(
        children: [
          Text(
            theme,
            style: Theme.of(context).textTheme.headline2,
          ),
        ],
      ),
    );
  }
}
