import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  get selectedVehicleType => null;

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Ẩn nút back
        flexibleSpace: Container(
          width: double.infinity,
          height: deviceSize.height / 4,
          decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage('images/thue-xe-tu-lai.jpg'),
            fit: BoxFit.cover,
      ),
    ),
  ),
),

      body: Stack(
        children: [
          Container(            
          ),

          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CategoryButton(
                      label: 'Xe Máy',
                      icon: Icons.motorcycle,
                      onPressed: () {
                      },
                    ),
                    CategoryButton(
                      label: 'Ô Tô',
                      icon: Icons.car_crash,
                      onPressed: () {
                      },
                    ),
                    CategoryButton(
                      label: 'Người Lái',
                      icon: Icons.person,
                      onPressed: () {
                      },
                    ),
                    CategoryButton(
                      label: 'Xe Đạp',
                      icon: Icons.directions_bike,
                      onPressed: () {
                      },
                    ),
                  ],
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
                        AdVideo(videoUrl: 'https://www.youtube.com/watch?v=DnTL4wDAbK0&pp=ygUSa2F3YXNha2kgbmluamEgaDJy', imageUrl: 'images/kawasaki.jpg'),
                        AdVideo(videoUrl: 'https://www.youtube.com/watch?v=ba7JNTI17uo&pp=ygUVbGFtYm9yZ2hpbmkgYXZlbnRhZG9y', imageUrl: 'images/fixgear.jpg'),
                        AdVideo(videoUrl: 'https://www.youtube.com/watch?v=DJUmq8RXeOU&pp=ygUUeGUgxJHhuqFwIGZpeGVkIGdlYXI%3D', imageUrl: 'images/lambor.jpg'),
                        AdVideo(videoUrl: 'https://www.youtube.com/watch?v=nX5e1Wxw0SI&pp=ygUMdG95b3RhIHJhaXpl', imageUrl: 'images/lexus.jpg'),
                        AdVideo(videoUrl: 'https://www.youtube.com/watch?v=lCdRR2AA44E&pp=ygULbGV4dXMgcngzNTA%3D', imageUrl: 'images/rollroyce.jpg'),
                        AdVideo(videoUrl: 'https://www.youtube.com/watch?v=L_iHNMLrPwM&pp=ygURcm9sbHMgcm95Y2UgZ2hvc3Q%3D', imageUrl: 'images/toyota.jpg'),
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
                          NewsBlock(title: 'Tin Tức 1', content: 'Nội dung tin tức 1', imageUrl: 'images/kawasaki.jpg'),
                          NewsBlock(title: 'Tin Tức 2', content: 'Nội dung tin tức 2', imageUrl: 'images/fixgear.jpg'),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          NewsBlock(title: 'Tin Tức 3', content: 'Nội dung tin tức 3', imageUrl: 'images/lambor.jpg'),
                          NewsBlock(title: 'Tin Tức 4', content: 'Nội dung tin tức 4', imageUrl: 'images/lexus.jpg'),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          NewsBlock(title: 'Tin Tức 5', content: 'Nội dung tin tức 5', imageUrl: 'images/rollroyce.jpg'),
                          NewsBlock(title: 'Tin Tức 6', content: 'Nội dung tin tức 6', imageUrl: 'images/toyota.jpg'),
                        ],
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Phương Tiện Đã Thuê',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
          ),
        ],
      ),
    );
  }
}

class RoundedIcon extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  RoundedIcon({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      margin: EdgeInsets.all(8),
      child: GestureDetector(
        onTap: onTap,
        child: CircleAvatar(
          backgroundColor: Color.fromARGB(255, 8, 170, 219),
          radius: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, size: 30, color: Colors.white),
              SizedBox(height: 8),
              Text(title, style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
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
      width: 150,
      height: 100,
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: imageUrl.isNotEmpty
          ? Image.network(imageUrl, fit: BoxFit.cover)
          : Center(
              child: Text('Video Placeholder'),
            ),
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailPage(
              title: title,
              content: content,
              imageUrl: imageUrl,
            ),
          ),
        );
      },
      child: Container(
        width: 200,
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageUrl,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(content),
          ],
        ),
      ),
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
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            vehicleInfo,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Image.asset(
            vehicleImage,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ],
      ),
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
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            driverInfo,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Image.asset(
            driverImage,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ],
      ),
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
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            bicycleInfo,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Image.asset(
            bicycleImage,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
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

class NewsDetailPage extends StatelessWidget {
  final String title;
  final String content;
  final String imageUrl;

  NewsDetailPage({
    required this.title,
    required this.content,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(content),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
