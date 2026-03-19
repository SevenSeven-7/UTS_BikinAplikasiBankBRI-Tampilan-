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
                  'bri',
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
            const CircularProgressIndicator(
              color: Colors.white,
            ),
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
              'bri',
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
      body: const Center(
        child: Text(
          'Selamat Datang di BRImo\n(Tahap 1: Struktur Dasar)',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ),
    );
  }
}
