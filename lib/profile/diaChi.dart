import 'package:flutter/material.dart';

class DiaChi extends StatefulWidget {
  @override
  _DiaChiScreenState createState() => _DiaChiScreenState();
}

class _DiaChiScreenState extends State<DiaChi> {
  String selectedType = 'Nhà Riêng'; // Loại địa chỉ
  TextEditingController addressController = TextEditingController(); // Địa chỉ chi tiết
  TextEditingController destinationController = TextEditingController(); // Điểm đến

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thông Tin Hóa Đơn'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Phần chọn loại địa chỉ
            Text(
              'Chọn Loại Địa Chỉ:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            DropdownButton<String>(
              value: selectedType,
              onChanged: (newValue) {
                setState(() {
                  selectedType = newValue!;
                });
              },
              items: ['Nhà Riêng', 'Địa Chỉ Làm Việc', 'Thêm Địa Chỉ Mới']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16),

            // Phần nhập địa chỉ chi tiết
            Text(
              'Địa Chỉ Chi Tiết:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                hintText: 'Nhập địa chỉ chi tiết',
              ),
            ),
            SizedBox(height: 16),

            // Phần nhập điểm đến
            Text(
              'Điểm Đến:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            TextField(
              controller: destinationController,
              decoration: InputDecoration(
                hintText: 'Nhập điểm đến',
              ),
            ),
            SizedBox(height: 16),

            // Nút thêm địa chỉ mới và điểm đến
            ElevatedButton(
              onPressed: () async {
                // Mở màn hình chỉnh sửa thông tin
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChinhSuaThongTinScreen(
                      selectedType: selectedType,
                      address: addressController.text,
                      destination: destinationController.text,
                    ),
                  ),
                );

                // Nếu có kết quả, cập nhật thông tin
                if (result != null && result is Map<String, String>) {
                  setState(() {
                    selectedType = result['type']!;
                    addressController.text = result['address']!;
                    destinationController.text = result['destination']!;
                  });
                }
              },
              child: Text('Chỉnh Sửa Thông Tin'),
            ),
          ],
        ),
      ),
    );
  }
}

class ChinhSuaThongTinScreen extends StatefulWidget {
  final String selectedType;
  final String address;
  final String destination;

  ChinhSuaThongTinScreen({required this.selectedType, required this.address, required this.destination});

  @override
  _ChinhSuaThongTinScreenState createState() => _ChinhSuaThongTinScreenState();
}

class _ChinhSuaThongTinScreenState extends State<ChinhSuaThongTinScreen> {
  TextEditingController newAddressController = TextEditingController();
  TextEditingController newDestinationController = TextEditingController();
  String newSelectedType = '';

  @override
  void initState() {
    super.initState();
    newSelectedType = widget.selectedType;
    newAddressController.text = widget.address;
    newDestinationController.text = widget.destination;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chỉnh Sửa Thông Tin'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Phần chọn loại địa chỉ
            Text(
              'Chọn Loại Địa Chỉ:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            DropdownButton<String>(
              value: newSelectedType,
              onChanged: (newValue) {
                setState(() {
                  newSelectedType = newValue!;
                });
              },
              items: ['Nhà Riêng', 'Địa Chỉ Làm Việc']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16),

            // Phần nhập địa chỉ chi tiết mới
            Text(
              'Địa Chỉ Chi Tiết Mới:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            TextField(
              controller: newAddressController,
              decoration: InputDecoration(
                hintText: 'Nhập địa chỉ chi tiết mới',
              ),
            ),
            SizedBox(height: 16),

            // Phần nhập điểm đến mới
            Text(
              'Điểm Đến Mới:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            TextField(
              controller: newDestinationController,
              decoration: InputDecoration(
                hintText: 'Nhập điểm đến mới',
              ),
            ),
            SizedBox(height: 16),

            // Nút lưu thông tin mới
            ElevatedButton(
              onPressed: () {
                // Lưu thông tin mới và trở về với kết quả
                Map<String, String> newInfo = {
                  'type': newSelectedType,
                  'address': newAddressController.text,
                  'destination': newDestinationController.text,
                };
                Navigator.pop(context, newInfo);
              },
              child: Text('Lưu Thông Tin Mới'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DiaChi(),
  ));
}
