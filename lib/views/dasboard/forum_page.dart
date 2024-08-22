import 'package:flutter/material.dart';

import 'bottom_nav_bar.dart'; // Mengimpor BottomNavBar dari file terpisah

class ForumPage extends StatelessWidget {
  const ForumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Aksi pencarian
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                    'assets/images/bunga1.jpg'), // Sesuaikan dengan gambar profil
              ),
              title: const Text('Bejo Sudirman'),
              subtitle: const Text('Post 35 menit yang lalu'),
            ),
            const SizedBox(height: 10),
            const Text(
              'Apa tantangan terbesar yang Anda hadapi dalam pengelolaan tanaman sayuran, dan bagaimana Anda mengatasinya?',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Image.asset(
                'assets/images/bunga1.jpg'), // Sesuaikan dengan gambar pertanian
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.favorite_border),
                      onPressed: () {
                        // Aksi untuk menyukai pertanyaan
                      },
                    ),
                    const Text('Sukai Pertanyaan'),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.chat_bubble_outline),
                    const SizedBox(width: 4),
                    const Text('2 Discussion'),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () {
                    // Aksi untuk membagikan pertanyaan
                  },
                ),
              ],
            ),
            const Divider(),
            TextField(
              decoration: InputDecoration(
                hintText: 'Masukkan Komentar',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 3, // Menandakan bahwa Forum adalah tab yang dipilih
        onTap: (index) {
          // Navigasi sudah ditangani di BottomNavBar
        },
      ),
    );
  }
}
