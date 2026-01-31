import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:simple_flutter_app/pages/introduzione.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 9), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Introduzione()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

        
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
               colors: [                                                                                 
Color.fromARGB(255, 0, 7, 21),    // haut
  Color.fromARGB(255, 66, 104, 161),   // milieu
  Color.fromARGB(255, 0, 2, 5),  
],
              ),
            ),
          ),

          
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.topCenter,
                radius: 1.2,
                colors: [
                  Colors.white.withOpacity(0.15),
                  Colors.transparent,
                ],
              ),
            ),
          ),

          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                
                Image.asset(
                  'assets/logo.png',
                  width: MediaQuery.of(context).size.width * 0.46,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 0),

              
                Shimmer.fromColors(
                  baseColor: const Color(0xFFFFD54F),
                  highlightColor: Colors.white,
                  child: Text(
                    'Study Earn',
                    style: GoogleFonts.poppins(
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
