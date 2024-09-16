import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 40,
      height: 300.0,
      child: const Center(
        child: RiveAnimation.asset(
          'assets/scan.riv',
        ),
      ),
    );
  }
}
