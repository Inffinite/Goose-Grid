import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goosegrid/Functions.dart';

class TransactionCard extends StatefulWidget {
  final e;
  final List data;

  const TransactionCard({
    super.key,
    required this.e,
    required this.data,
  });

  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  var clipboardMessage = 'Copy Token';

  infoModal(context, date, units, paidAmount, charges, tokenAmount, token) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(15.0),
      )),
      isScrollControlled: true,
      backgroundColor: const Color(0xff606F49),
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, StateSetter setState) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 30.0,
                        height: 4.0,
                        margin: const EdgeInsets.only(top: 15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          color: const Color(0xffE9F5DB),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        '$date',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xffE9F5DB),
                          fontSize: 14.0,
                          fontFamily: 'SFBOLD',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 15.0,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xff556340),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Text(
                        token,
                        style: TextStyle(
                          letterSpacing: 1.5,
                          fontFamily: 'SFMEDIUM',
                          color: const Color(0xffE9F5DB).withOpacity(0.8),
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    width: double.infinity,
                    // margin: const EdgeInsets.only(
                    //   bottom: 20.0,
                    // ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0.0,
                      vertical: 10.0,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xffE9F5DB),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'UNITS',
                                    style: TextStyle(
                                      fontFamily: 'SFREGULAR',
                                      fontSize: 12.0,
                                      color: Color(0xff606F49),
                                    ),
                                  ),
                                  Text(
                                    '$units',
                                    style: const TextStyle(
                                      fontFamily: 'SFBOLD',
                                      color: Color(0xff606F49),
                                      fontSize: 25.0,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Text(
                                    'PAID AMOUNT',
                                    style: TextStyle(
                                      fontFamily: 'SFREGULAR',
                                      fontSize: 12.0,
                                      color: Color(0xff606F49),
                                    ),
                                  ),
                                  Text(
                                    '$paidAmount',
                                    style: const TextStyle(
                                      fontFamily: 'SFBOLD',
                                      color: Color(0xff606F49),
                                      fontSize: 25.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: const Color(0xff606F49).withOpacity(0.2),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'OTHER CHARGES',
                                    style: TextStyle(
                                      fontFamily: 'SFREGULAR',
                                      fontSize: 12.0,
                                      color: Color(0xff606F49),
                                    ),
                                  ),
                                  Text(
                                    '$charges',
                                    style: const TextStyle(
                                      fontFamily: 'SFBOLD',
                                      color: Color(0xff606F49),
                                      fontSize: 25.0,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Text(
                                    'AMOUNT USED',
                                    style: TextStyle(
                                      fontFamily: 'SFREGULAR',
                                      fontSize: 12.0,
                                      color: Color(0xff606F49),
                                    ),
                                  ),
                                  Text(
                                    '$tokenAmount',
                                    style: const TextStyle(
                                      fontFamily: 'SFBOLD',
                                      color: Color(0xff606F49),
                                      fontSize: 25.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    width: double.infinity,
                    child: CupertinoButton(
                      color: const Color(0xffE9F5DB),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            CupertinoIcons.doc_on_clipboard,
                            color: Color(0xff606F49),
                            size: 15.0,
                          ),
                          const SizedBox(width: 10.0),
                          Text(
                            clipboardMessage,
                            style: const TextStyle(
                              fontFamily: 'SFBOLD',
                              fontSize: 16.0,
                              color: Color(0xff606F49),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: token));
                        setState(() {
                          clipboardMessage = 'Copied';
                        });

                        var timer = Timer(
                          const Duration(seconds: 2),
                          () => setState(() {
                            clipboardMessage = 'Copy Token';
                          }),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 0.0),
        padding: const EdgeInsets.only(bottom: 10.0),
        decoration: const BoxDecoration(
          color: Color(0xffE9F5DB),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5.0),
            topRight: Radius.circular(5.0),
          ),
        ),
        child: Column(
          children: [
            for (Map<String, dynamic> item in widget.e)
              InkWell(
                onTap: () {
                  infoModal(
                    context,
                    formatDate(item['date'].toString()),
                    getUnits(item['body']),
                    getCashAmount(item['body']),
                    getOtherCharges(item['body']),
                    getTokenAmount(item['body']),
                    getToken(item['body']),
                  );
                },
                child: Container(
                  width: double.infinity,
                  // margin: const EdgeInsets.only(
                  //   bottom: 20.0,
                  // ),
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  decoration: const BoxDecoration(
                    color: Color(0xffE9F5DB),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(
                        color: Color(0x42556340),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        child: Text(
                          '${formatDate(item['date'].toString())}',
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            color: Color(0xff606F49),
                            fontSize: 11.0,
                            fontFamily: 'SFBOLD',
                          ),
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'UNITS',
                                    style: TextStyle(
                                      fontFamily: 'SFREGULAR',
                                      fontSize: 13.0,
                                      color: Color(0xff606F49),
                                    ),
                                  ),
                                  Text(
                                    '${getUnits(
                                      item['body'],
                                    )}',
                                    style: const TextStyle(
                                      fontFamily: 'SFBOLD',
                                      color: Color(0xff606F49),
                                      fontSize: 24.0,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Text(
                                    'PAID AMOUNT',
                                    style: TextStyle(
                                      fontFamily: 'SFREGULAR',
                                      fontSize: 13.0,
                                      color: Color(0xff606F49),
                                    ),
                                  ),
                                  Text(
                                    '${getCashAmount(
                                      item['body'],
                                    )}',
                                    style: const TextStyle(
                                      fontFamily: 'SFBOLD',
                                      color: Color(0xff606F49),
                                      fontSize: 24.0,
                                    ),
                                  ),
                                ],
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ));
  }
}
