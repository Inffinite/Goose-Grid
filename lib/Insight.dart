import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Insight extends ConsumerStatefulWidget {
  const Insight({
    super.key,
  });

  @override
  ConsumerState<Insight> createState() => _InsightState();
}

class _InsightState extends ConsumerState<Insight> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Disposing - insight");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          CupertinoIcons.bolt_fill,
          size: 120.0,
          color: Color(0xffE9F5DB),
        ),
        SizedBox(height: 30.0),
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 15.0),
          padding: EdgeInsets.all(18.0),
          decoration: BoxDecoration(
            color: Color(0xffE9F5DB).withOpacity(0.1),
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: Color(0xffE9F5DB).withOpacity(0.06),
              width: 2.0,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "UNITS PER DAY",
                    style: TextStyle(
                      fontSize: 10.0,
                      fontFamily: 'SFREGULAR',
                      color: Color(0xffE9F5DB).withOpacity(0.6),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        CupertinoIcons.bolt_fill,
                        size: 20.0,
                        color: Color(0xffE9F5DB).withOpacity(0.5),
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        "345",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontFamily: 'SFBOLD',
                          color: Color(0xffE9F5DB),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                height: 40.0,
                width: 2.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Color(0xffE9F5DB).withOpacity(0.2),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "UNITS PER DAY",
                    style: TextStyle(
                      fontSize: 10.0,
                      fontFamily: 'SFREGULAR',
                      color: Color(0xffE9F5DB).withOpacity(0.6),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        CupertinoIcons.bolt_fill,
                        size: 20.0,
                        color: Color(0xffE9F5DB).withOpacity(0.5),
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        "345",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontFamily: 'SFBOLD',
                          color: Color(0xffE9F5DB),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
