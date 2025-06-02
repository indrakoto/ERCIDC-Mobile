import 'package:flutter/material.dart';
import '../models/menu_item.dart';
import '../widgets/menu_card.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'check_member_screen.dart';
import '../utils/navigation_helper.dart';


class HomeScreenOld extends StatelessWidget {
  final List<MenuItem> items = [
    MenuItem(title: "Login ke Sistem", icon: Icons.lock, color: Colors.green),
    MenuItem(title: "Buat Akun", icon: Icons.vpn_key, color: Colors.lightBlue),
    MenuItem(title: "Lupa Password", icon: Icons.sentiment_dissatisfied, color: Colors.red),
    MenuItem(title: "Daftar Anggota Baru", icon: Icons.person_add, color: Colors.orange),
    MenuItem(title: "Registrasi Ulang", icon: Icons.recycling, color: Colors.amber),
    MenuItem(title: "Cari/Cek Member", icon: Icons.search, color: Colors.teal),
  ];

  void handleMenuTap(BuildContext context, String title) {
    switch (title) {
      case "Login ke Sistem":
      //Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
        navigateWithTransition(context, LoginScreen());
        break;
      case "Buat Akun":
      //Navigator.push(context, MaterialPageRoute(builder: (_) => RegisterScreen()));
        navigateWithTransition(context, RegisterScreen());
        break;
      case "Cari/Cek Member":
      //Navigator.push(context, MaterialPageRoute(builder: (_) => CheckMemberScreen()));
        navigateWithTransition(context, CheckMemberScreen());
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Belum diimplementasikan")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ERCIDC")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: items
              .map((item) => MenuCard(
            item: item,
            onTap: () => handleMenuTap(context, item.title),
          ))
              .toList(),
        ),
      ),
    );
  }
}