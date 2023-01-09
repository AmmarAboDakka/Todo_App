import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/lang&theme.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LathProvider>(context);
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Text(AppLocalizations.of(context)!.lang,
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.start),
          SizedBox(
            height: 20,
          ),
          PopupMenuButton<int>(
            itemBuilder: (context) => [
              PopupMenuItem(
                onTap: () {
                  provider.chooselanguge('en');
                },
                value: 1,
                child: Text(
                  textAlign: TextAlign.center,
                  "English",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w700),
                ),
              ),
              PopupMenuItem(
                onTap: () {
                  provider.chooselanguge('ar');
                },
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
                  side: BorderSide(color: Colors.white, width: 2),
                ),
              ),
              child: Icon(
                Icons.language,
                color: Colors.white,
              ),
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
                  side: BorderSide(color: Colors.white, width: 2),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.sunny, color: Colors.white),
                  Icon(
                    Icons.dark_mode,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
