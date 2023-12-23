import 'package:flutter/material.dart';
import 'dart:convert';

class WordingBookPage extends StatefulWidget {
  const WordingBookPage({super.key});

  @override
  _WordingBookPageState createState() => _WordingBookPageState();
}

class _WordingBookPageState extends State<WordingBookPage> {
  TextEditingController searchController = TextEditingController();
  List<WordingBook> wordingBooks = [];
  List<WordingBook> filteredWordingBooks = []; // List to store filtered WordingBook objects

  Future<void> loadWordingBooks() async {
    String jsonData = await DefaultAssetBundle.of(context).loadString('assets/wordingBook.json');
    Map<String, dynamic> jsonMap = json.decode(jsonData);
    List<dynamic> offencesList = jsonMap['wordingDook'];

    setState(() {
      wordingBooks = offencesList.map((e) => WordingBook.fromJson(e)).toList();
      filteredWordingBooks = wordingBooks; // Initialize filtered list
    });
  }

  @override
  void initState() {
    super.initState();
    loadWordingBooks();
  }

  // Function to filter offences based on search query
  void filterOffences(String query) {
    setState(() {
      filteredWordingBooks = wordingBooks
          .where((wordingBook) =>
              wordingBook.body.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Wording Page")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              onChanged: (value) {
                filterOffences(value); // Call the filter function
              },
              decoration: const InputDecoration(
                labelText: 'Search',
                suffixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: filteredWordingBooks.length,
                itemBuilder: (context, index) => Card(
                  color: Colors.blue,
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OffenceDetailsPage(
                            wordingBook: filteredWordingBooks[index],
                          ),
                        ),
                      );
                    },
                    title: Text(
                      filteredWordingBooks[index].title,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OffenceDetailsPage extends StatelessWidget {
  final WordingBook wordingBook;

  const OffenceDetailsPage({super.key, required this.wordingBook});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Offence Details")),
      body: Container(
        color: Colors.blue,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                "Title: ${wordingBook.title}",
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Offence: ${wordingBook.body}",
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class WordingBook {
  final String title;
  final String body;

  WordingBook({
    required this.title,
    required this.body,
  });

  factory WordingBook.fromJson(Map<String, dynamic> json) {
    return WordingBook(
      title: json['title'],
      body: json['body'],
    );
  }
}

void main() => runApp(const MaterialApp(home: WordingBookPage()));
