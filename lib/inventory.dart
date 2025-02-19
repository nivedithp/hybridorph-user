import 'package:flutter/material.dart';

class InventoryPage extends StatelessWidget {
  final List<Map<String, String>> inventory = [
    {'product': 'Rice', 'category': 'Cooking', 'stock': 'Low Stock'},
    {'product': 'Soap', 'category': 'Cleaning', 'stock': 'Out of Stock'},
    {'product': 'Detergent', 'category': 'Cleaning', 'stock': 'Low Stock'},
    {'product': 'Onion', 'category': 'Cooking', 'stock': 'In Stock'},
    {'product': 'Carrot', 'category': 'Cooking', 'stock': 'In Stock'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.brown[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ChoiceChip(label: Text('All'), selected: true),
                SizedBox(width: 8),
                ChoiceChip(label: Text('Cooking'), selected: false),
                SizedBox(width: 8),
                ChoiceChip(label: Text('Cleaning'), selected: false),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  Table(
                    border: TableBorder.all(),
                    columnWidths: {
                      0: FlexColumnWidth(2),
                      1: FlexColumnWidth(2),
                      2: FlexColumnWidth(2),
                    },
                    children: [
                      _buildTableHeader(),
                      ...inventory
                          .map((item) => _buildTableRow(context, item))
                          .toList(),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UpdatePage()),
                );
              },
              child: Text('UPDATE'),
            ),
          ],
        ),
      ),
    );
  }

  TableRow _buildTableHeader() {
    return TableRow(
      decoration: BoxDecoration(color: Colors.grey[300]),
      children: [
        _buildTableCell('Product', isHeader: true),
        _buildTableCell('Category', isHeader: true),
        _buildTableCell('Stock', isHeader: true),
      ],
    );
  }

  TableRow _buildTableRow(BuildContext context, Map<String, String> item) {
    return TableRow(
      children: [
        _buildTableCell(item['product']!),
        _buildTableCell(item['category']!),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UpdatePage(),
              ),
            );
          },
          child: _buildTableCell(item['stock']!),
        ),
      ],
    );
  }

  Widget _buildTableCell(String text, {bool isHeader = false}) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: isHeader ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}

class UpdatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.brown[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField(
              decoration: InputDecoration(labelText: 'Category'),
              items: ['Cooking', 'Cleaning'].map((String category) {
                return DropdownMenuItem(value: category, child: Text(category));
              }).toList(),
              onChanged: (value) {},
            ),
            SizedBox(height: 16),
            DropdownButtonFormField(
              decoration: InputDecoration(labelText: 'Product'),
              items: ['Rice', 'Soap', 'Detergent', 'Onion', 'Carrot']
                  .map((String product) {
                return DropdownMenuItem(value: product, child: Text(product));
              }).toList(),
              onChanged: (value) {},
            ),
            SizedBox(height: 16),
            DropdownButtonFormField(
              decoration: InputDecoration(labelText: 'Stock'),
              items:
                  ['In Stock', 'Low Stock', 'Out of Stock'].map((String stock) {
                return DropdownMenuItem(value: stock, child: Text(stock));
              }).toList(),
              onChanged: (value) {},
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {},
              child: Text('SUBMIT'),
            ),
          ],
        ),
      ),
    );
  }
}
