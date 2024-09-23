import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsCard extends StatelessWidget {
  final String settingTitle;
  final String settingSubtitle;
  final double iconSize;
  final IconData icon;
  final VoidCallback action;

  const SettingsCard({
    super.key,
    required this.action,
    required this.icon,
    required this.iconSize,
    required this.settingTitle,
    required this.settingSubtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(10.0),
          onTap: action,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 15.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: const Color(0xff97A97C).withOpacity(0.2),
              // border: Border.all(
              //   color: Color(0xffE9F5DB).withOpacity(0.1), // Set the border color
              //   width: 2.0, // Set the border width
              // ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      icon,
                      size: iconSize,
                      color: const Color(0xffE9F5DB),
                    ),
                    const SizedBox(width: 15.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          settingTitle,
                          style: const TextStyle(
                            color: Color(0xffE9F5DB),
                            fontFamily: 'SFBOLD',
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          settingSubtitle,
                          style: TextStyle(
                            color: const Color(0xffE9F5DB).withOpacity(0.5),
                            fontFamily: 'SFREGULAR',
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(),
              ],
            ),
          ),
        ),
        const SizedBox(height: 15.0),
      ],
    );
  }
}
