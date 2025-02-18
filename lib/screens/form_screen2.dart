import 'package:flutter/material.dart';
import '../utils/validation.dart';
import '../widgets/inputs_fields.dart';

class FormScreen2 extends StatefulWidget {
  final String name;

  const FormScreen2({super.key, required this.name});

  @override
  _FormScreen2State createState() => _FormScreen2State();
}

class _FormScreen2State extends State<FormScreen2> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _addressController = TextEditingController();

  void _validateAndSubmit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Form Submitted Successfully!"),
          backgroundColor: Colors.green,
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
      appBar: AppBar(title: Text("Screen 2")),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Hello, ${widget.name}!", style: TextStyle(fontSize: 18)),
                CustomTextField(
                  label: "Address",
                  controller: _addressController,
                  validator: Validation.validateAddress,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _validateAndSubmit,
                  child: Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
