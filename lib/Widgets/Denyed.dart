import 'package:flutter/cupertino.dart';

class Denyed extends StatelessWidget {
  const Denyed({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
