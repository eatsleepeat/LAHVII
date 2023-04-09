import 'tags_received.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ChallengePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
//        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: ToggleSwitch(
                  minWidth: 90.0,
                  cornerRadius: 20,
                  activeBgColor: Colors.green,
                  activeTextColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveTextColor: Colors.white,
                  labels: ['  RECEIVED  ', '  SENT  '],
                  icons: [
                    FontAwesomeIcons.envelopeOpen,
                    FontAwesomeIcons.rocket
                  ],
                  onToggle: (index) {
                    print('switched to: $index');
                  }),
            ),
            TagsReceived(),
          ],
        ),
      ),
    );
  }
}
