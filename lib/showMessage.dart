import 'package:flutter/material.dart';

void showMessage(BuildContext context, message,
    {String? buttonTextOne,
    VoidCallback? buttonActionOne,
    String? buttonTextTwo,
    VoidCallback? buttonActionTwo,
    bool isCanceLable = true}) {
  List<Widget> actions = [];
  if (buttonTextOne != null) {
    actions.add(TextButton(
        onPressed: () {
          Navigator.pop(context);
          buttonActionOne;
        },
        child: Text(buttonTextOne)));
  }
  if (buttonTextTwo != null) {
    actions.add(TextButton(
        onPressed: () {
          Navigator.pop(context);
          buttonActionTwo;
        },
        child: Text(buttonTextTwo)));
  }

  showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
            content: Text(
              message,
              style: Theme.of(context).textTheme.headline2,
            ),
            actions: actions);
      },
      barrierDismissible: isCanceLable);
}

void showLoading(BuildContext context, String loadingMessage,
    {bool isCanceLable = true}) {
  showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(
                width: 15,
              ),
              Text(loadingMessage),
            ],
          ),
        );
      },
      barrierDismissible: isCanceLable);
}

void hideLoading(BuildContext context) {
  Navigator.pop(context);
}
