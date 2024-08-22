import 'package:flutter/material.dart';

import 'bottom_nav_bar.dart';
import 'detail_page.dart'; // Import the DetailPage

class PelatihanPage extends StatefulWidget {
  const PelatihanPage({super.key});

  @override
  State<PelatihanPage> createState() => _PelatihanPageState();
}

class _PelatihanPageState extends State<PelatihanPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedTabIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.only(left: 100),
          child: const Center(
            child: Text(
              'Pelatihan',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.green,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          tabs: [
            Tab(
              child: Container(
                decoration: BoxDecoration(
                  color: _selectedTabIndex == 0
                      ? Colors.green
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text("PERTANIAN"),
                ),
              ),
            ),
            Tab(
              child: Container(
                decoration: BoxDecoration(
                  color: _selectedTabIndex == 1
                      ? Colors.green
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text("PETERNAKAN"),
                ),
              ),
            ),
            Tab(
              child: Container(
                decoration: BoxDecoration(
                  color: _selectedTabIndex == 2
                      ? Colors.green
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text("PERIKANAN"),
                ),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Tab Pertanian
          ListView(
            padding: const EdgeInsets.all(16),
            children: [
              buildListItem(
                title: 'Teknologi Pengendalian Hama dan Penyakit pada sayuran',
                subtitle:
                    'Menggunakan feromon untuk menarik dan menangkap hama...',
                imageUrl: 'assets/images/hama.png',
              ),
              buildListItem(
                title: 'Pertanian Hidroponik',
                subtitle:
                    'Menanam tanaman dengan akar yang terendam dalam larutan..',
                imageUrl: 'assets/images/hama.png',
              ),
              buildListItem(
                title: 'Pertanian Presisi (Precision Agriculture)',
                subtitle:
                    'Menggunakan citra udara atau satelit untuk menganalisis...',
                imageUrl: 'assets/images/hama.png',
              ),
              buildListItem(
                title: 'Pertanian Vertikal (Vertical Farming)',
                subtitle:
                    'Menanam tanaman dalam rak bertingkat di dalam ruangan...',
                imageUrl: 'assets/images/hama.png',
              ),
              buildListItem(
                title: 'Bioteknologi',
                subtitle:
                    'Memodifikasi gen tanaman untuk meningkatkan ketahanan...',
                imageUrl: 'assets/images/hama.png',
              ),
              buildListItem(
                title: 'Pertanian Aeroponik',
                subtitle:
                    'Menggunakan kabut halus dari larutan nutrisi yang...',
                imageUrl: 'assets/images/hama.png',
              ),
              buildListItem(
                title: 'Otomasi Tanaman',
                subtitle:
                    'Alat yang secara otomatis menanam benih dalam baris yang...',
                imageUrl: 'assets/images/hama.png',
              ),
            ],
          ),
          // Tab Peternakan
          ListView(
            padding: const EdgeInsets.all(16),
            children: [
              buildListItem(
                title: 'Teknologi Pemuliaan Ternak',
                subtitle:
                    'Meningkatkan kualitas genetik hewan ternak untuk produksi...',
                imageUrl: 'assets/images/hama.png',
              ),
              buildListItem(
                title: 'Manajemen Kesehatan Ternak',
                subtitle:
                    'Pengelolaan kesehatan hewan ternak untuk mengurangi risiko penyakit...',
                imageUrl: 'assets/images/hama.png',
              ),
              buildListItem(
                title: 'Produksi Pakan Ternak',
                subtitle:
                    'Mengolah dan memproduksi pakan yang efisien untuk hewan ternak...',
                imageUrl: 'assets/images/hama.png',
              ),
              buildListItem(
                title: 'Pemanfaatan Bioteknologi dalam Peternakan',
                subtitle:
                    'Penggunaan bioteknologi untuk meningkatkan produktivitas ternak...',
                imageUrl: 'assets/images/hama.png',
              ),
              buildListItem(
                title: 'Pengelolaan Limbah Ternak',
                subtitle:
                    'Pengelolaan limbah ternak untuk menjaga kebersihan dan kesehatan lingkungan...',
                imageUrl: 'assets/images/hama.png',
              ),
            ],
          ),
          // Tab Perikanan
          ListView(
            padding: const EdgeInsets.all(16),
            children: [
              buildListItem(
                title: 'Teknik Budidaya Ikan Air Tawar',
                subtitle: 'Metode efektif dalam budidaya ikan air tawar...',
                imageUrl: 'assets/images/hama.png',
              ),
              buildListItem(
                title: 'Manajemen Kualitas Air untuk Perikanan',
                subtitle:
                    'Memastikan kualitas air yang optimal untuk budidaya ikan...',
                imageUrl: 'assets/images/hama.png',
              ),
              buildListItem(
                title: 'Pakan Ikan Efisien',
                subtitle: 'Produksi dan penggunaan pakan ikan yang efisien...',
                imageUrl: 'assets/images/hama.png',
              ),
              buildListItem(
                title: 'Pengelolaan Kesehatan Ikan',
                subtitle:
                    'Mencegah dan mengatasi penyakit pada ikan dengan efektif...',
                imageUrl: 'assets/images/hama.png',
              ),
              buildListItem(
                title: 'Teknologi Pengolahan Hasil Perikanan',
                subtitle:
                    'Mengolah hasil perikanan menjadi produk bernilai tinggi...',
                imageUrl: 'assets/images/hama.png',
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 1,
        onTap: (index) {
          // Logic for navigation based on index
        },
      ),
    );
  }

  Widget buildListItem({
    required String title,
    required String subtitle,
    required String imageUrl,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
      leading: Image.asset(imageUrl, width: 80, height: 80, fit: BoxFit.cover),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              title: title,
              imageUrl: imageUrl,
            ),
          ),
        );
      },
    );
  }
}
