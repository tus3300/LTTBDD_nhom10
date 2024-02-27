import 'package:flutter/material.dart';
import 'profile/thanhToan.dart';
import 'profile/thongTinHD.dart';
import 'profile/diaChi.dart';
import 'profile/trungTam.dart';
import 'profile/dieuKhoan.dart';

void main() {
  runApp(My2App());
}

class My2App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ứng Dụng Thuê Xe',
      theme: ThemeData(
        primarySwatch: Colors.green,
        colorScheme: ThemeData().colorScheme.copyWith(
              secondary: Colors.greenAccent,
            ),
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _fullName = 'duc gay';
  String _phoneNumber = '';
  bool _isEditing = false;
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hồ Sơ'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    _isEditing = !_isEditing;
                  });
                },
                onHover: (hover) {
                  setState(() {
                    _isHovered = hover;
                  });
                },
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      color: _isHovered ? Colors.black : Colors.transparent,
                      width: 2.0,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                                radius: 50,
                                backgroundImage: AssetImage(
                                    'C:/AR/giao_dien_ho_so/images/anh-dai-dien-fb-dep.jpg')),
                            SizedBox(width: 16),
                            if (!_isEditing)
                              Expanded(
                                child: Text(
                                  _fullName,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        if (_isEditing) ...[
                          SizedBox(height: 16),
                          _buildEditableField(
                              'Họ Tên: ', _fullName, Icons.person),
                          SizedBox(height: 8),
                          _buildEditableField(
                              'Số Điện Thoại: ', _phoneNumber, Icons.phone),
                          SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              _saveProfileInformation();
                              setState(() {
                                _isEditing = false;
                              });
                            },
                            child: Text('Lưu Thông Tin'),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildSection('Thanh toán'),
                      _buildSection('Thông tin hóa đơn'),
                      _buildSection('Địa chỉ đã lưu'),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildSection('Trung tâm hỗ trợ'),
                      _buildSection('Điều khoản và Chính sách'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8),
              // Lịch Sử Chuyến Đi
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Lịch Sử Chuyến Đi',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(),
                      Text('Chưa có dữ liệu'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
      color: Colors.white,
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang Chủ'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Tin Tức'),
          BottomNavigationBarItem(icon: Icon(Icons.directions_car), label: 'Phương Tiện Đã Thuê'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Thông Tin Cá Nhân'),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    ),
  );

  }

  Widget _buildSection(String sectionTitle) {
    return InkWell(
      onTap: () {
        if (sectionTitle == 'Thanh toán') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ThanhToanScreen()),
          );
        }
        if (sectionTitle == 'Thông tin hóa đơn') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ThongTinHoaDon()),
          );
        }
        if (sectionTitle == 'Địa chỉ đã lưu') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DiaChi()),
          );
        }
        if (sectionTitle == 'Trung tâm hỗ trợ') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TrungTamHoTro()),
          );
        }
        if (sectionTitle == 'Điều khoản và Chính sách') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DieuKhoanChinhSach()),
          );
        }
      },
      child: Ink(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.black),
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sectionTitle,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditableField(String label, String value, IconData icon) {
    return _isEditing
        ? TextFormField(
            onChanged: (newValue) {
              setState(() {
                value = newValue;
              });
            },
            initialValue: value,
            decoration: InputDecoration(
              labelText: label,
              icon: Icon(icon),
            ),
          )
        : Text(
            '$label $value',
            style: TextStyle(fontSize: 16),
          );
  }

  void _saveProfileInformation() {
    print('Số Điện Thoại: $_phoneNumber');
  }
}
