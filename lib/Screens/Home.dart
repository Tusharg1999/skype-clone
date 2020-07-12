import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skype/Screens/PageView/MessageView/main.dart';
import 'package:skype/resources/repository/FirebaseRepository.dart';
import 'package:skype/utils/UniversalVariables.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _controller;
  int _page = 0;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int value) {
    _controller.jumpToPage(value);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            bottomNavigationBar: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: CupertinoTabBar(
                  currentIndex: _page,
                  onTap: navigationTapped,
                  backgroundColor: UniversalVariables.blackColor,
                  items: [
                    BottomNavigationBarItem(
                      title: Text("Messages"),
                      icon: Icon(
                        Icons.message,
                        color: _page == 0 ? Colors.blue : Colors.white,
                      ),
                    ),
                    BottomNavigationBarItem(
                      title: Text("Call"),
                      icon: Icon(
                        Icons.call,
                        color: _page == 1 ? Colors.blue : Colors.white,
                      ),
                    ),
                    BottomNavigationBarItem(
                      title: Text("Contacts"),
                      icon: Icon(
                        Icons.contact_phone,
                        color: _page == 2 ? Colors.blue : Colors.white,
                      ),
                    ),
                  ]),
            ),
            backgroundColor: UniversalVariables.blackColor,
            body: PageView(
              physics: NeverScrollableScrollPhysics(),
              onPageChanged: onPageChanged,
              controller: _controller,
              children: <Widget>[
                Center(
                  child: Container(
                    child: MessageView(),
                  ),
                ),
                Center(
                  child: Text(
                    "Call",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Center(
                  child: Text(
                    "Contacts",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )));
  }
}
