import 'package:flutter/material.dart';
import 'package:todo_app/shared/style/colors.dart';

class TaskItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 80,
            color: primaryorangcolor,
          ),
          Expanded(
            child: Column(
              children: [
                Text("fhlkj;sdfdfsdf"),
                Text("fhlkj;sdfdfsdf"),
              ],
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all()),
              child: Icon(Icons.done)),
        ],
      ),
    );
  }
}
