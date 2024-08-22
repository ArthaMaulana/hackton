import 'package:flutter/material.dart';
import 'package:flutter_day2/views/dasboard/bottom_nav_bar.dart';
import 'package:flutter_day2/views/dasboard/catalog_page.dart';

class MarketPage extends StatelessWidget {
  const MarketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Section with background image and "Go To Catalog" button
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 600,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/market1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 80,
                  left: 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 250,
                        width: 370,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CatalogPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightGreen,
                        ),
                        child: const Text('Go To Catalog'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Popular Products Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Popular Products',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildProductCard(
                        imageUrl: 'assets/images/lele.jpg',
                        productName: 'Ikan Lele',
                        price: 'Rp 10.000/kg',
                        priceChange: 'Harga naik',
                        priceChangeColor: Colors.red,
                        priceChangeIcon: Icons.arrow_upward,
                      ),
                      buildProductCard(
                        imageUrl: 'assets/images/telur.jpg',
                        productName: 'Telur Ayam',
                        price: 'Rp 10.000/kg',
                        priceChange: 'Harga Turun',
                        priceChangeColor: Colors.green,
                        priceChangeIcon: Icons.arrow_downward,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 2,
        onTap: (index) {
          // Logic for navigation based on index
        },
      ),
    );
  }

  Widget buildProductCard({
    required String imageUrl,
    required String productName,
    required String price,
    required String priceChange,
    required Color priceChangeColor,
    required IconData priceChangeIcon,
  }) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  imageUrl,
                  width: double.infinity,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                  decoration: BoxDecoration(
                    color: priceChangeColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(priceChangeIcon, color: Colors.white, size: 12),
                      const SizedBox(width: 2),
                      Text(
                        priceChange,
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            productName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(price, style: TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }
}
