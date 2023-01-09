import 'package:flutter/material.dart';
import 'package:todo_app/provider/my_provider.dart';
import 'package:todo_app/shared/style/colors.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddTaskBotton extends StatefulWidget {
  @override
  State<AddTaskBotton> createState() => _AddTaskBottonState();
}

class _AddTaskBottonState extends State<AddTaskBotton> {
  var TitleControler = TextEditingController();

  var DescriptionControler = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return ChangeNotifierProvider(
      create: (context) => MyProvider(),
      builder: (context, child) {
      var prvider=Provider.of<MyProvider>(context);
      return SingleChildScrollView(

        padding: EdgeInsets.only(bottom: mediaQueryData.viewInsets.bottom),
        child: Container(
          padding: EdgeInsets.all(12),
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    AppLocalizations.of(context)!.addnewtask,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        ?.copyWith(fontSize: 30),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == "" || value!.isEmpty) {
                        return "Please Enter the Title";
                      }
                      return null;
                    },
                    style: const TextStyle(color: Colors.black),
                    autofocus: true,
                    controller: TitleControler,
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
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == "" || value!.isEmpty) {
                        return "Please Enter the Title";
                      }
                      return null;
                    },
                    style: const TextStyle(color: Colors.black),
                    maxLines: 4,
                    controller: DescriptionControler,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blueGrey, width: 3),
                            borderRadius: BorderRadius.circular(12)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: primaryorangcolor),
                            borderRadius: BorderRadius.circular(12)),
                        hintText: "Description",
                        labelText: "Description",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: primaryorangcolor),
                            borderRadius: BorderRadius.circular(12))),
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
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {}
                      },
                      child: Text("Add"))
                ],
              ),
            ),
        ),
      );
    },);
  }


}
