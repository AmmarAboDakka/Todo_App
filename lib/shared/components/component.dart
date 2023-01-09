import 'package:flutter/material.dart';

void showLoading(context, String message, {bool barrierDis = false}) {
  showDialog(
    context: context,
    barrierDismissible: barrierDis,
    builder: (context) {
      return AlertDialog(
        title: Row(
          children: [
            Text(message),
            SizedBox(
              width: 50,
            ),
            const CircularProgressIndicator(
              color: Colors.orange,
            )
          ],
        ),
      );
    },
  );
}

void hideLoading(context) {
  Navigator.pop(context);
}

void showMessage(context, String message, String description, String btn1,
    VoidCallback posAction,
    {bool isCancelled = false, String? negbtn, VoidCallback? negAction}) {
  showDialog(
    context: context,
    builder: (context) {
      List<Widget> actions = [
        TextButton(
            onPressed: posAction,
            child: Text(
              btn1,
              style: TextStyle(fontSize: 25),
            )),
      ];
      if (negbtn != null) {
        actions.add(TextButton(
            onPressed: negAction,
            child: Text(
              negbtn,
              style: TextStyle(fontSize: 25),
            )));
      }

      return AlertDialog(
        title: Text(message),
        content: Text(
          description,
          style: TextStyle(color: Colors.black54),
        ),
        actions: actions,
      );
    },
  );
}
