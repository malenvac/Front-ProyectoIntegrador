import 'package:flutter/material.dart';

class StoreCreationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Store'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Store Name'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Store Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle store creation logic here
              },
              child: Text('Create Store'),
            ),
          ],
        ),
      ),
    );
  }
}
