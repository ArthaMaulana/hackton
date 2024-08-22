import 'package:flutter/material.dart';

import 'dashboard_page.dart';
import 'forum_page.dart'; // Mengimpor ForumPage
import 'market_page.dart';
import 'pelatihan_page.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      currentIndex: selectedIndex,
      onTap: (index) {
        onTap(index);

        if (index == 0 && selectedIndex != 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const DashboardPage()),
          );
        } else if (index == 1 && selectedIndex != 1) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const PelatihanPage()),
          );
        } else if (index == 2 && selectedIndex != 2) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MarketPage()),
          );
        } else if (index == 3 && selectedIndex != 3) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ForumPage()),
          );
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Beranda',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Pelatihan',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Pasar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'Forum',
        ),
      ],
    );
  }
}
