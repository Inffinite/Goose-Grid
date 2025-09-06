import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goosegrid/Pages/Home.dart';
import 'package:goosegrid/database/database_helper.dart';

class MeterNumber extends StatefulWidget {
  const MeterNumber({super.key});

  @override
  State<MeterNumber> createState() => _MeterNumberState();
}

class _MeterNumberState extends State<MeterNumber> {
  final dbHelper = DatabaseHelper.instance;
  TextEditingController meterNumberController = TextEditingController();

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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: CupertinoTextField(
                controller: meterNumberController,
                cursorColor: Color(0xffE9F5DB),
                clearButtonSemanticLabel: "Clear",
                keyboardType: TextInputType.number,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xff556340),
                ),
                padding: EdgeInsets.all(15.0),
                placeholder: "Your meter number",
                placeholderStyle: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'SFREGULAR',
                  color: Color(0xffE9F5DB).withOpacity(0.5),
                ),
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'SFREGULAR',
                  color: Color(0xffE9F5DB),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: CupertinoButton(
                color: Color(0xffE9F5DB),
                child: Text(
                  "Save",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'SFMEDIUM',
                    color: Color(0xff556340),
                  ),
                ),
                onPressed: () async {
                  await dbHelper.insert(
                      {'meterNumber': meterNumberController.text}, 'meter');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Home(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
