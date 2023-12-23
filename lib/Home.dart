import 'package:flutter/material.dart';

import 'package:Duty_App/trafficoffenceview.dart';
import 'package:Duty_App/wordingbookView.dart';
import 'package:Duty_App/wanted.dart';



class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const image1 = "assets/image2.png";
    const book = "assets/book.png";
    const wanted = "assets/wanted.jpg";
    const missing = "assets/missing.png";
    const stolen = "assets/stolenitem.png";
    const contact = "assets/contact.png";

    return Scaffold(
      appBar: AppBar(title: const Text("Duty App")),
      body: SingleChildScrollView(
        child: Padding(
          //padding: const EdgeInsets.all(0),
          padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Box 1
              GestureDetector(
                onTap: () {
                  // Navigate to the wanted page here
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TrafficBookPage()),
                  );
                },
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xFF2193b0), Color(0xFF6dd5ed)],
                    ),
                  ),
                 
                  child: Row(
                   
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Image.asset(
                          image1,
                          width: 80,
                          height: 80,
                        ),
                      ),
                     const SizedBox(width: 33),
                      const Text("Traffic Offence", style: TextStyle(fontSize: 25, color: Colors.white)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Box 2
              GestureDetector(
                onTap: () {
                  // Navigate to the wording book page here
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WordingBookPage()),
                  );
                },
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xFFbdc3c7), Color(0xFF2c3e50)],
                    ),
                  ),
               
                  child: Row(
                   
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Image.asset(
                          book,
                          width: 80,
                          height: 80,
                        ),
                      ),
                       const SizedBox(width: 33),
                      const Text("Wording Book", style: TextStyle(fontSize: 25, color: Colors.white)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Box 3
              GestureDetector(
                onTap: () {
                  // Navigate to the wanted page here
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WantedPage()),
                  );
                },
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xFFeb3349), Color(0xFFf45c43)],
                    ),
                  ),
              
                  child: Row(
                  
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Image.asset(
                          wanted,
                          width: 60,
                          height: 60,
                        ),
                      ),
                       const SizedBox(width: 33),
                      const Text("Wanted", style: TextStyle(fontSize: 25, color: Colors.white)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),











              // Box 4
              GestureDetector(
                onTap: () {
                  // Navigate to the missing page here
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MissingPage()),
                  );
                },
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xFFeacda3), Color(0xFFd6ae7b)],
                    ),
                  ),
            
                  child: Row(
                 
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Image.asset(
                          missing,
                          width: 80,
                          height: 80,
                        ),
                      ),
                       const SizedBox(width: 33),
                      const Text("Missing", style: TextStyle(fontSize: 25, color: Colors.white)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Box 5
              GestureDetector(
                onTap: () {
                  // Navigate to the stolen page here
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const StolenPage()),
                  );
                },
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xFF000428), Color(0xFF004e92)],
                    ),
                  ),
               
                  child: Row(
                  
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Image.asset(
                          stolen,
                          width: 80,
                          height: 80,
                        ),
                      ),
                       const SizedBox(width: 33),
                      const Text("Stolen", style: TextStyle(fontSize: 25, color: Colors.white)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Box 6
              GestureDetector(
                onTap: () {
                  // Navigate to the contact page here
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ContactPage()),
                  );
                },
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xFF43cea2), Color(0xFF185a9d)],
                    ),
                  ),
               
                  child: Row(
               
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Image.asset(
                          contact,
                          width: 80,
                          height: 80,
                        ),
                      ),
                       const SizedBox(width: 33),
                      const Text("Contact", style: TextStyle(fontSize: 25, color: Colors.white)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}









class MissingPage extends StatelessWidget {
  const MissingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Missing Page")),
      body: const Center(
        child: Text("This is the Missing page"),
      ),
    );
  }
}

class StolenPage extends StatelessWidget {
  const StolenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stolen Page")),
      body: const Center(
        child: Text("This is the Stolen page"),
      ),
    );
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contact Page")),
      body: const Center(
        child: Text("This is the Contact page"),
      ),
    );
  }
}
