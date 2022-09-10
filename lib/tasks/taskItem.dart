import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo/datebase/my_datebase.dart';
import 'package:todo/myTheme.dart';
import 'package:todo/provider/setting_provider.dart';
import 'package:todo/showMessage.dart';
import 'package:todo/tasks/TaskEdite.dart';

import '../datebase/taskData.dart';

class Task extends StatefulWidget {
  TaskData task;

  Task(this.task);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    DateTime? date = widget.task.dateTime;
    var settingsProvider = Provider.of<SettingProvider>(context);
    return Container(
      margin: EdgeInsets.all(20),
      child: Slidable(
        startActionPane: ActionPane(
          motion: DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (_) {
                MyDateBase.deleteTask(widget.task).then((value) {
                  showMessage(context,
                      AppLocalizations.of(context)!.done_delete_the_task,
                      buttonTextOne: AppLocalizations.of(context)!.ok);
                }).onError((error, stackTrace) {
                  showMessage(context,
                      AppLocalizations.of(context)!.error_not_deleted_the_task,
                      buttonTextOne: AppLocalizations.of(context)!.ok);
                }).timeout((Duration(seconds: 5)), onTimeout: () {
                  showMessage(
                      context,
                      AppLocalizations.of(context)!
                          .done_delete_the_task_locally,
                      buttonTextOne: AppLocalizations.of(context)!.ok);
                });
              },
              icon: Icons.delete,
              label: AppLocalizations.of(context)!.delete,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12)),
              backgroundColor: MyTheme.redColor,
            ),
          ],
        ),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, TaskEdite.nameKey,
                arguments: widget.task);
          },
          child: Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            height: 115,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12)),
                color: Theme.of(context).backgroundColor),
            child: Row(
              children: [
                Container(
                  height: double.infinity,
                  width: 4,
                  padding: EdgeInsets.symmetric(horizontal: 21),
                  margin: EdgeInsets.symmetric(vertical: 1, horizontal: 14),
                  color: widget.task.isDone!
                      ? MyTheme.greenColor
                      : Theme.of(context).primaryColor,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.task.title ?? "",
                        style: widget.task.isDone!
                            ? Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(color: MyTheme.greenColor)
                            : Theme.of(context).textTheme.headline2,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_outlined,
                            color: settingsProvider.isDark()
                                ? MyTheme.whiteColor
                                : MyTheme.blackColor,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "${date!.year}/${date.month}/${date.day}",
                            style: Theme.of(context).textTheme.headline4,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                    child: ElevatedButton(
                  onPressed: () {
                    MyDateBase.editIsDone(widget.task);
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => (widget.task.isDone!
                              ? MyTheme.greenColor
                              : Theme.of(context).primaryColor))),
                  child: widget.task.isDone!
                      ? Text(AppLocalizations.of(context)!.done,
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(color: MyTheme.whiteColor))
                      : Icon(
                          Icons.done,
                          size: 36,
                          color: MyTheme.whiteColor,
                        ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
