import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo/myTheme.dart';
import 'package:todo/provider/setting_provider.dart';

class Task extends StatelessWidget {
  String taskName, date;

  Task({required this.taskName, required this.date});

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingProvider>(context);
    return Slidable(
      startActionPane: ActionPane(
        motion: DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (_) {},
            icon: Icons.delete,
            backgroundColor: MyTheme.redColor,
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(20),
        width: double.infinity,
        height: 115,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).backgroundColor),
        child: Row(
          children: [
            Container(
              height: double.infinity,
              width: 4,
              margin: EdgeInsets.symmetric(vertical: 1, horizontal: 18),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskName,
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
                        date,
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
    );
  }
}
