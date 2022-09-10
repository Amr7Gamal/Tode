import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo/date.dart';
import 'package:todo/datebase/my_datebase.dart';
import 'package:todo/datebase/taskData.dart';
import 'package:todo/myTheme.dart';
import 'package:todo/showMessage.dart';

import '../provider/setting_provider.dart';
import 'showDateDialoge.dart';

class TaskAdd extends StatefulWidget {
  @override
  State<TaskAdd> createState() => _TaskAddState();
}

class _TaskAddState extends State<TaskAdd> {
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var srttingProvider = Provider.of<SettingProvider>(context);

    return Container(
      color: Theme.of(context).backgroundColor,
      padding: EdgeInsets.all(21),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                AppLocalizations.of(context)!.add_task,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: MyTheme.lightBlueColor),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: titleController,
                validator: (text) {
                  if (text == null || text == text.trim().isEmpty) {
                    return AppLocalizations.of(context)!.please_enter_title;
                  }
                  return null;
                },
                style: TextStyle(
                  color: srttingProvider.isDark()
                      ? MyTheme.whiteColor
                      : MyTheme.blackColor,
                ),
                decoration: InputDecoration(
                    labelStyle: Theme.of(context).textTheme.headline4,
                    label: Text(AppLocalizations.of(context)!.enter_your_task)),
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: descriptionController,
                validator: (text) {
                  if (text == null || text == text.trim().isEmpty) {
                    return AppLocalizations.of(context)!
                        .please_enter_description;
                  }
                  return null;
                },
                style: TextStyle(
                  color: srttingProvider.isDark()
                      ? MyTheme.whiteColor
                      : MyTheme.blackColor,
                ),
                maxLines: 4,
                minLines: 4,
                decoration: InputDecoration(
                    labelStyle: Theme.of(context).textTheme.headline4,
                    fillColor: srttingProvider.isDark()
                        ? MyTheme.blackColor
                        : MyTheme.whiteColor,
                    label: Text(AppLocalizations.of(context)!.description)),
              ),
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 18),
                  child: Text(AppLocalizations.of(context)!.select_date,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.headline2)),
              InkWell(
                onTap: () {
                  showEditDate();
                },
                child: Text(
                  "${selectedDate.year}/${selectedDate.month}/${selectedDate.day}",
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                  onPressed: () {
                    addTask();
                  },
                  child: Text(AppLocalizations.of(context)!.add))
            ],
          ),
        ),
      ),
    );
  }

  DateTime selectedDate = DateTime.now();

  void addTask() {
    if (formKey.currentState?.validate() == true) {
      String title = titleController.text;
      String description = descriptionController.text;
      TaskData task = TaskData(
        title: title,
        description: description,
        dateTime: dateOnly(selectedDate),
        isDone: false,
      );

      showLoading(context, AppLocalizations.of(context)!.loading,
          isCanceLable: false);

      MyDateBase.insertTask(task).then((value) {
        hideLoading(context);
        showMessage(
          context,
          AppLocalizations.of(context)!.done_added_the_task,
          buttonTextOne: AppLocalizations.of(context)!.ok,
        );
      }).onError((error, stackTrace) {
        hideLoading(context);
        showMessage(
            context, AppLocalizations.of(context)!.error_not_deleted_the_task);
      }).timeout(Duration(seconds: 6), onTimeout: () {
        hideLoading(context);
        showMessage(
            context, AppLocalizations.of(context)!.done_saved_The_Task_locally);
      });
    }
  }

  void showEditDate() async {
    selectedDate = await showDateDialoge(context, selectedDate);
    setState(() {});
  }
}
