import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:simple_flutter_app/pages/studente/profilo_studente.dart';
import 'login_studente.dart';

class HomeStudente extends StatefulWidget {
  const HomeStudente({super.key});

  @override
  State<HomeStudente> createState() => _HomeStudenteState();
}

class _HomeStudenteState extends State<HomeStudente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 76, 125, 216),
        shadowColor: Color.fromARGB(255, 195, 223, 255),
        title: Row(
children: [
  IconButton(
    onPressed: () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const ProfiloStudente()),
        (route) => false,
      );
    },
    icon: const Icon(
      Icons.person,
      color: Colors.white,
      size: 30,         
    ),
  ),

  const SizedBox(width: 100),

  Expanded(
    child: Text(
      'Home',
      style: GoogleFonts.ubuntu(
        color: Colors.white, 
        fontSize: 24,        
        fontWeight: FontWeight.bold,
      ),
      
    ),
  ),
],

        ),
        actions: [
          IconButton(
              onPressed: () async {
                
                Navigator.pushAndRemoveUntil(
                    context, MaterialPageRoute(builder: (context) => const LoginStudente()), (route) => false);
              },
              icon: const Icon(Icons.logout , color: Colors.white, 
        size: 26,)),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 195, 221, 255),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Color(0xFFEE9E8E)),
              child: Text('Menu', style: GoogleFonts.ubuntu(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context, MaterialPageRoute(builder: (context) => const LoginStudente()), (route) => false);
              },
            )
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
                child: Row(
                  children: [
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Scegli la tua città!',
                        style: GoogleFonts.ubuntu(color: const Color(0xFF190933), fontSize: 30),
                      ),
                    ),
                    Image.asset('assets/student pc.png', width: 150, height: 120),
                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    _CityCard(city: 'Roma', image: 'assets/roma.Jpg'),
                    SizedBox(height: 12),
                    _CityCard(city: 'Milano', image: 'assets/milano.Jpg'),
                    SizedBox(height: 12),
                    _CityCard(city: 'Urbino', image: 'assets/Urbino.Jpg'),
                    SizedBox(height: 12),
                    _CityCard(city: 'Firenze', image: 'assets/firenze.Jpg'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _CityCard extends StatelessWidget {
  const _CityCard({required this.city, required this.image});
  final String city;
  final String image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       Navigator.push(context, MaterialPageRoute(builder: (context) => OfferPage(city: city)));
      },
      child: Container(
        height: 160,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(color: Color.fromARGB(255, 195, 227, 255), offset: Offset(3, 3), blurRadius: 30),
          ],
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 195, 207, 255).withOpacity(0.4),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(city, style: const TextStyle(color: Color(0xFF190933), fontSize: 28)),
          ),
        ),
      ),
    );
  }
}

class OfferPage extends StatelessWidget {
  const OfferPage({super.key, required this.city});

  final String city;

  static final List<Map<String, String>> allOffers = [
    {
  'name': 'Sviluppatore web',
  'date': '2026-02-20',
  'starttime': '09:00',
  'endtime': '12:00',
  'describe': 'Realizza siti web moderni.',
  'salary': '1000',
  'city': 'Roma',
  'imageURL': 'assets/studentt.png',
},
    {
      'name': 'Barista',
      'date': '2026-02-10',
      'starttime': '20:00',
      'endtime': '00:00',
      'describe': 'Prepara bevande caffè e cocktail',
      'salary': '900',
      'city': 'Milano',
      'imageURL': 'assets/studentt.png',
    },
    {
      'name': 'Progettista UI/UX',
      'date': '2026-02-15',
      'starttime': '10:00',
      'endtime': '14:00',
      'describe': 'Disegna interfacce utenti',
      'salary': '800',
      'city': 'Urbino',
      'imageURL': 'assets/studentt.png',
    },
    {
      'name': 'Analista dati',
      'date': '2026-03-01',
      'starttime': '13:00',
      'endtime': '17:00',
      'describe': 'Analizza dati complessi.',
      'salary': '1000',
      'city': 'Firenze',
      'imageURL': 'assets/studentt.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final offers =
        allOffers.where((o) => o['city'] == city).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Offerte $city', style: GoogleFonts.lato()),
        backgroundColor: Color.fromARGB(255, 142, 184, 238),
      ),
      backgroundColor: const Color(0xFFFFF5E0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 12),

            

            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: offers.length,
              itemBuilder: (context, index) {
                final offer = offers[index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFDBC3),
                      borderRadius: BorderRadius.circular(20),
                      border: const GradientBoxBorder(
                        gradient: LinearGradient(
                          colors: [Colors.orange, Colors.red],
                        ),
                        width: 2,
                      ),
                    ),
                    child: ListTile(
                      leading: Image.asset(
                        offer['imageURL']!,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        offer['name']!,
                        style: const TextStyle(fontSize: 18),
                      ),
                      subtitle: Text(offer['date']!),
                      trailing: IconButton(
                        icon: const Icon(Icons.navigate_next),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text(offer['name']!),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Città: ${offer['city']}'),
                                  const SizedBox(height: 8),
                                  Text('Stipendo: ${offer['salary']} €'),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Dal ${offer['starttime']} al ${offer['endtime']}',
                                  ),
                                   const SizedBox(height: 8),
                                  Text('data: ${offer['date']}'),
                                  const SizedBox(height: 8),
                                  Text(offer['describe']!),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(),
                                  child: const Text('chiudere'),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

