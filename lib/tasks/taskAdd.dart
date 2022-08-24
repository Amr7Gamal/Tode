import 'package:flutter/material.dart';
import 'package:todo/myTheme.dart';

class TaskAdd extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

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
            Text(
              "10:30 AM",
              style: Theme.of(context).textTheme.headline3,
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

  void addTask() {
    if (formKey.currentState?.validate() == true) {}
  }
}
