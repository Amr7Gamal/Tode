import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo/datebase/my_datebase.dart';
import 'package:todo/myTheme.dart';
import 'package:todo/provider/setting_provider.dart';
import 'package:todo/showMessage.dart';

import '../datebase/taskData.dart';

class Task extends StatelessWidget {
  TaskData task;

  Task(this.task);

  @override
  Widget build(BuildContext context) {
    DateTime? date = task.dateTime;
    var settingsProvider = Provider.of<SettingProvider>(context);
    return Container(
      margin: EdgeInsets.all(20),
      child: Slidable(
        startActionPane: ActionPane(
          motion: DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (_) {
                MyDateBase.deleteTask(task).then((value) {
                  showMessage(context, "done delete task", buttonTextOne: "Ok");
                }).onError((error, stackTrace) {
                  showMessage(context, "Error", buttonTextOne: "Ok");
                }).timeout((Duration(seconds: 5)), onTimeout: () {
                  showMessage(context, "done delete in local",
                      buttonTextOne: "Ok");
                });
              },
              icon: Icons.delete,
              label: "Delete",
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12)),
              backgroundColor: MyTheme.redColor,
            ),
          ],
        ),
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
                color: Theme.of(context).primaryColor,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title ?? "",
                      style: Theme.of(context).textTheme.headline2,
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
                onPressed: () {},
                child: Icon(
                  Icons.done,
                  size: 36,
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
