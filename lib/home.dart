import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo/myTheme.dart';
import 'package:todo/provider/setting_provider.dart';
import 'package:todo/settings/settings_tap.dart';
import 'package:todo/tasks/taskAdd.dart';
import 'package:todo/tasks/tasks_tab.dart';

class Home extends StatefulWidget {
  static const String nameKey = "home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> screens = [Tasks(), Settings()];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var srttingProvider = Provider.of<SettingProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.app_title),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Theme.of(context).backgroundColor,
          shape: CircularNotchedRectangle(),
          notchMargin: 8,
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.list), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          shape: StadiumBorder(
            side: BorderSide(
                color: srttingProvider.isDark()
                    ? MyTheme.darkBlueBlackColor
                    : MyTheme.whiteColor,
                width: 4),
          ),
          onPressed: () {
            showTaskAdd();
          },
          child: Icon(Icons.add),
        ),
        body: screens[selectedIndex]);
  }

  void showTaskAdd() {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TaskAdd();
        });
  }
}
