import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/datebase/my_datebase.dart';
import 'package:todo/datebase/taskData.dart';
import 'package:todo/provider/setting_provider.dart';
import 'package:todo/tasks/taskItem.dart';

class Tasks extends StatefulWidget {
  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  DateTime dateSelected = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var settingProvider = Provider.of<SettingProvider>(context);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: CalendarTimeline(
            initialDate: dateSelected,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) {
              setState(() {
                dateSelected = date;
              });
            },
            showYears: true,
            leftMargin: 20,
            monthColor: Colors.blueGrey,
            dayColor: Colors.teal[200],
            activeDayColor: Colors.white,
            activeBackgroundDayColor: Theme.of(context).primaryColor,
            dotsColor: Color(0xFF333A47),
            selectableDayPredicate: (date) => true,
            locale: settingProvider.languaga,
          ),
        ),
        Expanded(
            child: StreamBuilder<QuerySnapshot<TaskData>>(
          stream: MyDateBase.listenForTasksRealTimeUpdetes(dateSelected),
          builder: (BuildContext, snapshot) {
            if (snapshot.hasError) {
              return Text("Error");
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            var date = snapshot.data!.docs.map((docs) => docs.data()).toList();
            return ListView.builder(
              itemBuilder: (BuildContext, index) {
                return Task(date![index]);
              },
              itemCount: date!.length,
            );
          },
        )),
      ],
    );
  }
}
