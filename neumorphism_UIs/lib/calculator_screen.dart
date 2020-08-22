import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

final Color _calTextColor = Color(0xFF484848);

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return NeumorphicTheme(
      theme: NeumorphicThemeData(
        baseColor: Color(0xFFF4F5F5),
        intensity: 0.8,
        lightSource: LightSource.topLeft,
        variantColor: Colors.red,
        accentColor: Colors.redAccent,
        depth: 4,
      ),
      child: Scaffold(
        body: SafeArea(
          child: NeumorphicBackground(
            child: _PageContent(),
          ),
        ),
      ),
    );
  }
}

class _PageContent extends StatefulWidget {
  @override
  __PageContentState createState() => __PageContentState();
}

class __PageContentState extends State<_PageContent> {
  final buttons = [
    CalcButton("%", textAccent: true),
    CalcButton("^", textAccent: true),
    CalcButton("sqr", textAccent: true),
    CalcButton("C", textAccent: true),
    CalcButton("7"),
    CalcButton("8"),
    CalcButton("9"),
    CalcButton("/", textAccent: true),
    CalcButton("4"),
    CalcButton("5"),
    CalcButton("6"),
    CalcButton("X", textAccent: true),
    CalcButton("1"),
    CalcButton("2"),
    CalcButton("3"),
    CalcButton("-", textAccent: true),
    CalcButton("0"),
    CalcButton("."),
    CalcButton("=", backgroundAccent: true),
    CalcButton("+", textAccent: true),
  ];

  @override
  Widget build(BuildContext context) {
    return NeumorphicBackground(
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: NeumorphicButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.flat,
                        boxShape: NeumorphicBoxShape.circle(),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Icon(
                          Icons.navigate_before,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 50),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Calculator",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      )),
                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: _TopScreenWidget(),
              ),
            ),
            Expanded(
              flex: 2,
              child: GridView.count(
                crossAxisCount: 4,
                padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                children: List.generate(buttons.length, (index) {
                  return WidgetCalcButton(buttons[index]);
                }),
              ),
            ),
            // Row(
            //   children: [
            //     RaisedButton(
            //       onPressed: () {
            //         setState(() {
            //           NeumorphicTheme.of(context).updateCurrentTheme(NeumorphicThemeData(
            //             depth:4,
            //             intensity: 0.8,
            //             accentColor: Colors.cyan,
            //           ));
            //         });
            //       },
            //       child: Text("style 1"),
            //     ),
            //     RaisedButton(
            //       onPressed: () {
            //         setState(() {
            //           NeumorphicTheme.of(context).updateCurrentTheme(NeumorphicThemeData(
            //             depth:4,
            //             intensity: 0.8,
            //             accentColor: Colors.redAccent,
            //           ));
            //         });
            //       },
            //       child: Text("style 2"),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}

class CalcButton {
  final String label;
  final bool textAccent;
  final bool textVariant;
  final bool backgroundAccent;

  CalcButton(this.label,
      {this.textAccent = false,
      this.textVariant = false,
      this.backgroundAccent = false});
}

class WidgetCalcButton extends StatelessWidget {
  final CalcButton button;

  WidgetCalcButton(this.button);

  Color _textColor(BuildContext context) {
    if (button.backgroundAccent) {
      return Colors.white;
    } else if (button.textAccent) {
      return NeumorphicTheme.accentColor(context);
    } else if (button.textVariant) {
      return NeumorphicTheme.variantColor(context);
    } else {
      return _calTextColor;
    }
  }

  Color _backgroundColor(BuildContext context) {
    return button.backgroundAccent
        ? NeumorphicTheme.accentColor(context)
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14),
      child: NeumorphicButton(
        onPressed: () {},
        style: NeumorphicStyle(
            surfaceIntensity: 0.15,
            boxShape: NeumorphicBoxShape.circle(),
            shape: NeumorphicShape.concave,
            color: _backgroundColor(context)),
        child: Center(
          child: Text(
            button.label,
            style: TextStyle(
              fontSize: 24,
              color: _textColor(context),
            ),
          ),
        ),
      ),
    );
  }
}

class _TopScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
        depth: -1 * NeumorphicTheme.of(context).current.depth,
      ),
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "3 x 7 =",
                style: TextStyle(fontSize: 30, color: _calTextColor),
              ),
              Text(
                "21",
                style: TextStyle(fontSize: 56, color: _calTextColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
