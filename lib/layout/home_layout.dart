import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/provider/my_provider.dart';

import 'Add_task_botton.dart';

class HomeLayout extends StatelessWidget {
  static const String RouteName = "Home";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext) {
        return MyProvider();
      },
      builder: (context, child) {
        var provider = Provider.of<MyProvider>(context);
        return Scaffold(
          extendBody: true,
          appBar: AppBar(
            title: Text("To Do List"),
          ),
          body: provider.tab[provider.currentindex],
          bottomNavigationBar: BottomAppBar(
            notchMargin: 5,
            shape: CircularNotchedRectangle(),
            color: Colors.white,
            elevation: 0.0,
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              onTap: (index) {
                provider.ChangeTab(index);
              },
              currentIndex: provider.currentindex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.list_outlined,
                    size: 35,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.settings,
                      size: 35,
                    ),
                    label: ""),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            shape: StadiumBorder(
              side: BorderSide(color: Colors.white, width: 4),
            ),
            onPressed: () {
              AddtaskBottomSheet(context);
            },
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }

  void AddtaskBottomSheet(context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return AddTaskBotton();
      },
    );
  }
}
