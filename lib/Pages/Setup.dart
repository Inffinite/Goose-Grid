import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:goosegrid/Widgets/AskForAccess.dart';
import 'package:goosegrid/Pages/Home.dart';
import 'package:goosegrid/Widgets/Denyed.dart';
import 'package:goosegrid/Widgets/Loading.dart';
import 'package:goosegrid/Widgets/Scanning.dart';
import 'package:goosegrid/Riverpod/riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

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
    ref.read(goosegridState).arrangeMessagesByYear();
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
    ref.read(goosegridState).arrangeMessagesByYear();

    return true;
  }

  checkPermission() async {
    PermissionStatus status = await Permission.sms.status;

    if (status == PermissionStatus.granted) {
      await getData();
      Timer(
        const Duration(seconds: 10),
        () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Home(),
          ),
        ),
      );

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
            proceed == false ? const Loading() : Container(),
            denyed == true && proceed == true
                ? const Denyed()
                : permissionGranted == false && proceed == true
                    ? AskForAccess(
                        allow: () {
                          handlePermissions();
                        },
                        deny: () {
                          setState(() {
                            denyed = true;
                          });
                        },
                      )
                    : proceed == true
                        ? const Scanning()
                        : Container(),
          ],
        ),
      ),
    );
  }
}
