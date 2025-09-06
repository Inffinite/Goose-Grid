import 'package:flutter/cupertino.dart';

class AskForAccess extends StatelessWidget {
  final VoidCallback allow;
  final VoidCallback deny;

  const AskForAccess({
    super.key,
    required this.allow,
    required this.deny,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Icon(
            CupertinoIcons.chat_bubble_2_fill,
            size: 60.0,
            color: Color(0xffebe6e0),
          ),
          const SizedBox(height: 10.0),
          const Text(
            "Messages",
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
              "This app needs access to your KPLC messages to be able to analyze your transactions.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'SFREGULAR',
                fontSize: 16.0,
                color: Color(0xffebe6e0),
              ),
            ),
          ),
          const SizedBox(height: 30.0),
          CupertinoButton(
            borderRadius: BorderRadius.circular(50.0),
            color: const Color(0xffebe6e0),
            onPressed: allow,
            child: const Text(
              "Allow Access",
              style: TextStyle(
                color: Color(0xff606F49),
                fontFamily: 'SFBOLD',
                fontSize: 16.0,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          CupertinoButton(
            borderRadius: BorderRadius.circular(50.0),
            onPressed: deny,
            // color: Color(0xffebe6e0),
            child: const Text(
              "Deny Access",
              style: TextStyle(
                color: Color(0xffebe6e0),
                fontFamily: 'SFBOLD',
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
