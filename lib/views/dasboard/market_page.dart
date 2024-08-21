import 'package:flutter/material.dart';

class MarketPage extends StatelessWidget {
  const MarketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'POLINELA MART',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Top Section with background image and "Go To Catalog" button
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bunga1.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 80,
                left: 30,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ayo Cari Kebutuhan Kamu!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the Catalog page
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
                      imageUrl: 'assets/images/bunga1.jpg',
                      productName: 'Ikan Lele',
                      price: 'Rp 10.000/kg',
                      priceChange: 'Harga naik',
                      priceChangeColor: Colors.red,
                    ),
                    buildProductCard(
                      imageUrl: 'assets/images/jagung.jpg',
                      productName: 'Telur Ayam',
                      price: 'Rp 10.000/kg',
                      priceChange: 'Harga Turun',
                      priceChangeColor: Colors.green,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProductCard({
    required String imageUrl,
    required String productName,
    required String price,
    required String priceChange,
    required Color priceChangeColor,
  }) {
    return Column(
      children: [
        Image.asset(imageUrl, width: 100, height: 100, fit: BoxFit.cover),
        const SizedBox(height: 8),
        Text(
          productName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(price),
        const SizedBox(height: 4),
        Text(
          priceChange,
          style: TextStyle(color: priceChangeColor),
        ),
      ],
    );
  }
}
