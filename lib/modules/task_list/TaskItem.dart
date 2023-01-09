import 'package:flutter/material.dart';
import 'package:todo_app/modules/task_list/task_edit.dart';
import 'package:todo_app/shared/style/colors.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../modales/tasks.dart';
import '../../shared/network/locale/Firebase_utiles.dart';

class TaskItem extends StatelessWidget {
  @override
  Task task;

  TaskItem(this.task);

  Widget build(BuildContext context) {
    return Slidable(
      startActionPane:
          ActionPane(extentRatio: 5 / 9, motion: DrawerMotion(), children: [
        SlidableAction(
          spacing: 2,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          onPressed: (context) {
            DeleteTaskfromfireatore(task);
          },
          backgroundColor: Color(0xFFFE4A49),
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Delete',
        ),
        SlidableAction(
          spacing: 2,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          onPressed: (context) {
            // EditeItem();
            Navigator.pushNamed(
              context,
              TaskEdite.routname,
              arguments: TaskItem(
                task,
              ),
            );
          },
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          icon: Icons.edit,
          label: 'Edite',
        ),
      ]),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.all(3),
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
                  Text(task.title),
                  Text(task.description),
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
      ),
    );
  }
}
