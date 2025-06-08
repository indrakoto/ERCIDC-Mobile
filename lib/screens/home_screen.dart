import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/menu_item.dart';
import '../widgets/menu_card.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'check_member_screen.dart';
import '../utils/navigation_helper.dart';
import '../utils/menu_colors.dart';

class HomeScreen extends StatelessWidget {
  final List<MenuItem> items = [
    MenuItem(title: "Login ke Sistem", icon: Icons.lock, color: MenuColors.pastelGreen),
    MenuItem(title: "Buat Akun", icon: Icons.vpn_key, color: MenuColors.pastelBlue),
    MenuItem(title: "Lupa Password", icon: Icons.sentiment_dissatisfied, color: MenuColors.pastelRed),
    MenuItem(title: "Daftar Anggota Baru", icon: Icons.person_add, color: MenuColors.pastelOrange),
    MenuItem(title: "Registrasi Ulang", icon: Icons.recycling, color: MenuColors.pastelAmber),
    MenuItem(title: "Cari/Cek Member", icon: Icons.search, color: MenuColors.pastelTeal),
  ];

  void handleMenuTap(BuildContext context, String title) {
    switch (title) {
      case "Login ke Sistem":
        navigateWithTransition(context, LoginScreen());
        break;
      case "Buat Akun":
        navigateWithTransition(context, RegisterScreen());
        break;
      case "Cari/Cek Member":
        navigateWithTransition(context, CheckMemberScreen());
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Fitur \"$title\" belum diimplementasikan")),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ERCIDC", style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: items.map((item) {
            return Material(
              color: item.color,
              borderRadius: BorderRadius.circular(25),
              child: InkWell(
                onTap: () => handleMenuTap(context, item.title),
                //borderRadius: BorderRadius.circular(16),
                splashColor: Colors.black12,
                highlightColor: Colors.white.withOpacity(0.1),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(item.icon, size: 36, color: Colors.black87),
                      SizedBox(height: 12),
                      Text(
                        item.title,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
