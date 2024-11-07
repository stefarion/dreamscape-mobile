import 'package:flutter/material.dart';

class ProductEntryFormPage extends StatefulWidget {
  const ProductEntryFormPage({super.key});

  @override
  State<ProductEntryFormPage> createState() => _ProductEntryFormPageState();
}

class _ProductEntryFormPageState extends State<ProductEntryFormPage> {
  final _formKey = GlobalKey<FormState>();
	String _name = "";
	String _category = "";
  int _amount = 0;
	int _price = 0;
  String _description = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              appBar: AppBar(
                title: const Center(
                  child: Text(
                    'Add Product',
                  ),
                ),
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
              ),
              // Tambahkan drawer
              body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter your product's name",
                            labelText: "Product Name",
                            hintStyle: TextStyle(color: Color(0xFFE0E0E0), fontFamily: 'Tahoma'),
                            labelStyle: TextStyle(color: Colors.white, fontFamily: 'Tahoma'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          style: TextStyle(color: Colors.white, fontFamily: 'Tahoma'),
                          onChanged: (String? value) {
                            setState(() {
                              _name = value!;
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Product's name can't be empty!";
                            }
                            if (value.length < 3 || value.length > 255) {
                              return "Product's name must be between 3 and 255 characters!";
                            }
                            if (RegExp(r'[<>()\[\]]').hasMatch(value)) {
                              return "Product's name can't contain symbols!";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter your product's category",
                            labelText: "Category",
                            hintStyle: TextStyle(color: Color(0xFFE0E0E0), fontFamily: 'Tahoma'),
                            labelStyle: TextStyle(color: Colors.white, fontFamily: 'Tahoma'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          style: TextStyle(color: Colors.white, fontFamily: 'Tahoma'),
                          onChanged: (String? value) {
                            setState(() {
                              _category = value!;
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Category can't be empty!";
                            }
                            if (value.length < 3 || value.length > 255) {
                              return "Category must be between 3 and 255 characters!";
                            }
                            if (RegExp(r'[<>()\[\]]').hasMatch(value)) {
                              return "Product's name can't contain symbols!";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter your product's amount",
                            labelText: "Amount",
                            hintStyle: TextStyle(color: Color(0xFFE0E0E0), fontFamily: 'Tahoma'),
                            labelStyle: TextStyle(color: Colors.white, fontFamily: 'Tahoma'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          style: TextStyle(color: Colors.white, fontFamily: 'Tahoma'),
                          onChanged: (String? value) {
                            setState(() {
                              _amount = int.tryParse(value!) ?? 0;
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Amount can't be empty!";
                            }
                            if (int.tryParse(value) == null) {
                              return "Amount must be numbers!";
                            }
                            if (int.tryParse(value)! < 0) {
                              return "Amount can't be negative!";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter your product's price",
                            labelText: "Price (in Rp)",
                            hintStyle: TextStyle(color: Color(0xFFE0E0E0), fontFamily: 'Tahoma'),
                            labelStyle: TextStyle(color: Colors.white, fontFamily: 'Tahoma'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          style: TextStyle(color: Colors.white, fontFamily: 'Tahoma'),
                          onChanged: (String? value) {
                            setState(() {
                              _price = int.tryParse(value!) ?? 0;
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Price can't be empty!";
                            }
                            if (int.tryParse(value) == null) {
                              return "Price must be numbers!";
                            }
                            if (int.tryParse(value)! < 0) {
                              return "Price can't be negative!";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter your product's description",
                            labelText: "Description",
                            hintStyle: TextStyle(color: Color(0xFFE0E0E0), fontFamily: 'Tahoma'),
                            labelStyle: TextStyle(color: Colors.white, fontFamily: 'Tahoma'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          style: TextStyle(color: Colors.white, fontFamily: 'Tahoma'),
                          onChanged: (String? value) {
                            setState(() {
                              _description = value!;
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Description can't be empty!";
                            }
                            if (value.length < 3 || value.length > 255) {
                              return "Description must be between 3 and 255 characters!";
                            }
                            if (RegExp(r'[<>()\[\]]').hasMatch(value)) {
                              return "Description can't contain symbols!";
                            }
                            return null;
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                  Theme.of(context).colorScheme.primary),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Product added successfully!'),
                                      content: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Product Name: $_name'),
                                            Text('Category: $_category'),
                                            Text('Amount: $_amount'),
                                            Text('Price: Rp $_price'),
                                            Text('Description: $_description'),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          child: const Text('OK'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                            _formKey.currentState!.reset();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                            child: const Text(
                              "Add Product",
                              style: TextStyle(color: Colors.white, fontFamily: 'Tahoma', fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
  }
}