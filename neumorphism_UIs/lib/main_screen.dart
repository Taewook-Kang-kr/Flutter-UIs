import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'widget/top_bar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphicTheme(
      theme: NeumorphicThemeData(depth: 8),
      darkTheme: NeumorphicThemeData(depth: 8),
      child: Scaffold(
        backgroundColor: NeumorphicColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  TopBar(),
                  _buildButton(
                    text: "Audio Player",
                    onClick: () {
                      Navigator.of(context).pushNamed("/audio");
                    }
                  ),
                  _buildButton(
                    text: "Calculator",
                    onClick: () {
                      Navigator.of(context).pushNamed("/cal");
                    }
                  ),
                  _buildButton(
                    text: "CreditCard",
                    onClick: () {
                      Navigator.of(context).pushNamed("/card");
                    }
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton({String text, VoidCallback onClick}) {
    return NeumorphicButton(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 24
      ),
      style: NeumorphicStyle(
        shape: NeumorphicShape.flat,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12))
      ),
      child: Center(
        child: Text(text),
      ),
      onPressed: onClick,
    );
  }
}
