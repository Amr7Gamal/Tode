import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo/date.dart';
import 'package:todo/datebase/my_datebase.dart';
import 'package:todo/datebase/taskData.dart';
import 'package:todo/myTheme.dart';

import '../provider/setting_provider.dart';
import 'showDateDialoge.dart';

class TaskEdite extends StatefulWidget {
  static const String nameKey = "editeTask";

  TaskEdite();

  @override
  State<TaskEdite> createState() => _TaskEditeState();
}

class _TaskEditeState extends State<TaskEdite> {
  DateTime selectedDate = dateOnly(DateTime.now());
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var srttingProvider = Provider.of<SettingProvider>(context);

    final task = ModalRoute.of(context)!.settings.arguments as TaskData;
    Size size = MediaQuery.of(context).size;
    DateTime? dateTime = task.dateTime;

    selectedDate != dateOnly(DateTime.now())
        ? updateDate(selectedDate)
        : updateDate(dateTime!);

    task.dateTime = selectedDate;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: size.height * .32,
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.only(left: 25, bottom: 55),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: MyTheme.whiteColor,
                    size: 34,
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.app_title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin:
                EdgeInsets.only(top: size.height * .19, left: 28, right: 28),
            padding: EdgeInsets.symmetric(vertical: 32, horizontal: 22),
            height: MediaQuery.of(context).size.height * .6,
            decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(30)),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.edit_Task,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    TextFormField(
                      style: TextStyle(
                        color: srttingProvider.isDark()
                            ? MyTheme.whiteColor
                            : MyTheme.blackColor,
                      ),
                      onChanged: (text) {
                        task.title = text;
                      },
                      validator: (text) {
                        if (text == null || text == text.trim().isEmpty) {
                          Text(AppLocalizations.of(context)!
                              .pless_writing_Title);
                        }
                        return null;
                      },
                      initialValue: task.title,
                      decoration: InputDecoration(
                          label: Text(
                        AppLocalizations.of(context)!.title_Task,
                        style: Theme.of(context).textTheme.headline2,
                      )),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    TextFormField(
                      style: TextStyle(
                        color: srttingProvider.isDark()
                            ? MyTheme.whiteColor
                            : MyTheme.blackColor,
                      ),
                      initialValue: task.description,
                      onChanged: (text) {
                        task.description = text;
                      },
                      validator: (text) {
                        if (text == null || text == text.trim().isEmpty) {
                          Text(AppLocalizations.of(context)!
                              .please_enter_description);
                        }
                      },
                      decoration: InputDecoration(
                          label: Text(
                        AppLocalizations.of(context)!.task_description,
                        style: Theme.of(context).textTheme.headline2,
                      )),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      AppLocalizations.of(context)!.select_date,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    InkWell(
                      onTap: () {
                        showEditDate();
                      },
                      child: Text(
                        "${selectedDate.year}/${selectedDate.month}/${selectedDate.day}",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    MaterialButton(
                      onPressed: () {
                        edit(task);
                        Navigator.pop(context);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      color: Theme.of(context).primaryColor,
                      child: Text(AppLocalizations.of(context)!.edit_Task,
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(color: MyTheme.whiteColor)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void edit(TaskData task) {
    if (formKey.currentState!.validate() == false) {
      return;
    }
    MyDateBase.updateTask(task);
  }

  void updateDate(DateTime date) {
    selectedDate = date;
  }

  void showEditDate() async {
    selectedDate = await showDateDialoge(context, selectedDate);
    setState(() {});
  }
}
