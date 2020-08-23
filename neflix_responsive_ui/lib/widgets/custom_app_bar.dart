import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/widgets/widgets.dart';

import '../assets.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;

  const CustomAppBar({Key key, this.scrollOffset = 0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
      color: Colors.black.withOpacity((scrollOffset / 350).clamp(0,1).toDouble()),
      child: Responsive(mobile: _CustomAppBarMobile(),
      desktop: _CustomAppBarDesktop(),)
    );
  }
}

class _CustomAppBarMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Row(
          children: [
            Image.asset(Assets.netflixLogo0),
            const SizedBox(width: 12.0),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _AppBarButton(
                    title: "TV 프로그램",
                    onTap: () => print("TV 프로그램"),
                  ),
                  _AppBarButton(
                    title: "영화",
                    onTap: () => print("영화"),
                  ),
                  _AppBarButton(
                    title: "내가 찜한 콘텐츠",
                    onTap: () => print("내가 찜한 콘텐츠"),
                  )
                ],
              ),
            )
          ],
        ),
      );
  }
}

class _CustomAppBarDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Row(
          children: [
            Image.asset(Assets.netflixLogo1),
            const SizedBox(width: 12.0),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _AppBarButton(
                    title: "홈",
                    onTap: () => print("홈"),
                  ),
                  _AppBarButton(
                    title: "TV 프로그램",
                    onTap: () => print("TV 프로그램"),
                  ),
                  _AppBarButton(
                    title: "영화",
                    onTap: () => print("영화"),
                  ),
                  _AppBarButton(
                    title: "최신작",
                    onTap: () => print("최신작"),
                  ),
                  _AppBarButton(
                    title: "내가 찜한 콘텐츠",
                    onTap: () => print("내가 찜한 콘텐츠"),
                  ),
                ],
              ),
            ),
            const Spacer(),  
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.search), 
                    iconSize: 28.0,
                    color: Colors.white,
                    onPressed: () => print('Search')
                  ),
                  _AppBarButton(
                    title: "키즈",
                    onTap: () => print("키즈"),
                  ),
                  _AppBarButton(
                    title: "DVD",
                    onTap: () => print("DVD"),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.card_giftcard), 
                    iconSize: 28.0,
                    color: Colors.white,
                    onPressed: () => print('Gift')
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.notifications), 
                    iconSize: 28.0,
                    color: Colors.white,
                    onPressed: () => print('Notifications')
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }
}

class _AppBarButton extends StatelessWidget {
  final String title;
  final Function onTap;

  const _AppBarButton({Key key, this.title, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap,
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w600),
      ),
    );
  }
}
