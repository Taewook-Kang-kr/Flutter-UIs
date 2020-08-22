import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AudioPlayerScreen extends StatefulWidget {
  @override
  _AudioPlayerScreenState createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return NeumorphicTheme(
      themeMode: ThemeMode.light,
      theme: NeumorphicThemeData(
        defaultTextColor: Color(0xFF3E3E3E),
        baseColor: Color(0xFFDDE6E8),
        intensity: 0.5,
        lightSource: LightSource.topLeft,
        depth: 10,
      ),
      darkTheme: neumorphicDefaultDarkTheme.copyWith(
        defaultTextColor: Colors.white70,
      ),
      child: _Page(),
    );
  }
}

class _Page extends StatefulWidget {
  @override
  __PageState createState() => __PageState();
}

class __PageState extends State<_Page> {
  bool _useDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NeumorphicBackground(
          child: Column(
            children: [
              SizedBox(height: 14),
              _buildTopBar(context),
              SizedBox(height: 80),
              _buildImage(context),
              SizedBox(height: 30),
              _buildTitle(context),
              SizedBox(height: 40),
              _buildSeekBar(context),
              SizedBox(height: 20),
              _buildControlBar(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: NeumorphicButton(
              padding: const EdgeInsets.all(18.0),
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: NeumorphicStyle(
                shape: NeumorphicShape.flat,
                boxShape: NeumorphicBoxShape.circle(),
              ),
              child: Icon(
                Icons.navigate_before,
                color: _iconsColor(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Now Playing",
              style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
                color: NeumorphicTheme.defaultTextColor(context),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: NeumorphicButton(
              padding: const EdgeInsets.all(18.0),
              onPressed: () {
                setState(() {
                  _useDarkMode = !_useDarkMode;
                  NeumorphicTheme.of(context).themeMode =
                      _useDarkMode ? ThemeMode.dark : ThemeMode.light;
                });
              },
              style: NeumorphicStyle(
                shape: NeumorphicShape.flat,
                boxShape: NeumorphicBoxShape.circle(),
              ),
              child: Icon(
                Icons.loop,
                color: _iconsColor(),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.circle(),
      ),
      child: Container(
        height: 200,
        width: 200,
        child: Image.asset(
          "assets/images/IU.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Blueming",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 32,
            color: NeumorphicTheme.defaultTextColor(context),
          ),
        ),
        SizedBox(height: 5),
        Text(
          "아이유",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: NeumorphicTheme.defaultTextColor(context),
          ),
        )
      ],
    );
  }

  Widget _buildSeekBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          NeumorphicSlider(
            height: 8,
            min: 0,
            max: 314,
            value: 100,
            onChanged: (value) {},
          ),
          SizedBox(height: 15),
          Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text("1:10",
                    style: TextStyle(
                      color: NeumorphicTheme.defaultTextColor(context),
                    )),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text("3:14",
                    style: TextStyle(
                      color: NeumorphicTheme.defaultTextColor(context),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildControlBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NeumorphicButton(
            padding: const EdgeInsets.all(12.0),
            onPressed: () {},
            style: NeumorphicStyle(
              shape: NeumorphicShape.flat,
              boxShape: NeumorphicBoxShape.circle(),
            ),
            child: Icon(
              Icons.shuffle,
              color: _iconsColor(),
            )),
        const SizedBox(width: 12),
        NeumorphicButton(
            padding: const EdgeInsets.all(18.0),
            onPressed: () {},
            style: NeumorphicStyle(
              shape: NeumorphicShape.flat,
              boxShape: NeumorphicBoxShape.circle(),
            ),
            child: Icon(
              Icons.skip_previous,
              color: _iconsColor(),
            )),
        const SizedBox(width: 12),
        NeumorphicButton(
          padding: const EdgeInsets.all(24.0),
          onPressed: () {},
          style: NeumorphicStyle(
            shape: NeumorphicShape.flat,
            boxShape: NeumorphicBoxShape.circle(),
          ),
          child: Icon(
            Icons.play_arrow,
            size: 42,
            color: _iconsColor(),
          ),
        ),
        const SizedBox(width: 12),
        NeumorphicButton(
          padding: const EdgeInsets.all(18.0),
          onPressed: () {},
          style: NeumorphicStyle(
            shape: NeumorphicShape.flat,
            boxShape: NeumorphicBoxShape.circle(),
          ),
          child: Icon(
            Icons.skip_next,
            color: _iconsColor(),
          ),
        ),
        const SizedBox(width: 12),
        NeumorphicButton(
            padding: const EdgeInsets.all(12.0),
            onPressed: () {},
            style: NeumorphicStyle(
              shape: NeumorphicShape.flat,
              boxShape: NeumorphicBoxShape.circle(),
            ),
            child: Icon(
              Icons.repeat,
              color: _iconsColor(),
            )),
      ],
    );
  }

  Color _iconsColor() {
    final theme = NeumorphicTheme.of(context);
    if (theme.isUsingDark) {
      return theme.current.accentColor;
    } else {
      return null;
    }
  }
}
