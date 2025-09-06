import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goosegrid/Functions.dart';
import 'package:goosegrid/Pages/Insight.dart';
import 'package:goosegrid/Pages/Settings.dart';
import 'package:goosegrid/Riverpod/riverpod.dart';
import 'package:goosegrid/Widgets/TransactionCard.dart';
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
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  timeModal(context) {
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
                    child: const Center(
                      child: Text(
                        'Pick a timeline',
                        style: TextStyle(
                          fontFamily: 'SFBOLD',
                          fontSize: 16.0,
                          color: Color(0xffE9F5DB),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Column(
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(5.0),
                        onTap: () {
                          setState(() {
                            ref.read(goosegridState).changeTotalType();
                          });
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 0.0,
                            vertical: 15.0,
                          ),
                          decoration: BoxDecoration(
                            color: ref.watch(goosegridState).totalType == 0
                                ? const Color(0xffE9F5DB)
                                : const Color(0xffE9F5DB).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Center(
                              child: Text(
                            'This Month',
                            style: TextStyle(
                              fontFamily: 'SFMEDIUM',
                              fontSize: 16.0,
                              color: ref.watch(goosegridState).totalType == 0
                                  ? const Color(0xff606F49)
                                  : const Color(0xffE9F5DB),
                            ),
                          )),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      InkWell(
                        borderRadius: BorderRadius.circular(5.0),
                        onTap: () {
                          setState(() {
                            ref.read(goosegridState).changeTotalType();
                          });
                          Navigator.pop(context);
                        },
                        child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 0.0,
                              vertical: 15.0,
                            ),
                            decoration: BoxDecoration(
                              color: ref.watch(goosegridState).totalType == 1
                                  ? const Color(0xffE9F5DB)
                                  : const Color(0xffE9F5DB).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Center(
                                child: Text(
                              'This Year',
                              style: TextStyle(
                                fontFamily: 'SFMEDIUM',
                                fontSize: 16.0,
                                color: ref.watch(goosegridState).totalType == 1
                                    ? const Color(0xff606F49)
                                    : const Color(0xffE9F5DB),
                              ),
                            ))),
                      ),
                    ],
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
            surfaceTintColor: Colors.black,
            // leading: Container(
            //   margin: const EdgeInsets.only(left: 15.0),
            //   child: IconButton(
            //     highlightColor: Colors.transparent,
            //     padding: const EdgeInsets.all(10.0),
            //     onPressed: () {
            //       // Navigator.pop(context);
            //     },
            //     icon: const Icon(
            //       CupertinoIcons.bolt_fill,
            //       size: 24.0,
            //       color: Color(0xffE9F5DB),
            //     ),
            //   ),
            // ),
            leading: Container(),
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 15.0),
                child: IconButton(
                  highlightColor: Colors.transparent,
                  padding: const EdgeInsets.all(5.0),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Settings(),
                      ),
                    );
                  },
                  icon: const Icon(
                    CupertinoIcons.settings_solid,
                    color: Color(0xffE9F5DB),
                  ),
                ),
              ),
            ],
            backgroundColor: const Color(0xff606F49),
            title: const Text(
              "Goose Grid",
              style: TextStyle(
                fontSize: 18.0,
                color: Color(0xffE9F5DB),
                fontFamily: 'SFBOLD',
              ),
            ),
            centerTitle: true,
          ),
          // bottomNavigationBar: NavigationBarTheme(
          //   data: NavigationBarThemeData(
          //     labelTextStyle: WidgetStateProperty.all(
          //       const TextStyle(
          //           color: Color(0xffE9F5DB),
          //           fontSize: 12.0,
          //           fontFamily: 'SFBOLD'),
          //     ),
          //   ),
          //   child: NavigationBar(
          //     selectedIndex: selectedPage,
          //     onDestinationSelected: (int index) {
          //       setState(() {
          //         selectedPage = index;
          //       });
          //     },
          //     indicatorColor: const Color(0xffE9F5DB),
          //     backgroundColor: const Color(0xff606F49),
          //     destinations: [
          //       NavigationDestination(
          //         selectedIcon: const Icon(
          //           Icons.change_history_rounded,
          //           color: Color(0xff606F49),
          //         ),
          //         icon: Icon(Icons.change_history_outlined,
          //             color: const Color(0xffE9F5DB).withOpacity(0.5)),
          //         label: 'Transactions',
          //       ),
          //       NavigationDestination(
          //         selectedIcon: const Icon(
          //           Icons.dashboard,
          //           color: Color(0xff606F49),
          //         ),
          //         icon: Icon(Icons.dashboard_outlined,
          //             color: const Color(0xffE9F5DB).withOpacity(0.5)),
          //         label: 'Insights',
          //       ),
          //     ],
          //   ),
          // ),
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 15.0,
                ),
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
                                ref.watch(goosegridState).totalType == 1
                                    ? '${formatCashAmount(ref.watch(goosegridState).powerSpendingThisYear)}'
                                    : '${formatCashAmount(ref.watch(goosegridState).powerSpendingThisMonth)}',
                                style: const TextStyle(
                                  fontSize: 45.0,
                                  color: Color(0xffE9F5DB),
                                  fontFamily: 'SFBOLD',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          InkWell(
                            borderRadius: BorderRadius.circular(50.0),
                            onTap: () {
                              timeModal(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 5.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: const Color(0xffE9F5DB).withOpacity(0.1),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    ref.watch(goosegridState).totalType == 0
                                        ? 'This Month'
                                        : 'This Year',
                                    style: const TextStyle(
                                      fontSize: 12.0,
                                      color: Color(0xffE9F5DB),
                                      fontFamily: 'SFBOLD',
                                    ),
                                  ),
                                  const SizedBox(width: 5.0),
                                  const Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 25.0,
                                    color: Color(0xffE9F5DB),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 30.0),
                          ref.watch(goosegridState).powerMessagesByMonth.isEmpty
                              ? const Text('Empty')
                              : Column(
                                  children: [
                                    for (var e in ref
                                        .watch(goosegridState)
                                        .powerMessagesByMonth)
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 20.0),
                                        padding: const EdgeInsets.all(0.0),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Colors.white,
                                              Colors.white.withOpacity(0.0)
                                            ],
                                          ),
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
                                              decoration: const BoxDecoration(
                                                color: Color(0xffE9F5DB),
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
                                                  fontSize: 12.0,
                                                  fontFamily: 'SFBOLD',
                                                ),
                                              ),
                                            ),
                                            TransactionCard(
                                              e: e,
                                              data: ref
                                                  .watch(goosegridState)
                                                  .powerMessagesByMonth,
                                            ),
                                            Container(
                                              width: double.infinity,
                                              // height: 30.0,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15.0),
                                              decoration: const BoxDecoration(
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
                                                            color: Colors.white
                                                                .withOpacity(
                                                              0.5,
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          '${calculateTotalUnits(e)}',
                                                          style:
                                                              const TextStyle(
                                                            fontFamily:
                                                                'SFBOLD',
                                                            color: Colors.white,
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
                                                            color: Colors.white
                                                                .withOpacity(
                                                              0.5,
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          '${calculateTotalSpendings(e)}',
                                                          style:
                                                              const TextStyle(
                                                            fontFamily:
                                                                'SFBOLD',
                                                            color: Colors.white,
                                                            fontSize: 22.0,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
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
                        // height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: const Insight(),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
