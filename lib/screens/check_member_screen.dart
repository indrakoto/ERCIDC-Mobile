import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:erci_dc_2025/utils/app_colors.dart';

// 🎨 List warna lembut
/*final List<Color> softColors = [
  Color(0xFFE3F2FD), // Biru muda
  Color(0xFFF1F8E9), // Hijau muda
  Color(0xFFFFF9C4), // Kuning pastel
  Color(0xFFFFEBEE), // Merah muda pucat
  Color(0xFFF3E5F5), // Ungu muda
  Color(0xFFE0F7FA), // Cyan muda
  Color(0xFFFFF3E0), // Oranye muda
];*/

class CheckMemberScreen extends StatefulWidget {
  @override
  _CheckMemberScreenState createState() => _CheckMemberScreenState();
}

class _CheckMemberScreenState extends State<CheckMemberScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> _results = [];
  bool _loading = false;
  Timer? _debounce;

  @override
  void dispose() {
    _controller.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String keyword) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(Duration(milliseconds: 500), () {
      if (keyword.length >= 3) {
        _searchMember(keyword);
      } else {
        setState(() => _results = []);
      }
    });
  }

  void _searchMember(String keyword) async {
    setState(() {
      _loading = true;
      _results = [];
    });

    final url = Uri.parse("https://apps.ercidepokchapter.com/api/member/search?keyword=$keyword");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      setState(() {
        _results = data.map<Map<String, dynamic>>((item) {
          return {
            'member_name': item['member_name'] ?? '',
            'alias': item['alias'] ?? '',
            'no_pol': item['no_pol'] ?? '',
            'chapter': item['chapter'] ?? '',
            'member_image': item['member_image'] ?? '',
            'alamat_lengkap': [
              item['alamat'],
              item['kelurahan'],
              item['kecamatan'],
              item['city']
            ].where((e) => e != null && e.toString().trim().isNotEmpty).join(', '),
          };
        }).toList();
        _loading = false;
      });
    } else {
      setState(() => _loading = false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Gagal memuat data')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cek Member")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // TextField pencarian
            TextField(
              controller: _controller,
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                hintText: 'Cari id, nama atau no.polisi...',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20),

            // Loading atau Hasil
            Expanded(
              child: _loading
                  ? Center(child: CircularProgressIndicator())
                  : _results.isEmpty
                  ? Center(child: Text("Belum ada hasil pencarian"))
                  : ListView.builder(
                itemCount: _results.length,
                itemBuilder: (context, index) {
                  final item = _results[index];

                  return Card(
                    //color: softColors[index % softColors.length], // Warna bergilir
                    color: AppColors.softColors[index % AppColors.softColors.length],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    margin: EdgeInsets.symmetric(vertical: 8),
                    elevation: 3,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: item['member_image'].isNotEmpty
                                ? NetworkImage("https://apps.ercidepokchapter.com/${item['member_image']}")
                                : null,
                            backgroundColor: Colors.grey[300],
                            child: item['member_image'].isEmpty
                                ? Icon(Icons.person, color: Colors.white)
                                : null,
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item['member_name'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                SizedBox(height: 4),
                                Text("Alias: ${item['alias']}"),
                                Text("No Pol: ${item['no_pol']}"),
                                Text("Alamat: ${item['alamat_lengkap']}"),
                                Text("Chapter: ${item['chapter']}"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );


                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}