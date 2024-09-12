import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Settings extends ConsumerStatefulWidget {
  const Settings({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsState();
}

class _SettingsState extends ConsumerState<Settings> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        systemNavigationBarContrastEnforced: false,
        systemNavigationBarColor: Color(0xff606F49),
        systemNavigationBarDividerColor: Color(0xff606F49),
        statusBarColor: Color(0xff606F49),
      ),
      child: Scaffold(
        backgroundColor: const Color(0xff606F49),
        appBar: AppBar(
          leading: Container(
            margin: const EdgeInsets.only(left: 20.0),
            child: IconButton(
              padding: const EdgeInsets.all(10.0),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                CupertinoIcons.chevron_back,
                size: 24.0,
                color: Color(0xffE9F5DB),
              ),
            ),
          ),
          backgroundColor: const Color(0xff606F49),
          title: InkWell(
            onTap: () {
              // arrangeMessagesByDay();
              // arrangeMessagesByMonth();
            },
            child: const Text(
              "Settings",
              style: TextStyle(
                fontSize: 20.0,
                color: Color(0xffE9F5DB),
                fontFamily: 'SFBOLD',
              ),
            ),
          ),
          centerTitle: true,
        ),
      ),
    );
  }
}
