import 'package:flutter/material.dart';
import 'package:todo/myTheme.dart';

class TaskAdd extends StatelessWidget {
  String text = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      padding: EdgeInsets.all(21),
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
          TextField(
            onChanged: (text) {
              this.text = text;
            },
            decoration: InputDecoration(
                hintStyle: Theme.of(context).textTheme.headline4,
                hintText: "Enter Your Task"),
          ),
          SizedBox(
            height: 50,
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
        ],
      ),
    );
  }
}
