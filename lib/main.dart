import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const BrimoApp());
}

class BrimoApp extends StatelessWidget {
  const BrimoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BRImo Replica',
      theme: ThemeData(
        primaryColor: const Color(0xFF00529C), // BRI Blue
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00529C),
          primary: const Color(0xFF00529C),
        ),
        useMaterial3: true,
      ),
      home: const BrimoSplashScreen(), // Mulai dari Splash Screen
    );
  }
}

// --- TAHAP 0: SPLASH SCREEN ---
class BrimoSplashScreen extends StatefulWidget {
  const BrimoSplashScreen({super.key});

  @override
  State<BrimoSplashScreen> createState() => _BrimoSplashScreenState();
}

class _BrimoSplashScreenState extends State<BrimoSplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer 3 detik lalu pindah ke HomePage
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BrimoHomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00529C), // BRI Blue
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo BRIMO di Splash Screen
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'BRI',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 48,
                  ),
                ),
                Text(
                  'mo',
                  style: TextStyle(
                    color: Colors.blue[300],
                    fontWeight: FontWeight.bold,
                    fontSize: 48,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}

// --- TAHAP 1: HOME PAGE ---
class BrimoHomePage extends StatelessWidget {
  const BrimoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color(0xFF00529C),
        elevation: 0,
        title: Row(
          children: [
            const Text(
              'BRI',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Text(
              'mo',
              style: TextStyle(
                color: Colors.blue[300],
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.help_outline, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Bagian Biru di belakang kartu dengan Greeting
            Container(
              height: 120, // Dipertinggi sedikit untuk menampung teks greeting
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: const BoxDecoration(
                color: Color(0xFF00529C),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Selamat Pagi,',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  Text(
                    'SYAMSUL ARIFIN'.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Kartu Saldo (Transform digunakan untuk mengangkat kartu sedikit ke atas)
            Transform.translate(
              offset: const Offset(0, -40),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Saldo Rekening Utama',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Rp 1.000.000.000.000',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF00529C),
                            ),
                          ),
                          Icon(Icons.visibility, color: Colors.blue[300]),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(color: Colors.grey, thickness: 0.5),
                      const SizedBox(height: 10),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '0012-01-000123-50-4',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                'BRI BritAma',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Icon(Icons.copy, size: 18, color: Colors.grey),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _MenuIcon(
                        icon: Icons.swap_horiz,
                        label: 'Transfer',
                        color: Colors.blue,
                      ),
                      _MenuIcon(
                        icon: Icons.account_balance_wallet,
                        label: 'BRIVA',
                        color: Colors.orange,
                      ),
                      _MenuIcon(
                        icon: Icons.phone_android,
                        label: 'Pulsa/Data',
                        color: Colors.green,
                      ),
                      _MenuIcon(
                        icon: Icons.account_balance,
                        label: 'E-Wallet',
                        color: Colors.blueAccent,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _MenuIcon(
                        icon: Icons.qr_code_scanner,
                        label: 'QRIS',
                        color: Colors.blue,
                      ),
                      _MenuIcon(
                        icon: Icons.receipt_long,
                        label: 'Tagihan',
                        color: Colors.redAccent,
                      ),
                      _MenuIcon(
                        icon: Icons.more_horiz,
                        label: 'Lainnya',
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 70,
                      ), // Spacer agar tetap rapi jika jumlah kurang dari 4
                    ],
                  ),
                ],
              ),
            ),

            // --- TAHAP 4: PROMO & INFO ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Promo & Info',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Lihat Semua'),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _PromoBanner(
                    color: Colors.blue[800]!,
                    title: 'Pesta Rakyat Simpedes',
                    subtitle: 'Nikmati kemeriahannya!',
                  ),
                  _PromoBanner(
                    color: Colors.orange[700]!,
                    title: 'Cashback 50% QRIS',
                    subtitle: 'Belanja jadi lebih hemat!',
                  ),
                  _PromoBanner(
                    color: Colors.teal[600]!,
                    title: 'Promo Merchant BRI',
                    subtitle: 'Diskon di berbagai resto.',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF00529C),
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'Mutasi'),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_active),
            label: 'Aktivitas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Akun',
          ),
        ],
      ),
    );
  }
}

// Widget Helper untuk Banner Promo
class _PromoBanner extends StatelessWidget {
  final Color color;
  final String title;
  final String subtitle;

  const _PromoBanner({
    required this.color,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            color,
            color.withAlpha(200),
          ], // Menggunakan color.withAlpha alih-alih opacity untuk kesederhanaan
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.white, fontSize: 13),
          ),
        ],
      ),
    );
  }
}

// Widget Helper untuk Icon Menu
class _MenuIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _MenuIcon({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
