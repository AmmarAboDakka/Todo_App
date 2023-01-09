import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/layout/home_layout.dart';

import '../../provider/my_provider.dart';

import '../../shared/network/locale/Firebase_utiles.dart';
import '../../shared/style/colors.dart';
import 'TaskItem.dart';

class TaskEdite extends StatefulWidget {
  static const String routname = "task edit";

  @override
  State<TaskEdite> createState() => _TaskEditeState();
}

class _TaskEditeState extends State<TaskEdite> {
  var titleeControler = TextEditingController();

  var descriptioneControler = TextEditingController();

  GlobalKey<FormState> formkeyy = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as TaskItem;
    titleeControler.text = arg.task.title;
    descriptioneControler.text = arg.task.description;
    return ChangeNotifierProvider(
        create: (context) => MyProvider(),
        builder: (context, child) {
          var prvider = Provider.of<MyProvider>(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text("Edit Your Task"),
            ),
            body: Container(
              margin: EdgeInsets.all(12),
              color: Colors.white,
              padding: EdgeInsets.all(25),
              child: Form(
                key: formkeyy,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: titleeControler,
                      validator: (value) {
                        if (value == "" || value!.isEmpty) {
                          return "Please Enter the Title";
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blueGrey, width: 3),
                            borderRadius: BorderRadius.circular(12)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primaryorangcolor),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: primaryorangcolor),
                            borderRadius: BorderRadius.circular(12)),
                        hintText: "Title",
                        labelText: "Title",
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: descriptioneControler,
                      validator: (value) {
                        if (value == "" || value!.isEmpty) {
                          return "Please Enter the Title";
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blueGrey, width: 3),
                            borderRadius: BorderRadius.circular(12)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primaryorangcolor),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: primaryorangcolor),
                            borderRadius: BorderRadius.circular(12)),
                        hintText: "Description",
                        labelText: "Description",
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Select the Date",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          ?.copyWith(color: blackcolor, fontSize: 25),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        prvider.SelectDate(context);
                      },
                      child: Text(
                        "${prvider.selectdate.year}/${prvider.selectdate.month}/${prvider.selectdate.day}",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            ?.copyWith(fontWeight: FontWeight.normal),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            if (formkeyy.currentState!.validate()) {
                              var data = getUserInfor(
                                  arg.task,
                                  titleeControler.text,
                                  descriptioneControler.text,
                                  DateUtils.dateOnly(prvider.selectdate)
                                      .millisecondsSinceEpoch);
                              Navigator.of(context)
                                  .pushNamed(HomeLayout.RouteName);
                            }
                          },
                          child: Text("Done")),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
