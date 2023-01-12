import 'package:flutter/material.dart';
import '../modules/task_list/TaskListsTab.dart';
import '../modules/setting/Setting_Tap.dart';

class MyProvider extends ChangeNotifier {
  int currentindex = 0;

  List<Widget> tab = [TaskListsTab(), SettingTab()];

  void ChangeTab(int indexii) {
    currentindex = indexii;
    notifyListeners();
  }

  DateTime selectdate = DateTime.now();

  bool press = false;

  // void Ispressed(){
  //   if(press==false){
  //     press=true;
  //
  //     notifyListeners();
  //
  //
  //
  //   }
  //   else{
  //     press=false;
  //
  //     notifyListeners();
  //
  //
  //   }
  //
  //
  // }

  void SelectDate(BuildContext context) async {
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: selectdate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (date == null) {
      return;
    }
    selectdate=date;
    notifyListeners();
  }
}