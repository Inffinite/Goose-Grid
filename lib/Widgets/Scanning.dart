import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Scanning extends StatelessWidget {
  const Scanning({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 40,
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
              width: MediaQuery.of(context).size.width - 40,
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
    );
  }
}
