import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewPersonPage extends StatefulWidget {
  const NewPersonPage({Key? key}) : super(key: key);

  @override
  _NewPersonPageState createState() => _NewPersonPageState();
}

class _NewPersonPageState extends State<NewPersonPage> {
  late File file;
  TextEditingController aliasController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController areaFrequentController = TextEditingController();
  TextEditingController wantedByController = TextEditingController();
  TextEditingController lastSeenController = TextEditingController();
  TextEditingController additionalnotesController = TextEditingController();

  PickedFile? _pickedImage;

  void _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _pickedImage = PickedFile(pickedImage.path);
        file = File(pickedImage.path);
      });
    }
  }

  void _submitForm() async {
    // Convert the image to base64

    String imageBase64 = '';
    if (_pickedImage != null) {
      final imageBytes = await File(_pickedImage!.path).readAsBytes();
      imageBase64 = base64Encode(imageBytes);
    }

    if (_formKey.currentState!.validate()) {
      String firstName = firstNameController.text.isEmpty
          ? 'Unknown'
          : firstNameController.text;
      String lastName =
          lastNameController.text.isEmpty ? 'Unknown' : lastNameController.text;
      String alias =
          aliasController.text.isEmpty ? 'Unknown' : aliasController.text;
      String age = ageController.text.isEmpty ? 'Unknown' : ageController.text;
      String dob = dobController.text.isEmpty ? 'Unknown' : dobController.text;
      String address =
          addressController.text.isEmpty ? 'Unknown' : addressController.text;
      String areaFrequent = areaFrequentController.text.isEmpty
          ? 'Unknown'
          : areaFrequentController.text;
      String wantedBy =
          wantedByController.text.isEmpty ? 'Unknown' : wantedByController.text;
      String lastSeen =
          lastSeenController.text.isEmpty ? 'Unknown' : lastSeenController.text;
      String additionalnotes = additionalnotesController.text.isEmpty
          ? 'Unknown'
          : additionalnotesController.text;
/*
      var formData = {
        "imagePath": alias,
        'alias': alias,
        'firstname': firstName,
        'lastname': lastName,
        'age': age,
        'dateofbirth': dob,
        'homeaddress': address,
        'areafrequent': areaFrequent,
        'wantedby': wantedBy,
        'lastseen': lastSeen,
        'additionalnotes': additionalnotes,
      };
      var response = await http.post(
        Uri.parse('http://localhost/andriod/upload.php'),
        body: formData,
      );
*/
      try {
        var request = http.MultipartRequest(
            "POST", Uri.parse('http://localhost/andriod/upload.php'));

        request.fields["firstname"] = firstName;
        request.fields["lastname"] = lastName;
        request.fields["alias"] = alias;
        request.fields["age"] = age;
        request.fields["dateofbirth"] = dob;
        request.fields["homeaddress"] = address;
        request.fields["areafrequent"] = areaFrequent;
        request.fields["wantedby"] = wantedBy;
        request.fields["lastseen"] = lastSeen;
        request.fields["additionalnotes"] = additionalnotes;

        request.files.add(http.MultipartFile.fromBytes(
            "imagePath", File(file!.path).readAsBytesSync(),
            filename: file!.path));

        var response = await request.send();

        if (response.statusCode == 201) {
          print('Form submitted successfully');
        } else {
          print('Error submitting form: ${response.statusCode}');
          String responseBody = await response.stream.bytesToString();
          print(
              'Error submitting form. Status Code: ${response.statusCode}, Response Body: $responseBody');
        }
      } catch (e) {
        print('An error occurred: $e');
      }
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Person'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              InkWell(
                onTap: _pickImage,
                child: _pickedImage == null
                    ? Container(
                        width: 150,
                        height: 150,
                        color: Colors.grey,
                        child: const Icon(
                          Icons.camera_alt,
                          size: 50,
                          color: Colors.white,
                        ),
                      )
                    : Image.file(
                        File(_pickedImage!.path),
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
              ),
              TextFormField(
                controller: firstNameController,
                decoration: const InputDecoration(labelText: 'First Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter first name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: lastNameController,
                decoration: const InputDecoration(labelText: 'Last Name'),
              ),
              TextFormField(
                controller: ageController,
                decoration: const InputDecoration(labelText: 'Age'),
              ),
              TextFormField(
                controller: dobController,
                decoration: const InputDecoration(labelText: 'Date of Birth'),
              ),
              TextFormField(
                controller: addressController,
                decoration: const InputDecoration(labelText: 'Address'),
              ),
              TextFormField(
                controller: areaFrequentController,
                decoration: const InputDecoration(labelText: 'Area Frequent'),
              ),
              TextFormField(
                controller: wantedByController,
                decoration: const InputDecoration(labelText: 'Wanted By'),
              ),
              TextFormField(
                controller: lastSeenController,
                decoration: const InputDecoration(labelText: 'Last Seen'),
              ),
              TextFormField(
                controller: aliasController, // Adding Alias field
                decoration: const InputDecoration(labelText: 'Alias'),
              ),
              TextFormField(
                controller:
                    additionalnotesController, // Adding Additional Notes field
                decoration:
                    const InputDecoration(labelText: 'Additional Notes'),
              ),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: NewPersonPage(),
  ));
}
