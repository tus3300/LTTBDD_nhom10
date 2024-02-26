import 'package:flutter/material.dart';
import 'RentMotorbike.dart';
import 'RentCar.dart';
import 'RentDriver.dart';
import 'RentBike.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  backgroundColor: Colors.transparent,
  elevation: 0,
  title: Text(
    'VTD Rental Vehicle',
    style: TextStyle(color: Colors.lightBlue),
  ),
  actions: [
    IconButton(
      icon: Icon(Icons.search, color:Colors.white),
      onPressed: () {
        
      },
    ),
  ],
),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            SizedBox(height: 16),
            _buildCategoryButtons(context),
            // Add other sections as needed
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('images/logobrand.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Hôm nay bạn muốn dùng loại xe nào',
            style: TextStyle(
              color: Colors.cyan,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButtons(BuildContext context) {
  double buttonWidth = (MediaQuery.of(context).size.width * 0.9 - 40) / 4; 

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5), 
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CategoryButton(
          label: 'Xe Máy',
          icon: Icons.motorcycle,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RentMotorbikePage()),
            );
          },
        ),
        CategoryButton(
          label: 'Ô Tô',
          icon: Icons.car_crash,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CarPage()), 
            );
          },
        ),
        CategoryButton(
          label: 'Người Lái',
          icon: Icons.person,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RentDriverPage()),
            );
          },
        ),
        CategoryButton(
          label: 'Xe Đạp',
          icon: Icons.directions_bike,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RentBikePage()),
            );
          },
        ),
      ],
    ),
  );
}

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
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
    );
  }
}

RentBikePage() {
}

RentDriverPage() {
}

RentMotorbikePage() {
}

class CategoryButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  CategoryButton({
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
    );
  }
}
