import 'package:flutter/material.dart';
import 'package:flutter_day2/config/const.dart';
import 'package:flutter_day2/views/dasboard/bottom_nav_bar.dart';
import 'package:flutter_day2/views/dasboard/profile_page.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
              child: CircleAvatar(
                backgroundImage:
                    AssetImage('assets/images/img_profile_pict.jpg'),
                radius: 20,
              ),
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
        actions: const [
          Icon(Icons.car_crash, color: Colors.black),
          SizedBox(width: 16),
          Icon(Icons.search, color: Colors.black),
          SizedBox(width: 16),
          Icon(Icons.shopping_cart, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hasil Produk',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: [
                      Chip(
                        label: const Text(
                          'Jagung',
                          style: TextStyle(
                            color: appBarBackgroundColor, // Warna teks hijau
                            fontWeight: FontWeight.bold, // Membuat teks tebal
                          ),
                        ),
                        backgroundColor: Colors.grey
                            .shade200, // Warna latar belakang abu-abu terang
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20), // Membuat sudut bulat
                        ),
                      ),
                      Chip(
                        label: const Text(
                          'Beras',
                          style: TextStyle(
                            color: appBarBackgroundColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        backgroundColor: Colors.grey.shade200,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Chip(
                        label: const Text(
                          'Tomat',
                          style: TextStyle(
                            color: appBarBackgroundColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        backgroundColor: Colors.grey.shade200,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Chip(
                        label: const Text(
                          'Cabai',
                          style: TextStyle(
                            color: appBarBackgroundColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        backgroundColor: Colors.grey.shade200,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Chip(
                        label: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                        ),
                        backgroundColor: Colors.grey.shade200,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hot Promo',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 3 / 3,
                    ),
                    children: [
                      buildCatalogProductCard(
                        imageUrl: 'assets/images/telur.jpg',
                        productName: 'Telur Ayam',
                        price: 'Rp 10.000/kg',
                        priceChange: 'Harga Turun',
                        priceChangeColor: Colors.green,
                        priceChangeIcon: Icons.arrow_downward,
                      ),
                      buildCatalogProductCard(
                        imageUrl: 'assets/images/jagung.jpg',
                        productName: 'Jagung',
                        price: 'Rp 10.000/kg',
                        priceChange: 'Harga Turun',
                        priceChangeColor: Colors.green,
                        priceChangeIcon: Icons.arrow_downward,
                      ),
                      buildCatalogProductCard(
                        imageUrl: 'assets/images/pakcoy.jpg',
                        productName: 'Pakcoy Segar',
                        price: 'Rp 10.000/ikt',
                        priceChange: 'Harga Naik',
                        priceChangeColor: Colors.red,
                        priceChangeIcon: Icons.arrow_upward,
                      ),
                      buildCatalogProductCard(
                        imageUrl: 'assets/images/tomat.jpg',
                        productName: 'Tomat Merah Segar',
                        price: 'Rp 10.000/kg',
                        priceChange: 'Harga Normal',
                        priceChangeColor: Colors.blue,
                        priceChangeIcon: Icons.remove,
                      ),
                      buildCatalogProductCard(
                        imageUrl: 'assets/images/lele.jpg',
                        productName: 'Ikan Lele',
                        price: 'Rp 10.000/kg',
                        priceChange: 'Harga Naik',
                        priceChangeColor: Colors.red,
                        priceChangeIcon: Icons.arrow_upward,
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

  Widget buildCatalogProductCard({
    required String imageUrl,
    required String productName,
    required String price,
    required String priceChange,
    required Color priceChangeColor,
    required IconData priceChangeIcon,
  }) {
    return Container(
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
                        style:
                            const TextStyle(color: Colors.white, fontSize: 10),
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
