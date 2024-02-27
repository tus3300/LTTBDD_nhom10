import 'package:flutter/material.dart';

class DieuKhoanChinhSach extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Điều Khoản và Chính Sách'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Điều Khoản và Chính Sách',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'Đây là phần mô tả về các điều khoản và chính sách của chúng tôi.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Chúng tôi cam kết bảo vệ thông tin cá nhân của bạn và đảm bảo một trải nghiệm an toàn khi sử dụng ứng dụng của chúng tôi.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Nếu bạn có bất kỳ câu hỏi nào, hãy liên hệ với chúng tôi để biết thêm chi tiết.',
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
    home: DieuKhoanChinhSach(),
  ));
}
