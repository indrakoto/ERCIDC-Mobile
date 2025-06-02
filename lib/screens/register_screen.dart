import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  bool agreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Buat Akun Login Member")),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: Container(
              width: constraints.maxWidth > 600 ? 500 : double.infinity,
              padding: EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    Container(
                      height: 150,
                      color: Colors.grey.shade300,
                      child: Center(child: Image.asset('assets/erci_logo.png', height: 120) ),
                    ),
                    SizedBox(height: 16),
                    Center(child: Text("BUAT AKUN LOGIN MEMBER", style: TextStyle(fontSize: 16))),
                    SizedBox(height: 20),

                    // ID Member
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "ID Member",
                        prefixIcon: Icon(Icons.badge),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 12),

                    // Email
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Email Aktif",
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 12),

                    // Password
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 12),

                    // Retype Password
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Retype Password",
                        prefixIcon: Icon(Icons.lock_outline),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 12),

                    // Checkbox
                    Row(
                      children: [
                        Checkbox(
                          value: agreed,
                          onChanged: (value) {
                            setState(() => agreed = value!);
                          },
                        ),
                        Text("Setuju"),
                      ],
                    ),

                    // Create Button
                    ElevatedButton(
                      onPressed: agreed
                          ? () {
                        if (_formKey.currentState!.validate()) {
                          // Lakukan proses registrasi
                        }
                      }
                          : null,
                      style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 45)),
                      child: Text("Create"),
                    ),
                    SizedBox(height: 16),

                    // Links
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Login Member"),
                    ),
                    TextButton(
                      onPressed: () {}, // Lupa Password
                      child: Text("Lupa Password"),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text("Registrasi Akun Login", style: TextStyle(decoration: TextDecoration.underline)),
                    ),
                    Text("*Bukan untuk member baru", style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
