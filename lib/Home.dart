import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goosegrid/Functions.dart';
import 'package:goosegrid/riverpod.dart';
import 'package:intl/intl.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  int selectedPage = 0;
  List<String> dates = [];
  List<String> months = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          systemNavigationBarContrastEnforced: false,
          systemNavigationBarColor: Color(0xff606F49),
          systemNavigationBarDividerColor: Color(0xff606F49),
          statusBarColor: Color(0xff606F49),
        ),
        child: Scaffold(
          backgroundColor: const Color(0xff606F49),
          appBar: AppBar(
            leading: Container(),
            // actions: [
            //   IconButton(onPressed: (){}, icon: icon)
            // ],
            backgroundColor: const Color(0xff606F49),
            title: InkWell(
              onTap: () {
                // arrangeMessagesByDay();
                // arrangeMessagesByMonth();
              },
              child: const Text(
                "GOOSE GRID",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color(0xffE9F5DB),
                  fontFamily: 'SFBOLD',
                ),
              ),
            ),
            centerTitle: true,
          ),
          bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
              labelTextStyle: WidgetStateProperty.all(
                const TextStyle(
                    color: Color(0xffE9F5DB),
                    fontSize: 12.0,
                    fontFamily: 'SFBOLD'),
              ),
            ),
            child: NavigationBar(
              selectedIndex: selectedPage,
              onDestinationSelected: (int index) {
                setState(() {
                  selectedPage = index;
                });
              },
              indicatorColor: const Color(0xffE9F5DB),
              backgroundColor: const Color(0xff606F49),
              destinations: [
                NavigationDestination(
                  selectedIcon: const Icon(
                    Icons.change_history_rounded,
                    color: Color(0xff606F49),
                  ),
                  icon: Icon(Icons.change_history_outlined,
                      color: const Color(0xffE9F5DB).withOpacity(0.5)),
                  label: 'Transactions',
                ),
                NavigationDestination(
                  selectedIcon: const Icon(
                    Icons.dashboard,
                    color: Color(0xff606F49),
                  ),
                  icon: Icon(Icons.dashboard_outlined,
                      color: const Color(0xffE9F5DB).withOpacity(0.5)),
                  label: 'Insights',
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 15.0),
                child: selectedPage == 0
                    ? Column(
                        children: [
                          const Text(
                            'TOTAL SPENT',
                            style: TextStyle(
                                fontSize: 12.0,
                                color: Color(0xffE9F5DB),
                                fontFamily: 'SFREGULAR'),
                          ),
                          const SizedBox(height: 5.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'KES',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color:
                                      const Color(0xffE9F5DB).withOpacity(0.5),
                                  fontFamily: 'SFBOLD',
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              Text(
                                '${formatCashAmount(ref.watch(goosegridState).powerSpendingThisMonth)}',
                                style: const TextStyle(
                                  fontSize: 45.0,
                                  color: Color(0xffE9F5DB),
                                  fontFamily: 'SFBOLD',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15.0),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: const Color(0xffE9F5DB).withOpacity(0.15),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'THIS MONTH',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Color(0xffE9F5DB),
                                    fontFamily: 'SFBOLD',
                                  ),
                                ),
                                // SizedBox(width: 5.0),
                                // Icon(
                                //   Icons.keyboard_arrow_down,
                                //   size: 25.0,
                                //   color: Color(0xff606F49),
                                // ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30.0),
                          // Column(
                          //   children: [
                          //     ref.watch(goosegridState).messages.isNotEmpty
                          //         ? ListView.builder(
                          //             physics:
                          //                 const NeverScrollableScrollPhysics(),
                          //             shrinkWrap: true,
                          //             itemCount: ref
                          //                 .watch(goosegridState)
                          //                 .messages
                          //                 .length,
                          //             itemBuilder: (context, i) {
                          //               return ref
                          //                           .watch(goosegridState)
                          //                           .messages[i]
                          //                           .body
                          //                           .toString()[0] ==
                          //                       "M"
                          //                   ? Container(
                          //                       margin: const EdgeInsets.only(
                          //                           bottom: 15.0),
                          //                       // padding: EdgeInsets.all(15.0),
                          //                       decoration: BoxDecoration(
                          // color:
                          //     const Color(0xffE9F5DB),
                          //                         borderRadius:
                          //                             BorderRadius.circular(
                          //                                 10.0),
                          //                       ),
                          //                       child: Column(
                          //                         crossAxisAlignment:
                          //                             CrossAxisAlignment.start,
                          //                         children: [
                          //                           const SizedBox(
                          //                               height: 15.0),
                          //                           Padding(
                          //                             padding: const EdgeInsets
                          //                                 .symmetric(
                          //                               horizontal: 20.0,
                          //                             ),
                          //                             child: Text(
                          // '${formatDate(
                          //   ref
                          //       .watch(
                          //           goosegridState)
                          //       .messages[i]
                          //       .date
                          //       .toString(),
                          // )}',
                          //                               style: const TextStyle(
                          //                                 color:
                          //                                     Color(0xff606F49),
                          //                                 fontSize: 12.0,
                          //                                 fontFamily:
                          //                                     'SFREGULAR',
                          //                               ),
                          //                             ),
                          //                           ),
                          //                           const SizedBox(height: 8.0),
                          //                           Container(
                          //                             width: double.infinity,
                          //                             height: 1.0,
                          //                             color: const Color(
                          //                                     0xff606F49)
                          //                                 .withOpacity(0.3),
                          //                           ),
                          //                           const SizedBox(height: 8.0),
                          //                           Padding(
                          //                             padding: const EdgeInsets
                          //                                 .symmetric(
                          //                               horizontal: 20.0,
                          //                             ),
                          //                             child: Row(
                          //                               mainAxisAlignment:
                          //                                   MainAxisAlignment
                          //                                       .spaceBetween,
                          //                               children: [
                          //                                 Column(
                          //                                   // mainAxisAlignment:
                          //                                   //     MainAxisAlignment.spaceBetween,
                          //                                   crossAxisAlignment:
                          //                                       CrossAxisAlignment
                          //                                           .start,
                          //                                   children: [
                          //                                     const Text(
                          //                                       'UNITS',
                          //                                       style:
                          //                                           TextStyle(
                          //                                         color: Color(
                          //                                             0xff606F49),
                          //                                         fontSize:
                          //                                             12.0,
                          //                                         fontFamily:
                          //                                             'SFREGULAR',
                          //                                       ),
                          //                                     ),
                          //                                     Text(
                          // '${getUnits(
                          //   ref
                          //       .watch(
                          //           goosegridState)
                          //       .messages[
                          //           i]
                          //       .body
                          //       .toString(),
                          // )}',
                          //                                       style:
                          //                                           const TextStyle(
                          //                                         color: Color(
                          //                                             0xff606F49),
                          //                                         fontSize:
                          //                                             25.0,
                          //                                         fontFamily:
                          //                                             'SFBOLD',
                          //                                       ),
                          //                                     ),
                          //                                   ],
                          //                                 ),
                          //                                 Column(
                          //                                   // mainAxisAlignment:
                          //                                   //     MainAxisAlignment.spaceBetween,
                          //                                   crossAxisAlignment:
                          //                                       CrossAxisAlignment
                          //                                           .end,
                          //                                   children: [
                          //                                     const Text(
                          //                                       'PAID AMOUNT',
                          //                                       style:
                          //                                           TextStyle(
                          //                                         color: Color(
                          //                                             0xff606F49),
                          //                                         fontSize:
                          //                                             12.0,
                          //                                         fontFamily:
                          //                                             'SFREGULAR',
                          //                                       ),
                          //                                     ),
                          //                                     Text(
                          // '${getCashAmount(
                          //   ref
                          //       .watch(
                          //           goosegridState)
                          //       .messages[
                          //           i]
                          //       .body
                          //       .toString(),
                          // )}',
                          //                                       style:
                          //                                           const TextStyle(
                          //                                         color: Color(
                          //                                             0xff606F49),
                          //                                         fontSize:
                          //                                             25.0,
                          //                                         fontFamily:
                          //                                             'SFBOLD',
                          //                                       ),
                          //                                     ),
                          //                                   ],
                          //                                 ),
                          //                               ],
                          //                             ),
                          //                           ),
                          //                           // Text(
                          //                           //   '${getMeterNumber(
                          //                           //     powerMessages[i].body.toString(),
                          //                           //   )}',
                          //                           // ),
                          //                           // Text(
                          //                           //   '${getToken(
                          //                           //     powerMessages[i].body.toString(),
                          //                           //   )}',
                          //                           // ),

                          //                           // Text(
                          //                           // '${getUnits(
                          //                           //   powerMessages[i].body.toString(),
                          //                           // )}',
                          //                           // ),
                          //                           // Text(
                          //                           // '${getCashAmount(
                          //                           //   powerMessages[i].body.toString(),
                          //                           // )}',
                          //                           // ),

                          //                           // Text(
                          //                           //   '${getOtherCharges(
                          //                           //     powerMessages[i].body.toString(),
                          //                           //   )}',
                          //                           // ),
                          //                           const SizedBox(
                          //                               height: 10.0),
                          //                         ],
                          //                       ),
                          //                     )
                          //                   : Container();
                          //             },
                          //           )
                          //         : Container(
                          //             margin: const EdgeInsets.only(top: 200.0),
                          //             width: MediaQuery.of(context).size.width -
                          //                 40,
                          //             // height: 300.0,
                          //             child: const Column(
                          //               children: [
                          //                 // Center(
                          //                 //   child: RiveAnimation.asset(
                          //                 //     'assets/scan.riv',
                          //                 //   ),
                          //                 // ),
                          //                 Center(
                          //                   child: Text(
                          //                     "Scanning...",
                          //                     style: TextStyle(
                          //                         color: Color(0xffE9F5DB),
                          //                         fontSize: 16.0,
                          //                         fontFamily: 'SFBOLD'),
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
                          //           ),
                          //   ],
                          // ),
                          // const SizedBox(height: 10.0),

                          ref.watch(goosegridState).powerMessagesByMonth.isEmpty
                              ? Text('Empty')
                              : Column(
                                  children: [
                                    for (var e in ref
                                        .watch(goosegridState)
                                        .powerMessagesByMonth)
                                      Container(
                                        margin: EdgeInsets.only(bottom: 20.0),
                                        padding: EdgeInsets.all(0.0),
                                        decoration: BoxDecoration(
                                          color: Color(0xffE9F5DB),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0,
                                                  left: 20.0,
                                                  right: 20.0,
                                                  bottom: 0.0),
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: const Color(0xffE9F5DB),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5.0),
                                                  topRight:
                                                      Radius.circular(5.0),
                                                ),
                                              ),
                                              child: Text(
                                                '${calculateMonth(e)}',
                                                textAlign: TextAlign.start,
                                                style: const TextStyle(
                                                  color: Color(0xff606F49),
                                                  fontSize: 14.0,
                                                  fontFamily: 'SFBOLD',
                                                ),
                                              ),
                                            ),
                                            TransactionCard(
                                                e: e,
                                                data: ref
                                                    .watch(goosegridState)
                                                    .powerMessagesByMonth),
                                            Container(
                                              width: double.infinity,
                                              // height: 30.0,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 15.0),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(5.0),
                                                  bottomLeft:
                                                      Radius.circular(5.0),
                                                ),
                                                color: Color(0xff556340),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 20.0,
                                                ),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'TOTAL UNITS',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'SFREGULAR',
                                                              fontSize: 12.0,
                                                              color: Colors
                                                                  .white
                                                                  .withOpacity(
                                                                0.5,
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            '${calculateTotalUnits(e)}',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'SFBOLD',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 22.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            'TOTAL SPENT',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'SFREGULAR',
                                                              fontSize: 12.0,
                                                              color: Colors
                                                                  .white
                                                                  .withOpacity(
                                                                0.5,
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            '${calculateTotalSpendings(e)}',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'SFBOLD',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 22.0,
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ]),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                        ],
                      )
                    : SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "This page is under construction",
                              style: TextStyle(
                                  color: Color(0xffE9F5DB),
                                  fontSize: 16.0,
                                  fontFamily: 'SFBOLD'),
                            ),
                          ],
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TransactionCard extends StatefulWidget {
  final e;
  final List data;

  const TransactionCard({
    required this.e,
    required this.data,
  });

  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  infoModal(context, date, units, paidAmount, charges, tokenAmount) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(15.0),
      )),
      isScrollControlled: true,
      backgroundColor: Color(0xff606F49),
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
                        margin: EdgeInsets.only(top: 15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          color: Color(0xffE9F5DB),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        '${date}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xffE9F5DB),
                          fontSize: 14.0,
                          fontFamily: 'SFBOLD',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
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
                                  Text(
                                    'UNITS',
                                    style: TextStyle(
                                      fontFamily: 'SFREGULAR',
                                      fontSize: 12.0,
                                      color: Color(0xff606F49),
                                    ),
                                  ),
                                  Text(
                                    '${units}',
                                    style: TextStyle(
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
                                  Text(
                                    'PAID AMOUNT',
                                    style: TextStyle(
                                      fontFamily: 'SFREGULAR',
                                      fontSize: 12.0,
                                      color: Color(0xff606F49),
                                    ),
                                  ),
                                  Text(
                                    '${paidAmount}',
                                    style: TextStyle(
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
                          color: Color(0xff606F49).withOpacity(0.2),
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
                                  Text(
                                    'OTHER CHARGES',
                                    style: TextStyle(
                                      fontFamily: 'SFREGULAR',
                                      fontSize: 12.0,
                                      color: Color(0xff606F49),
                                    ),
                                  ),
                                  Text(
                                    '${charges}',
                                    style: TextStyle(
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
                                  Text(
                                    'AMOUNT USED',
                                    style: TextStyle(
                                      fontFamily: 'SFREGULAR',
                                      fontSize: 12.0,
                                      color: Color(0xff606F49),
                                    ),
                                  ),
                                  Text(
                                    '${tokenAmount}',
                                    style: TextStyle(
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
        margin: EdgeInsets.only(bottom: 0.0),
        padding: const EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
          color: const Color(0xffE9F5DB),
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
                  );
                },
                child: Container(
                  width: double.infinity,
                  // margin: const EdgeInsets.only(
                  //   bottom: 20.0,
                  // ),
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  decoration: BoxDecoration(
                    color: const Color(0xffE9F5DB),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(
                        color: Color.fromARGB(66, 85, 99, 64),
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
                            fontSize: 12.0,
                            fontFamily: 'SFBOLD',
                          ),
                        ),
                      ),
                      SizedBox(height: 5.0),
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
                                  Text(
                                    'UNITS',
                                    style: TextStyle(
                                      fontFamily: 'SFREGULAR',
                                      fontSize: 12.0,
                                      color: Color(0xff606F49),
                                    ),
                                  ),
                                  Text(
                                    '${getUnits(
                                      item['body'],
                                    )}',
                                    style: TextStyle(
                                      fontFamily: 'SFBOLD',
                                      color: Color(0xff606F49),
                                      fontSize: 22.0,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'PAID AMOUNT',
                                    style: TextStyle(
                                      fontFamily: 'SFREGULAR',
                                      fontSize: 12.0,
                                      color: Color(0xff606F49),
                                    ),
                                  ),
                                  Text(
                                    '${getCashAmount(
                                      item['body'],
                                    )}',
                                    style: TextStyle(
                                      fontFamily: 'SFBOLD',
                                      color: Color(0xff606F49),
                                      fontSize: 22.0,
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
