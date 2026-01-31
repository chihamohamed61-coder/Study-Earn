import 'package:flutter/material.dart';
import 'package:simple_flutter_app/pages/studente/home_studente.dart';

class ProfiloStudente extends StatelessWidget {
  const ProfiloStudente({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("Profilo"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder:(context) =>const HomeStudente()));
                          
          },
        ),
        elevation: 0,
      ),
      body: Center(
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                

                CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.blue.shade100,
                  child: const Icon(
                    Icons.person,
                    size: 70,
                    color: Colors.blue,
                  ),
                ),

                const SizedBox(height: 20),

                

                const Text(
                  "Mohamed Chiha",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                

                const Text(
                  "mohamedchiha@gmail.com",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 10),

              

                const Text(
                  "+39 351 123 4567",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 30),

               
                ElevatedButton.icon(
                  onPressed: () {
                    
                  },
                  icon: const Icon(Icons.edit),
                  label: const Text("Modifica profilo"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
