import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:typed_data';
import 'NewPersonPage.dart';

void main() {
  runApp(const MaterialApp(
    home: WantedPage(),
  ));
}

class Person {
  final String name;
  final String alias;
  final String imagePath;

  Person(this.name, this.alias, this.imagePath);
}

class WantedPage extends StatefulWidget {
  const WantedPage({Key? key}) : super(key: key);

  @override
  _WantedPageState createState() => _WantedPageState();
}

class _WantedPageState extends State<WantedPage> {
  late Future<List<Person>> _fetchDataFuture;

  @override
  void initState() {
    super.initState();
    _fetchDataFuture = fetchData();
  }

  Future<List<Person>> fetchData() async {
    try {
      final response =
          await http.get(Uri.parse('http://localhost/andriod/wanted.php'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data
            .map((item) =>
                Person(item['firstname'], item['alias'], item['imagePath']))
            .toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Unable to reach server: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Person ListView'),
      ),
      body: FutureBuilder<List<Person>>(
        future: _fetchDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return PersonCard(person: snapshot.data![index]);
              },
            );
          } else {
            return const Center(child: Text('No data available.'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    NewPersonPage()), // Navigate to NewPersonPage
          );
        },
        child: Icon(Icons.add, color: Colors.white), // White plus icon
        backgroundColor: Colors.blue, // Set FAB background color
      ),
    );
  }
}

class PersonCard extends StatelessWidget {
  final Person person;

  const PersonCard({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Decode base64 image data
    Uint8List imageBytes = base64.decode(person.imagePath);
    return Card(
      margin: const EdgeInsets.all(10.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: MemoryImage(imageBytes), // Use MemoryImage
        ),
        title: Text('Name: ${person.name}'),
        subtitle: Text('Alias: ${person.alias}'),
      ),
    );
  }
}
