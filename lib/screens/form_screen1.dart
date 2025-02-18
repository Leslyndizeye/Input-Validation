import 'package:flutter/material.dart';
import '../utils/validation.dart';
import '../widgets/inputs_fields.dart';
import 'form_screen2.dart';

class FormScreen1 extends StatefulWidget {
  const FormScreen1({Key? key}) : super(key: key);

  @override
  _FormScreen1State createState() => _FormScreen1State();
}

class _FormScreen1State extends State<FormScreen1> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  void _validateAndNext() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FormScreen2(name: _nameController.text),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please correct the errors."),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen 1")),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "http://t1.gstatic.com/licensed-image?q=tbn:ANd9GcTLJKpaalv8TCxCWit5rn7KbyPub8cICesyPYizRNloVykuQ1ALs5XsIUBQ0qwDx_T_065h9FJJvsMXPLSwT_U"),
            fit: BoxFit.cover, // Ensures the image covers the entire background
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8), // White container with slight opacity
                borderRadius: BorderRadius.circular(16), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(0, 3), // Shadow position
                  ),
                ],
              ),
              padding: EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextField(
                      label: "Name",
                      controller: _nameController,
                      validator: Validation.validateName,
                    ),
                    CustomTextField(
                      label: "Email",
                      controller: _emailController,
                      validator: Validation.validateEmail,
                    ),
                    CustomTextField(
                      label: "Phone",
                      controller: _phoneController,
                      validator: Validation.validatePhone,
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _validateAndNext,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent, // Button color
                        padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // Rounded button
                        ),
                      ),
                      child: Text("Next", style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
