import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'dart:ui';
import 'package:flutter/widgets.dart';

class CreditCardScreen extends StatefulWidget {
  @override
  _CreditCardScreenState createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends State<CreditCardScreen> {
  @override
  Widget build(BuildContext context) {
    return NeumorphicTheme(
      theme: NeumorphicThemeData(
        intensity: 0.6,
        lightSource: LightSource.topLeft,
        depth: 5,
      ),
      child: Scaffold(
        body: SafeArea(
          child: _PageContent(),
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
  int _dotIndex = 1;
  bool _useDark = false;

  @override
  Widget build(BuildContext context) {
    return NeumorphicBackground(
      child: Column(
        children: [
          SizedBox(height: 14),
          _buildTopBar(context),
          SizedBox(height: 30),
          Expanded(child: _buildCard(context)),
          SizedBox(height: 30),
          _buildDots(context),
          SizedBox(height: 30),
          _buildBalance(context),
          SizedBox(height: 10),
          _buildIndicator(context),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(alignment: Alignment.centerLeft, children: [
        Align(
          alignment: Alignment.centerLeft,
          child: NeumorphicButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: NeumorphicStyle(
              shape: NeumorphicShape.flat,
              boxShape: NeumorphicBoxShape.circle(),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.navigate_before,
                  color: _useDark ? Colors.white : Colors.black),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            "Credit Card",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: _useDark ? Colors.white : Color(0xFF3E3E3E)),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: NeumorphicButton(
            onPressed: () {
              setState(() {
                _useDark = !_useDark;

                NeumorphicTheme.of(context).themeMode =
                    _useDark ? ThemeMode.dark : ThemeMode.light;
              });
            },
            style: NeumorphicStyle(
              shape: NeumorphicShape.flat,
              boxShape: NeumorphicBoxShape.circle(),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.loop,
                color: _useDark ? Colors.white : Colors.black,
              ),
            ),
          ),
        )
      ]),
    );
  }

  Widget _buildCard(BuildContext context) {
    return Container(
      child: Neumorphic(
        style: NeumorphicStyle(
          depth: 10,
          shape: NeumorphicShape.flat,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
        ),
        child: SizedBox(
          height: 200,
          child: AspectRatio(
            aspectRatio: 9 / 16,
            child: Stack(
              fit: StackFit.expand,
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.topLeft,
                            colors: [
                          Colors.purple.withOpacity(0.5),
                          Colors.red.withOpacity(0.5)
                        ])),
                  ),
                ),
                Stack(
                  children: [
                    Positioned(
                      top: 12,
                      left: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Text(
                            "VISA",
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.w800),
                          ),
                          SizedBox(height: 100),
                          Text(
                            "4000 1234 5678 9400",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(width: 70),
                              Text(
                                "EXPIRES",
                                style: TextStyle(
                                  height: 1.6,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white.withOpacity(0.7),
                                ),
                              ),
                              SizedBox(width: 7),
                              Text(
                                "09/24",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white.withOpacity(0.7),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            "KANG TAEWOOK",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Colors.white.withOpacity(0.7),
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 20,
                      right: 16,
                      child: SizedBox(
                        height: 60,
                        child: Neumorphic(
                          style: NeumorphicStyle(
                              depth: 5,
                              intensity: 0.8,
                              lightSource: LightSource.topLeft,
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(12))),
                          child: RotatedBox(
                            quarterTurns: 1,
                            child: Image.asset(
                                "assets/images/credit_card_chip.png"),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 12,
                      right: 10,
                      child: SizedBox(
                        height: 60,
                        child: Neumorphic(
                          style: NeumorphicStyle(
                              depth: 5,
                              intensity: 0.8,
                              lightSource: LightSource.topLeft,
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(12))),
                          child: Image.asset("assets/images/visa.png"),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDots(BuildContext context) {
    final double dotsSize = 18;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: dotsSize,
          height: dotsSize,
          child: NeumorphicRadio(
            groupValue: _dotIndex,
            value: 0,
            onChanged: (value) {
              setState(() {
                _dotIndex = value;
              });
            },
            style: NeumorphicRadioStyle(
                boxShape: NeumorphicBoxShape.circle(),
                shape: NeumorphicShape.convex),
          ),
        ),
        SizedBox(width: 10),
        SizedBox(
          width: dotsSize,
          height: dotsSize,
          child: NeumorphicRadio(
            groupValue: _dotIndex,
            value: 1,
            onChanged: (value) {
              setState(() {
                _dotIndex = value;
              });
            },
            style: NeumorphicRadioStyle(
                boxShape: NeumorphicBoxShape.circle(),
                shape: NeumorphicShape.convex),
          ),
        ),
        SizedBox(width: 10),
        SizedBox(
          width: dotsSize,
          height: dotsSize,
          child: NeumorphicRadio(
            groupValue: _dotIndex,
            value: 2,
            onChanged: (value) {
              setState(() {
                _dotIndex = value;
              });
            },
            style: NeumorphicRadioStyle(
                boxShape: NeumorphicBoxShape.circle(),
                shape: NeumorphicShape.convex),
          ),
        ),
      ],
    );
  }

  Widget _buildBalance(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Balance",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 30,
                  color: _useDark ? Colors.white : Color(0xFF3E3E3E),
                )),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "\$ 14,020.44",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: _useDark ? Colors.white : Color(0xFF3E3E3E),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildIndicator(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 8),
          NeumorphicIndicator(
            percent: 0.3,
            padding: EdgeInsets.all(3),
            orientation: NeumorphicIndicatorOrientation.horizontal,
            height: 20,
            style: IndicatorStyle(
              accent: Colors.grey[100],
              variant: Colors.grey[400],
            ),
          ),
          SizedBox(height: 8),
          Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Credit limit",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: _useDark ? Colors.white : Color(0xFF3E3E3E))),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text("\$ 220 / \$ 1000",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: _useDark ? Colors.white : Color(0xFF3E3E3E))),
              ),
            ],
          )
        ],
      ),
    );
  }
}
