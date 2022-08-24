import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/setting_provider.dart';
import 'package:todo/tasks/taskItem.dart';

class Tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var settingProvider = Provider.of<SettingProvider>(context);

    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) => () {},
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
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Task(taskName: "Task ${index + 1}", date: "10:30 AM");
            },
            itemCount: 6,
          ),
        ),
      ],
    );
  }
}
