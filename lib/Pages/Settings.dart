import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goosegrid/Widgets/SettingsCard.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends ConsumerStatefulWidget {
  const Settings({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsState();
}

class _SettingsState extends ConsumerState<Settings> {
  final Uri _url = Uri.parse(
      'https://doc-hosting.flycricket.io/goose-grid-privacy-policy/4c99a9b7-68a3-4822-9ef4-516ff5a954a8/privacy');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

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
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 15.0,
              ),
              child: Column(
                children: [
                  SettingsCard(
                    icon: CupertinoIcons.briefcase_fill,
                    iconSize: 20.0,
                    settingTitle: 'Privacy policy',
                    settingSubtitle: 'How we handle your data',
                    action: () {
                      _launchUrl();
                    },
                  ),
                  // SettingsCard(
                  //   icon: CupertinoIcons.lock_fill,
                  //   iconSize: 20.0,
                  //   settingTitle: 'About',
                  //   settingSubtitle: 'More information about goose grid',
                  //   action: () {},
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
