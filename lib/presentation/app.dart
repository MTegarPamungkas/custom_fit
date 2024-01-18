import 'package:custom_fit/presentation/pages/home/home_page.dart';
import 'package:custom_fit/presentation/pages/order/order_page.dart';
import 'package:custom_fit/presentation/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class App extends StatelessWidget {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  App({super.key});

  List<Widget> _buildScreens() {
    return [
      const HomePage(),
      const OrderPage(),
      const ProfilePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: const Color(0xFF5D55B3),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.text_snippet_sharp),
        title: ("Order"),
        activeColorPrimary: const Color(0xFF5D55B3),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person_2_outlined),
        title: ("Profile"),
        activeColorPrimary: const Color(0xFF5D55B3),
        inactiveColorPrimary: Colors.grey,
      ),
      // Tambahkan item lainnya di sini
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: const Color(0xFFF5F5FA),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style6,
    );
  }
}
