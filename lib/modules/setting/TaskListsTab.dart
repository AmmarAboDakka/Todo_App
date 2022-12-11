import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';

import 'TaskItem.dart';

class TaskListsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) => print(date),
            leftMargin: 20,
            monthColor: Colors.blueGrey,
            dayColor: Colors.black45,
            activeDayColor: Colors.white,
            activeBackgroundDayColor: Colors.orange[700],
            dotsColor: Color(0xFF333A47),
            selectableDayPredicate: (date) => true,
            locale: 'en_ISO',
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) {
                return TaskItem();
              },
            ),
          )
        ],
      ),
    );
  }
}
