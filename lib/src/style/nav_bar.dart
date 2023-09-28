import 'package:flutter/material.dart';
import 'package:game_template/src/style/palette.dart';
import 'package:provider/provider.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.onlyShowSelected;

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();

    return NavigationBar(
      backgroundColor: palette.backgroundLevelSelection,
      height: 75,
      labelBehavior: labelBehavior,
      selectedIndex: currentPageIndex,
      onDestinationSelected: (int index) {
        setState(() {
          currentPageIndex = index;
        });
      },
      destinations: const <Widget>[
        NavigationDestination(
          icon: Icon(Icons.checklist),
          label: 'Arenas',
        ),
        NavigationDestination(
          icon: Icon(Icons.computer),
          label: 'Barracks',
        ),
        NavigationDestination(
          icon: Icon(Icons.store),
          label: 'Shop',
        ),
        NavigationDestination(
          icon: Icon(Icons.handyman),
          label: 'Craft',
        ),
      ],
    );
  }
}
