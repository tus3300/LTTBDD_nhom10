import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String selectedVehicleType = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('images/thue-xe-tu-lai.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/your_large_image.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CategoryButton(
                      label: 'Xe Máy',
                      icon: Icons.motorcycle,
                      onPressed: () {
                        setState(() {
                          selectedVehicleType = 'Xe Máy';
                        });
                      },
                    ),
                    CategoryButton(
                      label: 'Ô Tô',
                      icon: Icons.car_crash,
                      onPressed: () {
                        setState(() {
                          selectedVehicleType = 'Ô Tô';
                        });
                      },
                    ),
                    CategoryButton(
                      label: 'Người Lái',
                      icon: Icons.person,
                      onPressed: () {
                        setState(() {
                          selectedVehicleType = 'Người Lái';
                        });
                      },
                    ),
                    CategoryButton(
                      label: 'Xe Đạp',
                      icon: Icons.directions_bike,
                      onPressed: () {
                        setState(() {
                          selectedVehicleType = 'Xe Đạp';
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 16),
                // Nội dung hiển thị dựa trên loại xe được chọn
                if (selectedVehicleType == 'Xe Máy')
                  VehicleDetailsWidget(
                    vehicleInfo: 'Thông tin xe máy',
                    vehicleImage: 'assets/motorcycle.jpg',
                  ),
                if (selectedVehicleType == 'Ô Tô')
                  VehicleDetailsWidget(
                    vehicleInfo: 'Thông tin ô tô',
                    vehicleImage: 'assets/car.jpg',
                  ),
                if (selectedVehicleType == 'Người Lái')
                  DriverDetailsWidget(
                    driverInfo: 'Thông tin người lái',
                    driverImage: 'assets/driver.jpg',
                  ),
                if (selectedVehicleType == 'Xe Đạp')
                  BicycleDetailsWidget(
                    bicycleInfo: 'Thông tin xe đạp',
                    bicycleImage: 'assets/bicycle.jpg',
                  ),

                Container(
                  height: 100,
                  child: GestureDetector(
                    onHorizontalDragUpdate: (details) {
                      print(details.primaryDelta);
                    },
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        AdVideo(
                            videoUrl:
                                'https://www.youtube.com/watch?v=DnTL4wDAbK0&pp=ygUSa2F3YXNha2kgbmluamEgaDJy',
                            imageUrl: 'images/kawasaki.jpg'),
                        AdVideo(
                            videoUrl:
                                'https://www.youtube.com/watch?v=ba7JNTI17uo&pp=ygUVbGFtYm9yZ2hpbmkgYXZlbnRhZG9y',
                            imageUrl: 'images/fixgear.jpg'),
                        AdVideo(
                            videoUrl:
                                'https://www.youtube.com/watch?v=DJUmq8RXeOU&pp=ygUUeGUgxJHhuqFwIGZpeGVkIGdlYXI%3D',
                            imageUrl: 'images/lambor.jpg'),
                        AdVideo(
                            videoUrl:
                                'https://www.youtube.com/watch?v=nX5e1Wxw0SI&pp=ygUMdG95b3RhIHJhaXpl',
                            imageUrl: 'images/lexus.jpg'),
                        AdVideo(
                            videoUrl:
                                'https://www.youtube.com/watch?v=lCdRR2AA44E&pp=ygULbGV4dXMgcngzNTA%3D',
                            imageUrl: 'images/rollroyce.jpg'),
                        AdVideo(
                            videoUrl:
                                'https://www.youtube.com/watch?v=L_iHNMLrPwM&pp=ygURcm9sbHMgcm95Y2UgZ2hvc3Q%3D',
                            imageUrl: 'images/toyota.jpg'),
                      ],
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          NewsBlock(
                              title: 'Tin Tức 1',
                              content: 'Nội dung tin tức 1',
                              imageUrl: 'images/kawasaki.jpg'),
                          NewsBlock(
                              title: 'Tin Tức 2',
                              content: 'Nội dung tin tức 2',
                              imageUrl: 'images/fixgear.jpg'),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          NewsBlock(
                              title: 'Tin Tức 3',
                              content: 'Nội dung tin tức 3',
                              imageUrl: 'images/lambor.jpg'),
                          NewsBlock(
                              title: 'Tin Tức 4',
                              content: 'Nội dung tin tức 4',
                              imageUrl: 'images/lexus.jpg'),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          NewsBlock(
                              title: 'Tin Tức 5',
                              content: 'Nội dung tin tức 5',
                              imageUrl: 'images/rollroyce.jpg'),
                          NewsBlock(
                              title: 'Tin Tức 6',
                              content: 'Nội dung tin tức 6',
                              imageUrl: 'images/toyota.jpg'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              child: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Trang Chủ'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.article), label: 'Tin Tức'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.directions_car),
                      label: 'Phương Tiện Đã Thuê'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: 'Thông Tin Cá Nhân'),
                ],
                selectedItemColor: Colors.blue,
                unselectedItemColor: Colors.grey,
                showSelectedLabels: false,
                showUnselectedLabels: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
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

class VehicleDetailsWidget extends StatelessWidget {
  final String vehicleInfo;
  final String vehicleImage;

  VehicleDetailsWidget({
    required this.vehicleInfo,
    required this.vehicleImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Your vehicle details widget code here
    );
  }
}

class DriverDetailsWidget extends StatelessWidget {
  final String driverInfo;
  final String driverImage;

  DriverDetailsWidget({
    required this.driverInfo,
    required this.driverImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Your driver details widget code here
    );
  }
}

class BicycleDetailsWidget extends StatelessWidget {
  final String bicycleInfo;
  final String bicycleImage;

  BicycleDetailsWidget({
    required this.bicycleInfo,
    required this.bicycleImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Your bicycle details widget code here
    );
  }
}

class AdVideo extends StatelessWidget {
  final String videoUrl;
  final String imageUrl;

  AdVideo({
    required this.videoUrl,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Your ad video widget code here
    );
  }
}

class NewsBlock extends StatelessWidget {
  final String title;
  final String content;
  final String imageUrl;

  NewsBlock({
    required this.title,
    required this.content,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Your news block widget code here
    );
  }
}
