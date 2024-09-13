import 'package:collect_data/qr.dart';
import 'package:flutter/material.dart';

class PersonalInfoForm extends StatefulWidget {
  const PersonalInfoForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PersonalInfoFormState createState() => _PersonalInfoFormState();
}

class _PersonalInfoFormState extends State<PersonalInfoForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nationalIDController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();

  String? _qrData; // Holds the data to generate QR

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Info QR Code Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children:[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  // Name Field
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Full Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                  ),
                  // National ID
                  TextFormField(
                    controller: _nationalIDController,
                    decoration: const InputDecoration(labelText: 'National ID'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your National ID';
                      }
                      return null;
                    },
                  ),
                  // Email Field
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  // Phone Field
                  TextFormField(
                    controller: _phoneController,
                    decoration: const InputDecoration(labelText: 'Phone'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                  ),
                  // Job Field
                  TextFormField(
                    controller: _jobController,
                    decoration: const InputDecoration(labelText: 'Job'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Job';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, generate the QR data
                        setState(() {
                          _qrData = 
                          '''
BEGIN:VCARD
VERSION:3.0
FN:${_nameController.text}
EMAIL:${_emailController.text}
TEL:${_phoneController.text}
TITLE:${_jobController.text}      
X-NATIONAL-ID:${_nationalIDController.text}
END:VCARD
                          ''';
                        });
                        Navigator.push(context, MaterialPageRoute(builder: (context) => QRView(qrData: _qrData)));
                      }
                    },
                    child: const Text('Generate QR Code'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _nationalIDController.dispose();
    _jobController.dispose();
    super.dispose();
  }
}