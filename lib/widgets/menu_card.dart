import 'package:flutter/material.dart';
import '../models/menu_item.dart';

class MenuCard extends StatelessWidget {
  final MenuItem item;
  final VoidCallback onTap;

  MenuCard({required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(25),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 100,
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(item.icon, color: Colors.white, size: 30),
              SizedBox(height: 8),
              Text(item.title, style: TextStyle(color: Colors.white)),
              SizedBox(height: 8),
              Text("Go ➜", style: TextStyle(color: Colors.white70)),
            ],
          ),
        ),
      ),
    );
  }
}
