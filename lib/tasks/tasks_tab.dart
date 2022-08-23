import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo/tasks/task.dart';

class Tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          initialDate: DateTime(2020, 4, 20),
          firstDate: DateTime(2019, 1, 15),
          lastDate: DateTime(2020, 11, 20),
          onDateSelected: (date) => print(date),
          leftMargin: 20,
          monthColor: Colors.blueGrey,
          dayColor: Colors.teal[200],
          activeDayColor: Colors.white,
          activeBackgroundDayColor: Colors.redAccent[100],
          dotsColor: Color(0xFF333A47),
          selectableDayPredicate: (date) => date.day != 23,
          locale: 'en_ISO',
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
