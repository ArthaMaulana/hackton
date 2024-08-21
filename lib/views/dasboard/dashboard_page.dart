import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bottom_nav_bar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final String profileImageUrl = "assets/images/img_profile_pict.jpg";
  final CarouselController _carouselController = CarouselController();
  int _current = 0; // Untuk melacak indeks saat ini dari slider

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    return token;
  }

  @override
  void initState() {
    getToken().then(
      (value) {
        // context.read<RequestBloc>().add(OnGetRequest(token: value ?? ""));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    final List<Widget> sliderItems = [
      buildSliderCard(
        'Selamat Datang!',
        'Mari buat desain proyek Anda',
        Icons.eco,
      ),
      buildSliderCard(
        'Promo Spesial!',
        'Cek Promo untuk penawaran spesial',
        Icons.local_offer,
      ),
      buildSliderCard(
        'Belajar Baru',
        'Pelajari teknik terbaru di bidangmu',
        Icons.school,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(profileImageUrl),
              radius: 20,
            ),
            const SizedBox(width: 8),
            const Text(
              'Selamat Datang Muhammad',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.green),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Bilah Pencarian
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Cari...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          // Carousel Slider
          CarouselSlider(
            items: sliderItems,
            carouselController: _carouselController,
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
          // Indikator Titik
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: sliderItems.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _carouselController.animateToPage(entry.key),
                child: Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.green)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          // Bagian Pembelajaran Terbaru
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Pembelajaran Terbaru',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Lihat semua'),
              ),
            ],
          ),
          ListTile(
            title: const Text('Cara membasmi hama tikus'),
            subtitle: const Text('Pertanian'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Budidaya ayam freerange'),
            subtitle: const Text('Peternakan'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Budidaya ikan gabus'),
            subtitle: const Text('Perikanan'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          const SizedBox(height: 16),
          // Bagian Spesial untuk Kamu
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Spesial untuk kamu',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Lihat semua'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildSpecialCard('Telur Ayam', 'Rp 10.000/kg', Icons.egg),
              buildSpecialCard('Pakcoy Segar', 'Rp 10.000/ikat', Icons.grass),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 0,
        onTap: (index) {},
      ),
    );
  }

  Widget buildSliderCard(String title, String subtitle, IconData iconData) {
    return Card(
      elevation: 5,
      color: Colors.green[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(iconData, color: Colors.green, size: 40),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Cek Promo'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSpecialCard(String title, String price, IconData iconData) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(iconData, color: Colors.green, size: 40),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              price,
              style: const TextStyle(
                color: Colors.green,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
