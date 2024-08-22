import 'package:flutter/material.dart';
import 'package:flutter_day2/views/dasboard/bottom_nav_bar.dart';

class DetailPage extends StatefulWidget {
  final String title;
  final String imageUrl;

  const DetailPage({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    _tabController.addListener(() {
      setState(() {});
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
        title: Text(widget.title, style: const TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Tambahkan fungsi pencarian
            },
          ),
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              // Tambahkan fungsi menu
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar utama
            Image.asset(widget.imageUrl,
                width: double.infinity, fit: BoxFit.cover),
            const SizedBox(height: 16.0),
            // Judul
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Deskripsi singkat
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Menggunakan feromon untuk menarik dan menangkap hama dengan cara yang mudah',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
            ),
            // TabBar untuk Kelas, Tentang, Pengajar
            DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  TabBar(
                    controller: _tabController,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                    indicator: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    indicatorSize:
                        TabBarIndicatorSize.tab, // Indikator lebih kecil
                    labelPadding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 0.0),
                    tabs: const [
                      Tab(text: 'Kelas'),
                      Tab(text: 'Tentang'),
                      Tab(text: 'Pengajar'),
                    ],
                  ),
                  SizedBox(
                    height: 400.0, // Sesuaikan ukuran sesuai kebutuhan
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        // Tab Kelas
                        ListView(
                          padding: const EdgeInsets.all(16.0),
                          children: [
                            buildClassItem(
                              context,
                              title:
                                  'Pengenalan Hama dan Penyakit pada Sayuran',
                              subtitle: '1 kelas tersedia • 7 menit',
                              duration: '7 menit',
                              isPlaying: true,
                            ),
                            buildClassItem(
                              context,
                              title:
                                  'Identifikasi dan Diagnosis Hama dan Penyakit',
                              subtitle: '2 kelas tersedia • 25 menit',
                              duration: '25 menit',
                            ),
                            buildClassItem(
                              context,
                              title: 'Penerapan Teknologi Pengendalian',
                              subtitle: '1 kelas tersedia • 13 menit',
                              duration: '13 menit',
                            ),
                            buildClassItem(
                              context,
                              title:
                                  'Penggunaan Teknologi Pemantauan dan Deteksi',
                              subtitle: '4 kelas tersedia • 135 menit',
                              duration: '135 menit',
                            ),
                            buildClassItem(
                              context,
                              title:
                                  'Pengelolaan Lingkungan dan Praktik Budidaya',
                              subtitle: '2 kelas tersedia • 50 menit',
                              duration: '50 menit',
                            ),
                          ],
                        ),
                        // Tab Tentang
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Tentang materi pelatihan ini',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              const Text(
                                'Materi ini membahas penggunaan feromon untuk menarik dan menangkap hama secara efektif. Penggunaan teknologi ini bertujuan untuk mempermudah proses pengendalian hama dengan metode yang ramah lingkungan.',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              const Text(
                                'Fitur-Fitur Utama:',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              const Text(
                                '1. Metode pengendalian hama berbasis feromon.\n'
                                '2. Teknik pemantauan dan deteksi hama.\n'
                                '3. Praktik terbaik dalam pengelolaan lingkungan.',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Tab Pengajar
                        ListView(
                          padding: const EdgeInsets.all(16.0),
                          children: [
                            buildInstructorItem(
                              name: 'Luluk Irawati, S.P., M.T.A',
                              expertise:
                                  'Dosen Pengajar Politeknik Negeri Lampung',
                              imageUrl: 'assets/images/img_profile_pict.jpg',
                              bio:
                                  'Dr. John Doe adalah seorang ahli dalam pengendalian hama dengan pengalaman lebih dari 20 tahun di bidang ini.',
                            ),
                            buildInstructorItem(
                              name: 'Prof. Jane Smith',
                              expertise: 'Spesialis Teknologi Pertanian',
                              imageUrl: 'assets/images/img_profile_pict.jpg',
                              bio:
                                  'Prof. Jane Smith adalah spesialis teknologi pertanian yang memiliki banyak publikasi di bidang pengendalian hama.',
                            ),
                            // Tambahkan lebih banyak item instruktur sesuai kebutuhan
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (_tabController.index ==
                      0) // Tampilkan tombol hanya di tab Kelas
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Tambahkan fungsi untuk tombol
                        },
                        child: const Text('Mulai Pelatihan'),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 1,
        onTap: (index) {
          // Logic for navigation based on index
        },
      ),
    );
  }

  Widget buildClassItem(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String duration,
    bool isPlaying = false,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          child: isPlaying
              ? const Icon(Icons.play_circle_fill, color: Colors.blue)
              : const Icon(Icons.play_arrow, color: Colors.grey),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: isPlaying
            ? Text(duration, style: const TextStyle(color: Colors.blue))
            : const Icon(Icons.keyboard_arrow_right),
        onTap: () {
          // Tambahkan navigasi ke halaman detail materi
        },
      ),
    );
  }

  Widget buildInstructorItem({
    required String name,
    required String expertise,
    required String imageUrl,
    required String bio,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(imageUrl),
        ),
        title: Text(name),
        subtitle: Text(expertise),
        isThreeLine: true,
        contentPadding: const EdgeInsets.all(8.0),
        trailing: IconButton(
          icon: const Icon(Icons.info_outline),
          onPressed: () {
            // Tambahkan fungsi untuk informasi lebih lanjut
          },
        ),
        onTap: () {
          // Tambahkan navigasi ke halaman detail pengajar
        },
      ),
    );
  }
}
