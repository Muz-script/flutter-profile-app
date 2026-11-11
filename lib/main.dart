import 'package:flutter/material.dart';
 
void main() => runApp(const MyApp());
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile App',
      // ThemeData: tema global (warna utama, warna teks, font custom)
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3643F4)),
        primaryColor: const Color(0xFF3643F4),
        scaffoldBackgroundColor: const Color(0xFFF4F5FF),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF3643F4),
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          titleMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1B1F3B),
          ),
          bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF1B1F3B)),
        ),
      ),
      home: const ProfilePage(),
    );
  }
}
 
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
 
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
 
    return Scaffold(
      appBar: AppBar(title: const Text('Belajar Flutter')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container: header dengan background, padding, dan margin
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              decoration: BoxDecoration(
                color: primary,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: Column(
                children: [
                  // Image
                  ClipOval(
                    child: Image.asset(
                      'assets/cat.jpg',
                      width: 130,
                      height: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 14),
                  // Text
                  Text(
                    'Muzakki Fadlillah Gunadi',
                    style: theme.textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Teknik Informatika',
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 12),
                  // Row + Icon
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 22),
                      SizedBox(width: 6),
                      Text(
                        'Mahasiswa Aktif',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
 
            // Container: area konten dengan padding
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Informasi', style: theme.textTheme.titleMedium),
                  const SizedBox(height: 8),
 
                  // Card + ListTile
                  const Card(
                    child: ListTile(
                      leading: Icon(Icons.school),
                      title: Text('Universitas Teknologi Bandung'),
                      subtitle: Text('Program Studi Teknik Informatika'),
                    ),
                  ),
                  const Card(
                    child: ListTile(
                      leading: Icon(Icons.badge),
                      title: Text('NIM'),
                      subtitle: Text('24552011062'),
                    ),
                  ),
                  const Card(
                    child: ListTile(
                      leading: Icon(Icons.code),
                      title: Text('GitHub'),
                      subtitle: Text('Muz-script'),
                    ),
                  ),
 
                  const SizedBox(height: 16),
                  Text('Riwayat Pendidikan', style: theme.textTheme.titleMedium),
                  const SizedBox(height: 8),
 
                  // Row di dalam Card: label + keterangan
                  const Card(
                    child: Padding(
                      padding: EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _EduRow(level: 'SD', name: 'SDN Sukasari 2'),
                          Divider(),
                          _EduRow(level: 'SMP', name: 'MTs. Persis 03 Pameungpeuk'),
                          Divider(),
                          _EduRow(level: 'SMK', name: 'SMK Almarwah'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 
class _EduRow extends StatelessWidget {
  final String level;
  final String name;
 
  const _EduRow({required this.level, required this.name});
 
  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    return Row(
      children: [
        Container(
          width: 52,
          padding: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            color: primary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            level,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(child: Text(name)),
      ],
    );
  }
}