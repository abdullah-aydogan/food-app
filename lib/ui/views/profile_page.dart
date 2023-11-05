import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {

  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil Sayfası", style: TextStyle(fontFamily: "Agbalumo")),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.person, size: 100),
            const SizedBox(height: 20),
            const Text("Abdullah AYDOĞAN", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text("Kullanıcı ID : 9999", style: TextStyle(fontSize: 18)),
            const Text("Sipariş Adeti : 2", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            TextButton.icon(
              style: TextButton.styleFrom(
                  side: const BorderSide(
                    width: 1.0,
                  )
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Oturumdan çıkış yapılıyor...")),
                );
              },
              label: const Text("Oturumu Kapat", style: TextStyle(fontSize: 18)),
              icon: const Icon(Icons.exit_to_app_outlined),
            ),
          ],
        ),
      ),
    );
  }
}