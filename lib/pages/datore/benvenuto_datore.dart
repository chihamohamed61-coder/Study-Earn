import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_flutter_app/pages/datore/home_datore.dart';

final registerkeycl = GlobalKey<FormState>();

class BenvenutoDatore extends StatefulWidget {
  const BenvenutoDatore({super.key});

  @override
  State<BenvenutoDatore> createState() => _BenvenutoDatoreState();
}

class _BenvenutoDatoreState extends State<BenvenutoDatore> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 195, 223, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),

              Text(
                "Benvenuto in Study Earn",
                style: GoogleFonts.pacifico(
                  color: Color.fromARGB(255, 35, 2, 119),
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 20),

              
              Padding(
                padding: const EdgeInsets.only(left: 80, right: 0),
                child: Image.asset(
                  "assets/emp.png",
                  height: height * 0.58,
                  width: width,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 30),

              // BUTTON
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: CupertinoButton(
                    padding: EdgeInsets.zero,
     onPressed: () {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => const HomeDatore(),
    ),
  );
},

                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 60, 24, 151),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Color.fromARGB(255, 254, 254, 255),
                        size: 30,
                      ),
                    ),
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
