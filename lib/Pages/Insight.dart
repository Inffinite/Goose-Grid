import 'package:flutter/cupertino.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          CupertinoIcons.bolt_fill,
          size: 120.0,
          color: const Color(0xffE9F5DB).withOpacity(0.5),
        ),
        const SizedBox(height: 30.0),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: const Color(0xffE9F5DB).withOpacity(0.1),
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: const Color(0xffE9F5DB).withOpacity(0.06),
              width: 1.0,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "UNITS USED DAILY",
                    style: TextStyle(
                      fontSize: 10.0,
                      fontFamily: 'SFREGULAR',
                      color: const Color(0xffE9F5DB).withOpacity(0.6),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        CupertinoIcons.bolt_fill,
                        size: 20.0,
                        color: const Color(0xffE9F5DB).withOpacity(0.5),
                      ),
                      const SizedBox(width: 5.0),
                      const Text(
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
                  color: const Color(0xffE9F5DB).withOpacity(0.2),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "MONTHLY SPENDINGS",
                    style: TextStyle(
                      fontSize: 10.0,
                      fontFamily: 'SFREGULAR',
                      color: const Color(0xffE9F5DB).withOpacity(0.6),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        CupertinoIcons.bolt_fill,
                        size: 20.0,
                        color: const Color(0xffE9F5DB).withOpacity(0.5),
                      ),
                      const SizedBox(width: 5.0),
                      const Text(
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
        const SizedBox(height: 10.0),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: const Color(0xffE9F5DB).withOpacity(0.1),
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: const Color(0xffE9F5DB).withOpacity(0.06),
              width: 1.0,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "In September, 2024",
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'SFBOLD',
                  color: Color(0xffE9F5DB),
                ),
              ),
              Text(
                "You used the highest amount of units this year",
                style: TextStyle(
                  fontSize: 12.0,
                  fontFamily: 'SFREGULAR',
                  color: const Color(0xffE9F5DB).withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                "70.5",
                style: TextStyle(
                  fontSize: 50.0,
                  fontFamily: 'SFBOLD',
                  color: Color(0xffE9F5DB),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
