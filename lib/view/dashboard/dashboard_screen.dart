import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard Screen"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Text("Dashboard Screen"),
            )
          ],
        ),
      ),
    );
  }
}
