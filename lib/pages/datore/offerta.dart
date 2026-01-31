import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_flutter_app/pages/datore/home_datore.dart';

class LeMieOfferte extends StatefulWidget {
  const LeMieOfferte({super.key});

  @override
  State<LeMieOfferte> createState() => _LeMieOfferteState();
}

class _LeMieOfferteState extends State<LeMieOfferte> {

  // 🔹 Exemples d’offres (statique)
  final List<Map<String, String>> offres = [
    {
      "name": "Sviluppatore web",
      "salary": "1000€",
      "citta": "Roma",
      "description": "Realizza siti web moderni",
      "date": "12-02-2026",
      "starttime": "09:00",
      "endtime": "12:00",
    },
    {
      "name": "Barista",
      "salary": "900€",
      "citta": "Milano",
      "description": "Prepara bevande caffè e cocktail",
      "date": "15-02-2026",
      "starttime": "20:00",
      "endtime": "00:00",
    },
    {
      "name": "Progettista UI/UX",
      "salary": "800€",
      "citta": "Urbino",
      "description": "Disegna interfacce utenti",
      "date": "20-02-2026",
      "starttime": "10:00",
      "endtime": "14:00",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 32, 107, 219),
        title: Row(
          children: [
           
            const Spacer(),
            Text(
              "le mie offerte",
              style: GoogleFonts.ubuntu(
                fontSize: 26,
                color: Colors.white,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: offres.length,
          itemBuilder: (context, index) {
            final offre = offres[index];

            return Container(
              height: 200,
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 102, 170, 233),
                    Color.fromARGB(255, 128, 179, 241),
                  ],
                ),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    
                    Row(
                      children: [
                        const Icon(Icons.work, color: Colors.white),
                        const SizedBox(width: 10),
                        Text(
                          offre["name"]!,
                          style: GoogleFonts.ubuntu(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                           
Row(
  children: [
    
   
    const Icon(Icons.location_city, color: Colors.white),
    const SizedBox(width: 5),
    Text(
      offre["citta"]!,
      style: const TextStyle(color: Colors.white),
    ),
 const SizedBox(width: 20),
    const Icon(Icons.euro, color: Colors.white),
    const SizedBox(width: 5),
    Text(
      offre["salary"]!,
      style: const TextStyle(color: Colors.white),
    ),
  ],
),

                    
                   Row(
                      children: [
                        const Icon(Icons.description, color: Colors.white),
                        const SizedBox(width: 5),
                        Text(
                          offre["description"]!,
                          style: GoogleFonts.ubuntu(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    // 🔹 Time
                    Row(
                      children: [
                        const Icon(Icons.hourglass_top,
                            color: Colors.white),
                        const SizedBox(width: 5),
                        Text(
                          offre["starttime"]!,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(width: 20),
                        const Icon(Icons.hourglass_bottom,
                            color: Colors.white),
                        const SizedBox(width: 5),
                        Text(
                          offre["endtime"]!,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),

                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          offre["date"]!,
                          style: const TextStyle(color: Colors.white),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit,
                                  color: Colors.green),
                              onPressed: () {
                                
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete,
                                  color: Colors.red),
                              onPressed: () {
                                
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 32, 107, 219),
        onPressed: () {
          
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeDatore()));

        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
