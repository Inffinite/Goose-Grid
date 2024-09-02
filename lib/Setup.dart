import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:goosegrid/Home.dart';
import 'package:goosegrid/riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rive/rive.dart';

class Setup extends ConsumerStatefulWidget {
  const Setup({super.key});

  @override
  ConsumerState<Setup> createState() => _SetupState();
}

class _SetupState extends ConsumerState<Setup> {
  bool permissionGranted = false;
  bool denyed = false;
  bool proceed = false;
  List<SmsMessage> powerMessages = [];

  getMyMessages() async {
    SmsQuery query = SmsQuery();
    List<SmsMessage> messages = await query.getAllSms;

    for (int i = 0; i < messages.length; i++) {
      SmsMessage message = messages[i];
      // print('Index: $i');
      // print('Address: ${message.address}');
      // print('Kind: ${message.kind}');

      if (message.kind == SmsMessageKind.received) {
        if (message.address == 'KENYA POWER') {
          // print('Message: ${message.body}');
          setState(() {
            powerMessages.add(messages[i]);
          });
        }
      }
    }

    log('FETCHED: ${powerMessages.length} kplc messages');
    ref.read(goosegridState).arrangeMessagesByMonth();
  }

  getData() async {
    SmsQuery query = SmsQuery();
    List<SmsMessage> messages = await query.getAllSms;

    for (int i = 0; i < messages.length; i++) {
      SmsMessage message = messages[i];

      if (message.kind == SmsMessageKind.received) {
        if (message.address == 'KENYA POWER') {
          // print('Message: ${message.body}');
          setState(() {
            powerMessages.add(messages[i]);
          });
        }
      }
    }

    ref.read(goosegridState).changeMessages(powerMessages);
    ref.read(goosegridState).arrangeMessagesByMonth();
  }

  checkPermission() async {
    PermissionStatus status = await Permission.sms.status;

    if (status == PermissionStatus.granted) {
      await getData();
      var timer = Timer(
          const Duration(seconds: 8),
          () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Home(),
                ),
              ));

      // setState(() {
      //   permissionGranted = true;
      // });
    } else {
      setState(() {
        permissionGranted = false;
        proceed = true;
      });
    }
  }

  handlePermissions() async {
    PermissionStatus status = await Permission.sms.status;

    if (status == PermissionStatus.granted) {
      log('PERMISSION GRANTED');
      setState(() {
        permissionGranted = true;
      });
    } else {
      log('PERMISSION NOT GRANTED');
      PermissionStatus status = await Permission.sms.request();

      if (status == PermissionStatus.granted) {
        setState(() {
          permissionGranted = true;
        });

        await getData();
        var timer = Timer(
            const Duration(seconds: 8),
            () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Home(),
                  ),
                ));
      } else {
        setState(() {
          denyed = true;
        });
        log('PERMISSION DENIED BY USER');
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkPermission();
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            proceed == false
                ? SizedBox(
                    width: MediaQuery.of(context).size.width - 40,
                    height: 300.0,
                    child: const Center(
                      child: RiveAnimation.asset(
                        'assets/scan.riv',
                      ),
                    ),
                  )
                : Container(),
            denyed == true && proceed == true
                ? Container(
                    child: Center(
                      child: Column(
                        children: [
                          const Icon(
                            CupertinoIcons.circle_fill,
                            size: 80.0,
                            color: Color(0xffebe6e0),
                          ),
                          const SizedBox(height: 20.0),
                          const Text(
                            "Very Well",
                            style: TextStyle(
                              fontFamily: 'SFBOLD',
                              fontSize: 25.0,
                              color: Color(0xffebe6e0),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 40,
                            child: const Text(
                              "Enjoy this meaningless random image of a white circle.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'SFREGULAR',
                                fontSize: 16.0,
                                color: Color(0xffebe6e0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : permissionGranted == false && proceed == true
                    ? Container(
                        child: Center(
                          child: Column(
                            children: [
                              const Icon(
                                CupertinoIcons.chat_bubble_2_fill,
                                size: 60.0,
                                color: Color(0xffebe6e0),
                              ),
                              const SizedBox(height: 10.0),
                              const Text(
                                "Messages",
                                style: TextStyle(
                                  fontFamily: 'SFBOLD',
                                  fontSize: 25.0,
                                  color: Color(0xffebe6e0),
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 40,
                                child: const Text(
                                  "This app needs access to your KPLC messages to be able to analyze your transactions.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'SFREGULAR',
                                    fontSize: 16.0,
                                    color: Color(0xffebe6e0),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30.0),
                              CupertinoButton(
                                borderRadius: BorderRadius.circular(50.0),
                                color: const Color(0xffebe6e0),
                                child: const Text(
                                  "Allow Access",
                                  style: TextStyle(
                                    color: Color(0xff606F49),
                                    fontFamily: 'SFBOLD',
                                    fontSize: 16.0,
                                  ),
                                ),
                                onPressed: () {
                                  handlePermissions();
                                },
                              ),
                              const SizedBox(height: 10.0),
                              CupertinoButton(
                                borderRadius: BorderRadius.circular(50.0),
                                // color: Color(0xffebe6e0),
                                child: const Text(
                                  "Deny Access",
                                  style: TextStyle(
                                    color: Color(0xffebe6e0),
                                    fontFamily: 'SFBOLD',
                                    fontSize: 14.0,
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    denyed = true;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      )
                    : proceed == true
                        ? Container(
                            child: Center(
                              child: Column(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width - 40,
                                    height: 300.0,
                                    child: const Center(
                                      child: RiveAnimation.asset(
                                        'assets/scan.riv',
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "Just a moment",
                                    style: TextStyle(
                                      fontFamily: 'SFBOLD',
                                      fontSize: 25.0,
                                      color: Color(0xffebe6e0),
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width - 40,
                                    child: const Text(
                                      "Scanning transactions...",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'SFREGULAR',
                                        fontSize: 16.0,
                                        color: Color(0xffebe6e0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container(),
          ],
        ),
      ),
    );
  }
}
