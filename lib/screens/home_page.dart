import 'package:flutter/material.dart';
import '../models/menu_data.dart';
import '../models/promo_data.dart';
import '../widgets/menu_icon.dart';
import '../widgets/promo_banner.dart';

class BrimoHomePage extends StatefulWidget {
  const BrimoHomePage({super.key});

  @override
  State<BrimoHomePage> createState() => _BrimoHomePageState();
}

class _BrimoHomePageState extends State<BrimoHomePage> {
  bool _isBalanceVisible = false;

  // Materi Pertemuan 2: Data Model List (OOP)
  final List<MenuData> _menuList = [
    MenuData(icon: Icons.swap_horiz, label: 'Transfer', color: Colors.blue),
    MenuData(icon: Icons.account_balance_wallet, label: 'BRIVA', color: Colors.orange),
    MenuData(icon: Icons.phone_android, label: 'Pulsa/Data', color: Colors.green),
    MenuData(icon: Icons.account_balance, label: 'E-Wallet', color: Colors.blueAccent),
    MenuData(icon: Icons.qr_code_scanner, label: 'QRIS', color: Colors.blue),
    MenuData(icon: Icons.receipt_long, label: 'Tagihan', color: Colors.redAccent),
    MenuData(icon: Icons.more_horiz, label: 'Lainnya', color: Colors.grey),
  ];

  final List<PromoData> _promoList = [
    PromoData(
      imageUrl: 'https://images.unsplash.com/photo-1513151233558-d860c5398176?w=500&auto=format&fit=crop',
      title: 'Pesta Rakyat Simpedes',
      subtitle: 'Nikmati kemeriahannya!',
    ),
    PromoData(
      imageUrl: 'https://images.unsplash.com/photo-1556742111-a301076d9d18?w=500&auto=format&fit=crop',
      title: 'Cashback 50% QRIS',
      subtitle: 'Belanja jadi lebih hemat!',
    ),
    PromoData(
      imageUrl: 'https://images.unsplash.com/photo-1554118811-1e0d58224f24?w=500&auto=format&fit=crop',
      title: 'Promo Merchant BRI',
      subtitle: 'Diskon di berbagai resto.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'BRImo',
          style: TextStyle(
            color: Color(0xFF00529C),
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Color(0xFF00529C)),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.help_outline, color: Color(0xFF00529C)),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- TAHAP PENINGKATAN 4: STACK & POSITIONED ---
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 140,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                        'SYAMSUL ARIFIN',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 80,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width - 40,
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
                          const Text('Saldo Rekening Utama', style: TextStyle(color: Colors.grey, fontSize: 14)),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _isBalanceVisible ? 'Rp 1.000.000.000.000' : 'Rp •••••••••••••',
                                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF00529C)),
                              ),
                              GestureDetector(
                                onTap: () => setState(() => _isBalanceVisible = !_isBalanceVisible),
                                child: Icon(_isBalanceVisible ? Icons.visibility : Icons.visibility_off, color: Colors.blue[300]),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Divider(color: Colors.grey, thickness: 0.5),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('0012-01-000123-50-4', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                  Text('BRI BritAma', style: TextStyle(color: Colors.grey, fontSize: 12)),
                                ],
                              ),
                              const Icon(Icons.copy, size: 18, color: Colors.grey),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 110),
            
            // --- TAHAP PENINGKATAN 3 (UPDATE): GRIDVIEW.BUILDER ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 10,
                ),
                itemCount: _menuList.length,
                itemBuilder: (context, index) {
                  return MenuIcon(
                    icon: _menuList[index].icon,
                    label: _menuList[index].label,
                    color: _menuList[index].color,
                  );
                },
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Promo & Info', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('Lihat Semua', style: TextStyle(color: Color(0xFF00529C), fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            // --- TAHAP PENINGKATAN 5 (UPDATE): LISTVIEW.BUILDER ---
            SizedBox(
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: _promoList.length,
                itemBuilder: (context, index) {
                  return PromoBanner(
                    imageUrl: _promoList[index].imageUrl,
                    title: _promoList[index].title,
                    subtitle: _promoList[index].subtitle,
                  );
                },
              ),
            ),
            const SizedBox(height: 50),
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
          BottomNavigationBarItem(icon: Icon(Icons.notifications_active), label: 'Aktivitas'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Akun'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF00529C),
        shape: const CircleBorder(),
        child: const Icon(Icons.qr_code_scanner, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
