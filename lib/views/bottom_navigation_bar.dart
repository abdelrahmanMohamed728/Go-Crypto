import 'package:flutter/material.dart';

class BottomNavigationBarView extends StatefulWidget {
  final Function(int) onTabClicked;
  final int index;

  const BottomNavigationBarView(this.onTabClicked, this.index, {super.key});

  @override
  State<BottomNavigationBarView> createState() =>
      _BottomNavigationBarViewState();
}

class _BottomNavigationBarViewState extends State<BottomNavigationBarView> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: widget.onTabClicked,
      currentIndex: widget.index,
      backgroundColor: Colors.white10,
      unselectedIconTheme: const IconThemeData(
        color: Colors.grey,
        size: 30,
      ),
      unselectedItemColor: Colors.grey,
      selectedIconTheme: const IconThemeData(
        color: Color(0xff3b134d),
        size: 30,
      ),
      selectedItemColor: const Color(0xff3b134d),
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      elevation: 0,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.newspaper),
          label: 'News',
        ),
      ],
    );
  }
}
