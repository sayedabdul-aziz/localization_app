import 'package:flutter/material.dart';
import 'package:localization_app/shared/app_localizations.dart';
import 'package:localization_app/screens/settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("home".tr(context)),
          centerTitle: true,
          actions: [
            Padding(
                padding: const EdgeInsets.all(10),
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => SettingsScreen()));
                    },
                    icon: const Icon(Icons.settings)))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Center(
              child: Text(
            'welcome_msg'.tr(context),
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
          )),
        ));
  }
}
