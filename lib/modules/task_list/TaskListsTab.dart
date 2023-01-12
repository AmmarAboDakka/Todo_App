import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/my_provider.dart';

import '../../modales/tasks.dart';
import '../../shared/network/locale/Firebase_utiles.dart';
import 'TaskItem.dart';

class TaskListsTab extends StatefulWidget {
  @override
  State<TaskListsTab> createState() => _TaskListsTabState();
}

class _TaskListsTabState extends State<TaskListsTab> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyProvider(),
      builder: (context, child) {
        var provider = Provider.of<MyProvider>(context);
        return Container(
          child: Column(
            children: [
              CalendarTimeline(
                initialDate: provider.selectdate,
                firstDate: DateTime.now().subtract(Duration(days: 365)),
                lastDate: DateTime.now().add(Duration(days: 365)),
                onDateSelected: (date) {
                  provider.selectdate = date;
                  setState(() {});
                },
                leftMargin: 20,
                monthColor: Colors.blueGrey,
                dayColor: Colors.black45,
                activeDayColor: Colors.white,
                activeBackgroundDayColor: Colors.orange[700],
                dotsColor: Color(0xFF333A47),
                selectableDayPredicate: (date) => true,
                locale: 'en_ISO',
              ),
              SizedBox(
                height: 5,
              ),
              StreamBuilder<QuerySnapshot<Task>>(
                stream: getdatafromfirebase(provider.selectdate),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(
                      color: Colors.orange,
                    );
                  }
                  if (snapshot.hasError) {
                    return Text("Something Went Error");
                  }
                  var task =
                      snapshot.data?.docs.map((task) => task.data()).toList() ??
                          [];
                  return Expanded(
                      child: ListView.builder(
                   itemCount: task.length,
                    itemBuilder: (context, index) {
                      return TaskItem(task[index]);
                    },
                  ));
                },
              )
            ],
          ),
        );
      },
    );
  }
}
