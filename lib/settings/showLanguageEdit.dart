import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../myTheme.dart';
import '../provider/setting_provider.dart';

class ShowLanguageEdit extends StatefulWidget {
  @override
  State<ShowLanguageEdit> createState() => _ShowLanguageEditState();
}

class _ShowLanguageEditState extends State<ShowLanguageEdit> {
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
                settingProvider.changeLanguaga("ar");
                setState(() {});
              },
              child: Container(
                width: double.infinity,
                height: 60,
                child: settingProvider.languaga == "en"
                    ? unSelect("العربية")
                    : select("العربية"),
              ),
            ),
            InkWell(
              onTap: () {
                settingProvider.changeLanguaga("en");
                setState(() {});
              },
              child: Container(
                width: double.infinity,
                height: 60,
                child: settingProvider.languaga == "en"
                    ? select("English")
                    : unSelect("English"),
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
