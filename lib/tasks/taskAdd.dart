import 'package:flutter/material.dart';
import 'package:todo/datebase/my_datebase.dart';
import 'package:todo/datebase/taskData.dart';
import 'package:todo/myTheme.dart';

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
    return Container(
      color: Theme.of(context).backgroundColor,
      padding: EdgeInsets.all(21),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Text(
              "Title",
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
                  return "Please Enter Title";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelStyle: Theme.of(context).textTheme.headline4,
                  label: Text("Enter Your Task")),
            ),
            SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: descriptionController,
              validator: (text) {
                if (text == null || text == text.trim().isEmpty) {
                  return "Please Enter Description";
                }
                return null;
              },
              maxLines: 4,
              minLines: 4,
              decoration: InputDecoration(
                  labelStyle: Theme.of(context).textTheme.headline4,
                  label: Text("Description")),
            ),
            Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 18),
                child: Text("Select Time",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.headline2)),
            InkWell(
              onTap: () {
                showDateDialoge();
              },
              child: Text(
                "${selectedDate.year}/${selectedDate.month}/${selectedDate.day}",
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  addTask();
                },
                child: Text("Add"))
          ],
        ),
      ),
    );
  }

  DateTime selectedDate = DateTime.now();

  void showDateDialoge() async {
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: selectedDate,
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (date != null) {
      selectedDate = date;
      setState(() {});
    }
  }

  void addTask() {
    if (formKey.currentState?.validate() == true) {
      String title = titleController.text;
      String description = descriptionController.text;
      TaskData task = TaskData(
        title: title,
        description: description,
        dateTime: selectedDate,
        isDone: false,
      );
      MyDateBase.insertTask(task)
          .then((value) {})
          .onError((error, stackTrace) {})
          .timeout(Duration(seconds: 6), onTimeout: () {});
    }
  }
}
