import 'package:flutter/material.dart';

class TrungTamHoTro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trung Tâm Hỗ Trợ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Chào mừng bạn đến Trung Tâm Hỗ Trợ!',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'Chúng tôi sẽ cung cấp sự hỗ trợ tốt nhất cho bạn. Hãy liên hệ nếu bạn có bất kỳ câu hỏi hoặc vấn đề nào.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Email Hỗ Trợ: support@example.com',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TrungTamHoTro(),
  ));
}
