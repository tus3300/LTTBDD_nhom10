import 'package:flutter/material.dart';

class ThanhToanScreen extends StatefulWidget {
  @override
  _ThanhToanScreenState createState() => _ThanhToanScreenState();
}

class _ThanhToanScreenState extends State<ThanhToanScreen> {
  List<String> nganHangList = ['Ngân hàng A', 'Ngân hàng B', 'Ngân hàng C', 'Ngân hàng D'];
  String selectedBank = 'Ngân hàng A'; // Giá trị ban đầu cho DropdownButton

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thanh Toán'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Chọn Ngân Hàng:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            // DropdownButton để chọn ngân hàng
            DropdownButton<String>(
              value: selectedBank,
              onChanged: (newValue) {
                setState(() {
                  selectedBank = newValue!;
                });
              },
              items: nganHangList
                  .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  })
                  .toList(),
            ),
            SizedBox(height: 16),
            // Nút thêm ngân hàng
            ElevatedButton.icon(
              onPressed: () async {
                // Mở trang thêm ngân hàng và nhận kết quả
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThemNganHangScreen(nganHangList)),
                );

                // Nếu có kết quả, cập nhật danh sách ngân hàng
                if (result != null && result is String) {
                  setState(() {
                    nganHangList.add(result);
                    selectedBank = result;
                  });
                }
              },
              icon: Icon(Icons.add),
              label: Text('Thêm Ngân Hàng'),
            ),
          ],
        ),
      ),
    );
  }
}

class ThemNganHangScreen extends StatelessWidget {
  final List<String> nganHangList;

  ThemNganHangScreen(this.nganHangList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thêm Ngân Hàng'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Chọn Ngân Hàng:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            // DropdownButton để chọn ngân hàng khi thêm mới
            DropdownButton<String>(
              onChanged: (newValue) {
                // Xử lý khi người dùng chọn ngân hàng
              },
              items: nganHangList
                  .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  })
                  .toList(),
            ),
            SizedBox(height: 16),
            // Nút lưu ngân hàng mới
            ElevatedButton(
              onPressed: () {
                // Lưu ngân hàng mới và trả về kết quả
                Navigator.pop(context, 'Ngân hàng mới');
              },
              child: Text('Lưu Ngân Hàng Mới'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ThanhToanScreen(),
  ));
}
