import 'package:flutter/material.dart';

class DataWebPage extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String job;
  final String nationalId;

  const DataWebPage({
    super.key, 
    required this.name,
    required this.email,
    required this.phone,
    required this.job,
    required this.nationalId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: $name'),
            Text('Email: $email'),
            Text('Phone: $phone'),
            Text('Job: $job'),
            Text('National ID: $nationalId'),
          ],
        ),
      ),
    );
  }
}
