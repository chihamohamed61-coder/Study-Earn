import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_flutter_app/pages/studente/home_studente.dart';

class Benvenuto extends StatefulWidget {
  const Benvenuto({super.key});

  @override
  State<Benvenuto> createState() => _BenvenutoState();
}

class _BenvenutoState extends State<Benvenuto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 176, 210, 234),
      body: Stack(
        children: [
    Padding(
  padding: const EdgeInsets.only(top: 80),
  child: Center(
    child: SizedBox(
      width: 320,
      height: double.infinity,
      child: Image.asset(
        "assets/etudiant3.png",
        fit: BoxFit.contain,
      ),
    ),
  ),
),



          //BUTTON
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: CupertinoButton(
                color: const Color(0xFF2F80ED),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 5,
                ),
                child: Text(
                  'Benvenuto',
                  style: GoogleFonts.ubuntu(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeStudente(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
