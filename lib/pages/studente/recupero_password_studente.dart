import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


final loginkeycl = GlobalKey<FormState>();
TextEditingController emailrctr = TextEditingController();

class RecuperoPassword extends StatefulWidget {
  const RecuperoPassword({super.key});

  @override
  State<RecuperoPassword> createState() => _RecuperoPasswordState();
}

class _RecuperoPasswordState extends State<RecuperoPassword> {
   bool isVisible = true;
  bool isemailcorrect = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor:   Colors.white,
     body: Stack(
  children: [

    // ====== CIRCLES (decor only) ======
    Positioned(
      left: 40,
      top: 20,
      child: Container(
        height: 90,
        width: 90,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
             Color(0xFF1565C0),
             Color(0xFF42A5F5),
            ],
          ),
          shape: BoxShape.circle,
        ),
      ),
    ),

    Positioned(
      left: -60,
      top: -90,
      child: Container(
        height: 190,
        width: 190,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1565C0),
             Color(0xFF42A5F5),
            ],
          ),
          shape: BoxShape.circle,
        ),
      ),
    ),

    // ====== CONTENT ======
    SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [

          const SizedBox(height: 120),

          Text(
            "Password dimenticata!",
            style: GoogleFonts.ubuntu(
              color: Color.fromARGB(255, 3, 52, 143),
              fontSize: 40,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 10),

          Text(
            "Inserisci la tua email!",
            style: GoogleFonts.ubuntu(
              color: const Color(0xFF190933),
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),

          const SizedBox(height: 20),

          
          Container(
            height: 200,
            width: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/clé.png"),
                fit: BoxFit.contain,
              ),
            ),
          ),

          const SizedBox(height: 20),

          // FORM
          Form(
            key: loginkeycl,
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: SizedBox(
                    height: 70,
                    child: TextFormField(
                      controller: emailrctr,
                      onChanged: (value) {
                        setState(() {
                          isemailcorrect = RegExp(
                            r"^[\w\.-]+@[\w\.-]+\.\w+$",
                          ).hasMatch(value);
                        });
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "L'email non può essere vuota";
                        }
                        if (!RegExp(
                          r"^[\w\.-]+@[\w\.-]+\.\w+$",
                        ).hasMatch(value)) {
                          return "Inserisci un'email valida";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Email",
                        prefixIcon: const Icon(Icons.email),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Color(0xFF190933),
                            width: 3,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: isemailcorrect
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                        colors: [
                         Color(0xFF1565C0),
                         Color(0xFF42A5F5),    
                        ],
                      ),
                    ),
                    child: CupertinoButton(
                      child: Text(
                        'Invia link di reset',
                        style: GoogleFonts.ubuntu(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () async {
                        await Future.delayed(
                          const Duration(seconds: 1),
                        );
                        if (!mounted) return;
                        Navigator.of(context).pop();
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              content: Text(
                                "Controlla la tua email, per favore",
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),
        ],
      ),
    ),
  ],
),

    );
  }
}
