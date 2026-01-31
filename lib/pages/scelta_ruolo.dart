import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_flutter_app/pages/datore/login_datore.dart';
import 'package:simple_flutter_app/pages/studente/login_studente.dart';

class SceltaRuolo extends StatefulWidget {
  const SceltaRuolo({super.key});

  @override
  State<SceltaRuolo> createState() => _SceltaRuoloState();
}

class _SceltaRuoloState extends State<SceltaRuolo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF0D47A1),
                  Color(0xFF42A5F5),
                  Colors.white,
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
          ),

          
          Padding(
            padding: const EdgeInsets.only(top: 70, left: 60),
            child: Text(
              'Scegli il tuo spazio',
              style: GoogleFonts.ubuntu(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 30,
              ),
            ),
          ),

          
          Padding(
            padding: const EdgeInsets.only(top: 120, left: 40, right: 30),
            child: Text(
              'Questo passaggio è importante affinché ogni team scelga il proprio spazio di lavoro',
              style: GoogleFonts.ubuntu(
                color: Colors.white,
                fontWeight: FontWeight.w200,
                fontSize: 20,
              ),
            ),
          ),

          /// STUDENT BUTTON
          Positioned(
            top: 220,
            left: 0,
            child: InkWell(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(150),
                  bottomRight: Radius.circular(150)),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const LoginStudente()));
              },
              child: Container(
                width: 320,
                height: 180,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(150),
                      bottomRight: Radius.circular(150)),
                  gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      Color(0xFF42A5F5),
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Studente",
                      style: GoogleFonts.ubuntu(
                        color: Color(0xFF0D47A1),
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Image.asset("assets/et.png", height: 140),
                  ],
                ),
              ),
            ),
          ),

          ///DATOR BUTTON
          Positioned(
            bottom: 40,
            right: 0,
            child: InkWell(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(130),
                  bottomLeft: Radius.circular(130)),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginDatore()));
              },
              child: Container(
                width: 320,
                height: 180,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(130),
                      bottomLeft: Radius.circular(130)),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF0D47A1),
                      Color(0xFF42A5F5),
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/man.png", height: 140),
                    const SizedBox(width: 10),
                    Text(
                      "Datore",
                      style: GoogleFonts.ubuntu(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
