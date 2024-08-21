import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_day2/bloc/auth/auth_bloc.dart';
import 'package:flutter_day2/config/const.dart';
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
  int _current = 0;

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
        'Welcome!',
        'Let\'s create your project design',
        'assets/images/bunga1.jpg',
      ),
      buildSliderCard(
        'Special Promo!',
        'Check promo for special offers',
        'assets/images/bunga2.jpg',
      ),
      buildSliderCard(
        'New Learning',
        'Learn the latest techniques in your field',
        'assets/images/bunga3.jpg',
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
            RichText(
              text: const TextSpan(
                text: 'Welcome\n',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
                children: [
                  TextSpan(
                    text: 'Artha',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  context.read<AuthBloc>().add(OnSignOut());
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: const Center(
                    child: Text(
                      "Logout",
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Search Bar
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white, // Background color
              borderRadius: BorderRadius.circular(20), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Shadow color
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(0, 4), // Shadow position
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(
                      8.0), // Adjusts the padding around the microphone icon
                  child: Icon(Icons.mic,
                      color: Colors.grey, size: 20), // Smaller microphone icon
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(
                      8.0), // Adjusts the padding around the search icon
                  child: Icon(Icons.search,
                      color: Colors.grey, size: 20), // Smaller search icon
                ),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none, // Removes the default border
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 8.0), // Reduces the height of the TextField
                filled: true,
                fillColor: Colors.white
                    .withOpacity(0.9), // Slightly translucent background
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
              aspectRatio: 2.5, // Make the image stretch horizontally
              viewportFraction: 1.0, // Full-width images
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
          // Dots Indicator
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
          // Recent Learning Section
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
          Divider(
            endIndent: width * 0.01,
            indent: width * 0.03,
            thickness: 1,
            color: Colors.black,
            height: 0.1,
          ),
          ListTile(
            title: const Text('Budidaya ayam freerange'),
            subtitle: const Text('Peternakan'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          Divider(
            endIndent: width * 0.01,
            indent: width * 0.03,
            thickness: 1,
            color: Colors.black,
            height: 0.1,
          ),
          ListTile(
            title: const Text('Budidaya ikan gabus'),
            subtitle: const Text('Perikanan'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          Divider(
            endIndent: width * 0.01,
            indent: width * 0.03,
            thickness: 1,
            color: Colors.black,
            height: 0.1,
          ),
          const SizedBox(height: 16),
          // Special for You Section
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
                child: const Text('See All'),
              ),
            ],
          ),
          // Grid of Special Cards
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.8, // Adjust this value to change the card size
            children: [
              buildSpecialCard(
                  'Telur Ayam', 'Rp 10.000/kg', 'assets/images/bunga1.jpg',
                  badgeText: "Harga Turun",
                  badgeColor: Colors.green,
                  priceStatus: 'turun'),
              buildSpecialCard(
                  'Pakcoy Segar', 'Rp 10.000/ikat', 'assets/images/bunga1.jpg',
                  badgeText: "Harga Naik",
                  badgeColor: Colors.red,
                  priceStatus: 'naik'),
              buildSpecialCard('Tomat Merah Segar', 'Rp 10.000/kg',
                  'assets/images/bunga1.jpg',
                  badgeText: "Harga Normal",
                  badgeColor: Colors.blue,
                  priceStatus: 'normal'),
              buildSpecialCard(
                  'Ikan Lele', 'Rp 10.000/kg', 'assets/images/bunga1.jpg',
                  badgeText: "Harga Turun",
                  badgeColor: Colors.green,
                  priceStatus: 'turun'),
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

  Widget buildSliderCard(String title, String description, String imageUrl) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.transparent,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSpecialCard(String title, String price, String imageUrl,
      {String? badgeText, Color? badgeColor, String? priceStatus}) {
    return Stack(
      children: [
        Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 120,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        if (badgeText != null)
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: badgeColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    badgeText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (priceStatus == 'naik')
                    Icon(Icons.arrow_upward, color: Colors.white, size: 16)
                  else if (priceStatus == 'turun')
                    Icon(Icons.arrow_downward, color: Colors.white, size: 16)
                  else if (priceStatus == 'normal')
                    Icon(Icons.line_weight,
                        color: Colors.white, size: 16) // Garis tiga
                ],
              ),
            ),
          ),
      ],
    );
  }
}
