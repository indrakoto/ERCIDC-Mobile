import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildForm() {
    return FadeTransition(
      opacity: _animation,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              height: 150,
              color: Colors.grey.shade300,
              child: Center(child: Image.asset('assets/erci_logo.png', height: 120) ),
            ),
            SizedBox(height: 16),
            Center(child: Text("Sign in to start your session", style: TextStyle(fontSize: 16))),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: "Email/ID Member",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Checkbox(value: true, onChanged: (_) {}),
                Text("Remember Me"),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 45)),
              child: Text("Login"),
            ),
            SizedBox(height: 12),
            TextButton(onPressed: () {}, child: Text("Lupa Password")),
            TextButton(
                onPressed: () {},
                child: Text("Registrasi Akun Login", style: TextStyle(decoration: TextDecoration.underline))),
            Text("*Bukan untuk member baru", style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Responsive: jika tablet, form ditengah dengan width terbatas
          return Center(
            child: Container(
              width: constraints.maxWidth > 600 ? 500 : double.infinity,
              child: _buildForm(),
            ),
          );
        },
      ),
    );
  }
}
