import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_day2/bloc/auth/auth_bloc.dart';
import 'package:flutter_day2/views/auth/login_page.dart'; // Pastikan mengimpor halaman login Anda

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/img_profile_pict.jpg'),
            radius: 50,
          ),
          const SizedBox(height: 20),
          const Text(
            'Artha',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Muhammad@gmail.com',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Add the action for editing profile
            },
            child: const Text('Edit Profile'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(height: 40),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Nickname'),
            onTap: () {
              // Add the action for nickname
            },
          ),
          ListTile(
            leading: const Icon(Icons.phone),
            title: const Text('Nomor telephone'),
            onTap: () {
              // Add the action for phone number
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Ganti kata sandi'),
            onTap: () {
              // Add the action for changing password
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Riwayat Pencarian'),
            onTap: () {
              // Add the action for search history
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Pusat Bantuan'),
            onTap: () {
              // Add the action for help center
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Keluar'),
            textColor: Colors.red,
            onTap: () {
              // Menambahkan aksi logout
              context.read<AuthBloc>().add(OnSignOut());

              // Navigasi ke halaman login setelah logout
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
