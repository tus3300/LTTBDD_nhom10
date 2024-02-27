import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quản lý Hóa đơn',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InvoiceScreen(),
    );
  }
}

class InvoiceScreen extends StatefulWidget {
  @override
  _InvoiceScreenState createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  List<Invoice> invoices = [
    Invoice(id: '1', status: InvoiceStatus.renting),
    Invoice(id: '2', status: InvoiceStatus.completed),
  ];

  bool paymentSuccessful = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quản lý Hóa đơn'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildInvoiceSection(InvoiceStatus.renting),
                  _buildInvoiceSection(InvoiceStatus.completed),
                ],
              ),
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
  Widget _buildInvoiceSection(InvoiceStatus status) {
    final filteredInvoices =
        invoices.where((invoice) => invoice.status == status).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            _getStatusTitle(status),
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        if (filteredInvoices.isNotEmpty)
          Column(
            children: filteredInvoices.map((invoice) {
              return _buildInvoiceCard(invoice);
            }).toList(),
          ),
        if (filteredInvoices.isEmpty)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Không có hóa đơn ${_getStatusTitle(status)}'),
          ),
      ],
    );
  }

  Widget _buildInvoiceCard(Invoice invoice) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(invoice.id),
        subtitle: Text('Trạng thái: ${_getStatusTitle(invoice.status)}'),
        trailing: invoice.status == InvoiceStatus.completed
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _handlePayment(invoice);
                    },
                    child: Text('Thanh toán'),
                  ),
                  SizedBox(width: 8),
                  if (paymentSuccessful)
                    InkWell(
                      onTap: () {
                        _handleRating(invoice);
                      },
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.star, color: Colors.white),
                      ),
                    ),
                ],
              )
            : null,
      ),
    );
  }

  void _handlePayment(Invoice invoice) {
    // Thực hiện logic thanh toán
    print('Thanh toán ${invoice.id}');

    // Cập nhật trạng thái hóa đơn thành 'Đã hoàn thành'
    setState(() {
      invoice.status = InvoiceStatus.completed;
      paymentSuccessful = true;
    });
  }

  void _handleRating(Invoice invoice) {
    // Hiển thị màn hình đánh giá
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RatingScreen(invoiceId: invoice.id),
      ),
    );
  }

  String _getStatusTitle(InvoiceStatus status) {
    switch (status) {
      case InvoiceStatus.renting:
        return 'Đang Thuê';
      case InvoiceStatus.completed:
        return 'Đã Hoàn Thành';
      default:
        return '';
    }
  }
}

class RatingScreen extends StatelessWidget {
  final String invoiceId;

  RatingScreen({required this.invoiceId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đánh Giá và Bình Luận'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Đánh giá và bình luận cho hóa đơn $invoiceId',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Thêm các thành phần khác của màn hình đánh giá ở đây
          ],
        ),
      ),
    );
  }
}

enum InvoiceStatus {
  renting,
  completed,
}

class Invoice {
  final String id;
  InvoiceStatus status;

  Invoice({required this.id, required this.status});
}
