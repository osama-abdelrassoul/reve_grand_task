import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/login/bloc/login_bloc.dart';

class BottomNavBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const BottomNavBar(),
        settings: const RouteSettings(name: routeName));
  }

  const BottomNavBar({super.key});

  @override
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  int _page = 1;

  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    List pages = [
      Container(),
      Container(),
      Container(),
      Container(),
    ];
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.white,
            bottomNavigationBar: CurvedNavigationBar(
              key: bottomNavigationKey,
              index: 1,
              height: 60.0,
              items: const <Widget>[
                CircleAvatar(
                    backgroundColor: Color(0xFFf2a493),
                    child: Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.black,
                    )),
                CircleAvatar(
                    backgroundColor: Color(0xFFf2a493),
                    child:
                        Icon(Icons.home_filled, size: 30, color: Colors.black)),
                CircleAvatar(
                    backgroundColor: Color(0xFFf2a493),
                    child: Icon(Icons.task_rounded,
                        size: 30, color: Colors.black)),
                CircleAvatar(
                    backgroundColor: Color(0xFFf2a493),
                    child: Icon(Icons.task_rounded,
                        size: 30, color: Colors.black)),
              ],
              color: Colors.pinkAccent,
              buttonBackgroundColor: const Color(0xFFf2a493),
              backgroundColor: Colors.transparent,
              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 600),
              onTap: (index) {
                setState(() {
                  _page = index;
                });
              },
              letIndexChange: (index) => true,
            ),
            body: pages[_page]);
      },
    );
  }
}
