import 'package:flutter/material.dart';

class SettingTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Text("Language",
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.start),
          SizedBox(
            height: 20,
          ),
          PopupMenuButton<int>(
            itemBuilder: (context) => [
              PopupMenuItem(
                onTap: () {},
                value: 1,
                child: const Text(
                  "English",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w700),
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: Text(
                  "Arabic",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w700),
                ),
              ),
            ],
            child: Container(
              height: 50,
              width: 200,
              decoration: ShapeDecoration(
                color: Colors.orange,
                shape: StadiumBorder(
                  side: BorderSide(color: Colors.black, width: 2),
                ),
              ),
              child: Icon(Icons.language),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Text("Theme",
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.start),
          SizedBox(
            height: 20,
          ),
          PopupMenuButton<int>(
            color: Colors.orange,
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Text(
                  "Light",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w700),
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: Text(
                  "Dark",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w700),
                ),
              ),
            ],
            child: Container(
              height: 50,
              width: 200,
              decoration: ShapeDecoration(
                color: Colors.orange,
                shape: StadiumBorder(
                  side: BorderSide(color: Colors.black, width: 2),
                ),
              ),
              child: Icon(Icons.sunny),
            ),
          ),
          SimpleDialog(
            title: Text(
              "Be careful!",
              textAlign: TextAlign.center,
            ),
            children: <Widget>[
              Text(
                "If you write a message, you should care about the message.",
                textAlign: TextAlign.center,
              ),
            ],
            backgroundColor: Colors.blue,
            elevation: 4,
            shape: StadiumBorder(
              side: BorderSide(
                style: BorderStyle.none,
              ),
            ),
          )
        ],
      ),
    );
    ;
    // return        SettingsList(
    //   sections: [
    //     SettingsSection(
    //       title: Text('Common'),
    //       tiles: <SettingsTile>[
    //         SettingsTile.navigation(
    //           leading: Icon(Icons.language),
    //           title: Text('Language'),
    //           value: Text('English'),
    //         ),
    //         SettingsTile.switchTile(
    //           onToggle: (value) {},
    //           initialValue: true,
    //           leading: Icon(Icons.format_paint),
    //           title: Text('Enable custom theme'),
    //         ),
    //       ],
    //     ),
    //   ],
    // );
  }
}
