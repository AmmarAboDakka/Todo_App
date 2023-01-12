import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modules/task_list/task_edit.dart';
import 'package:todo_app/provider/my_provider.dart';

import 'package:todo_app/shared/style/colors.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../modales/tasks.dart';
import '../../shared/network/locale/Firebase_utiles.dart';

class TaskItem extends StatefulWidget {
  @override
  Task task;

  TaskItem(this.task);

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  GlobalKey<FormState> formkeyy = GlobalKey<FormState>();
  bool press = false;

  @override
  // ignore: must_call_super

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyProvider(),
      builder: (context, child) {
        var provider = Provider.of<MyProvider>(context);
        return Slidable(
          startActionPane:
              ActionPane(extentRatio: 5 / 9, motion: DrawerMotion(), children: [
            SlidableAction(
              spacing: 2,
              borderRadius: BorderRadius.all(Radius.circular(12)),
              onPressed: (context) {
                DeleteTaskfromfireatore(widget.task);
              },
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
            SlidableAction(
              spacing: 2,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              onPressed: (context) {
                // EditeItem();
                Navigator.pushNamed(
                  context,
                  TaskEdite.routname,
                  arguments: TaskItem(
                    widget.task,
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
                color: widget.task.isDone == false
                    ? Colors.white
                    : Colors.greenAccent,
                borderRadius: BorderRadius.circular(12)),
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 80,
                      color: widget.task.isDone == false
                          ? primaryorangcolor
                          : Colors.green,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            widget.task.title,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text(widget.task.description),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // var data = getdatafromIsdone(Task(
                        //     title: widget.task.title,
                        //     description: widget.task.description,
                        //     date: widget.task.date));

                        if (widget.task.isDone == true) {
                          press = false;
                          var data2 = updateBool(widget.task.id, press);
                        } else if (widget.task.isDone == false) {
                          press = true;
                          var data2 = updateBool(widget.task.id, press);
                        }
                      },
                      child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: widget.task.isDone == false
                                  ? Colors.orange
                                  : Colors.green,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.elliptical(12, 12),
                                  bottomRight: Radius.elliptical(12, 12)),
                              border: Border.all()),
                          child: const Icon(Icons.done)),
                    ),
                  ],
                ),
                Visibility(
                    key: formkeyy,
                    visible: widget.task.isDone == false ? false : true,
                    child: const Text(
                      "The Task Is Completed",
                      style:
                          TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
