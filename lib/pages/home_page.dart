import 'package:chattie/utils/constants.dart';
import 'package:chattie/widgets/home_page/app_bar.dart';
import 'package:chattie/widgets/home_page/tab_bar.dart';
import 'package:chattie/widgets/tab_views/chats.dart';
import 'package:chattie/widgets/tab_views/contacts.dart';
import 'package:chattie/widgets/tab_views/settings.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabItems _currentTab = TabItems.chats;

  void _selectTab(TabItems tabItem) {
    setState(() {
      _currentTab = tabItem;
    });
  }

  Widget tabView() {
    switch (_currentTab) {
      case TabItems.contacts:
        return const Contacts();
      case TabItems.setting:
        return const SettingsPage();
      default:
        return const Chats();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(tabItem: _currentTab),
            Expanded(
              child: tabView(),
            ),
            CustomTabBar(currentTab: _currentTab, selectTab: _selectTab),
          ],
        ),
      ),
    );
  }
}
