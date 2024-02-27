import 'package:flutter/material.dart';

class ThongTinHoaDon extends StatefulWidget {
  @override
  _ThongTinHoaDonScreenState createState() => _ThongTinHoaDonScreenState();
}

class _ThongTinHoaDonScreenState extends State<ThongTinHoaDon> {
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
            // Phần thông tin hóa đơn ở đây
            Text(
              'Thông Tin Hóa Đơn',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // Thêm các trường thông tin hóa đơn tại đây

            SizedBox(height: 16),

            // Nút thanh toán
            ElevatedButton(
              onPressed: () {
                // Xử lý logic thanh toán ở đây
                print('Thực hiện thanh toán...');
              },
              child: Text('Thanh Toán'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ThongTinHoaDon(),
  ));
}
