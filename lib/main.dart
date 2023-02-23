import 'package:flutter/material.dart';
import 'package:money_test/table.dart';
import 'constants.dart';
import 'convert_entry.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: kButtonColor,
        scaffoldBackgroundColor: kBackBody,

      ),
      home: MyBottomBar(),

    );
  }
}


class MyBottomBar extends StatefulWidget {
  const MyBottomBar({Key? key}) : super(key: key);



  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  @override

  int _currentIndex = 0;
  final List<Widget> _children = const [
    DataEntryScreen(),
    ExchangeTable()
  ];

  void onTappedBar(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,

            items:const [
        BottomNavigationBarItem(
        icon: Icon(Icons.currency_exchange),
        label: 'Converter'),

    BottomNavigationBarItem(
    icon: Icon(Icons.table_chart),
    label: 'Exchange Table')

    ],


    ),
    );
  }
}


