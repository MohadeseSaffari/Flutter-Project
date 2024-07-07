import 'package:flutter/material.dart';
import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter_application_1/homepage/myCallender.dart';
import 'package:flutter_application_1/homepage/myHome.dart';
import 'package:flutter_application_1/news.dart';
import 'package:flutter_application_1/exercisePage.dart';
import 'package:flutter_application_1/testhome.dart';
import 'package:flutter_application_1/todo_page/todoHome.dart';
import 'package:flutter_application_1/userPerfrences/current_user.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/myTodo.dart';
import 'package:flutter_application_1/classes.dart';
import 'package:flutter_application_1/test/profile_page_test.dart';



class HomePage extends StatelessWidget {

  CurrentUser remberCurrentUser = Get.put(CurrentUser());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bottom Bar Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final CurrentUser _currentUser = Get.put(CurrentUser());
  int studentId = 1; // Example student ID
  int _currentPage = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    studentId = _currentUser.user.user_id;
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          MyHomePage(pageController: _pageController),
          TodoHomeScreen(studentId: studentId),
          ProfilePageTest(),
          CalendarPage(),
          NewsPage(),
        ],
        onPageChanged: (index) {
          setState(() => _currentPage = index);
        },
      ),
      bottomNavigationBar: BottomBar(
        textStyle: TextStyle(fontWeight: FontWeight.bold),
        selectedIndex: _currentPage,
        onTap: (int index) {
          _pageController.jumpToPage(index);
          setState(() => _currentPage = index);
        },
        items: <BottomBarItem>[
          BottomBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: Color.fromARGB(255, 56, 18, 194),
            activeTitleColor: Color.fromARGB(255, 56, 18, 194),
          ),
          BottomBarItem(
            icon: Icon(Icons.add_task),
            title: Text('To Do'),
            activeColor: Color.fromARGB(255, 56, 18, 194),
          ),
          BottomBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
            backgroundColorOpacity: 0.1,
            activeColor: Color.fromARGB(255, 56, 18, 194),
          ),
          BottomBarItem(
            icon: Icon(Icons.class_),
            title: Text('Classes'),
            activeColor: Color.fromARGB(255, 56, 18, 194),
            activeIconColor: Color.fromARGB(255, 56, 18, 194),
            activeTitleColor: Color.fromARGB(255, 56, 18, 194),
          ),
          BottomBarItem(
            icon: Icon(Icons.newspaper),
            title: Text('News'),
            activeColor: Color.fromARGB(255, 56, 18, 194),
            activeIconColor:Color.fromARGB(255, 56, 18, 194),
            activeTitleColor: Color.fromARGB(255, 56, 18, 194),
          ),
        ],
      ),
    );
  }
}

