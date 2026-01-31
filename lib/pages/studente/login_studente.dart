import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_flutter_app/pages/studente/registrazione_studente.dart';
import 'package:simple_flutter_app/pages/studente/recupero_password_studente.dart';
import 'package:simple_flutter_app/pages/studente/benvenuto_studente.dart';

class LoginStudente extends StatefulWidget {
  const LoginStudente({super.key});

  @override
  State<LoginStudente> createState() => _LoginStudenteState();
}

class _LoginStudenteState extends State<LoginStudente> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isVisible = true;
  bool isemailcorrect = false;
  bool ispasswordcorrect = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [

        ///circles
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

        
        Padding(
          padding: const EdgeInsets.only(top: 150, left: 100),
          child: Text(
            "Benvenuto!",
            style: GoogleFonts.ubuntu(
              color: const Color(0xFF1565C0),
              fontSize: 40,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),

        /// Form
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(children: [

              const SizedBox(height: 250),

              /// Email Field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SizedBox(
                  height: 70,
                  child: TextFormField(
                    controller: _emailController,
                    onChanged: (value) {
                      setState(() {
                        isemailcorrect =
                            RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(value);
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "L'email non può essere vuota";
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(value))
                        return "Inserisci un'email valida";
                      return null;
                    },
                    style: GoogleFonts.pacifico(
                        color: const Color(0xFF1565C0), fontSize: 20),
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: GoogleFonts.ubuntu(
                          color: const Color(0xFF1565C0), fontSize: 30),
                      hintText: "User@gmail.com",
                      hintStyle:
                          GoogleFonts.ubuntu(color: const Color(0xFF90CAF9)),
                      prefixIcon: const Icon(Icons.email, color: Colors.blue),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            const BorderSide(color: Color(0xFF1565C0), width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                            color:
                                isemailcorrect ? Colors.green : Colors.red),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              /// Password Field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SizedBox(
                  height: 75,
                  child: TextFormField(
                    obscureText: isVisible,
                    controller: _passwordController,
                    onChanged: (value) {
                      setState(() {
                        ispasswordcorrect =
                            RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value);
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "La password non può essere vuota";
                      if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value))
                        return "Inserisci una password valida";
                      return null;
                    },
                    style: GoogleFonts.pacifico(
                        color: const Color(0xFF1565C0), fontSize: 20),
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: GoogleFonts.ubuntu(
                          color: const Color(0xFF1565C0), fontSize: 30),
                      hintText: "Inserisci la password",
                      hintStyle:
                          GoogleFonts.ubuntu(color: const Color(0xFF90CAF9)),
                      prefixIcon: const Icon(Icons.lock, color: Colors.blue),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() => isVisible = !isVisible);
                        },
                        icon: Icon(
                          isVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            const BorderSide(color: Color(0xFF1565C0), width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                            color:
                                ispasswordcorrect ? Colors.green : Colors.red),
                      ),
                    ),
                  ),
                ),
              ),

              /// Forgot password
              Padding(
                padding: const EdgeInsets.only(left: 200),
                child: TextButton(
                  child: Text('Password dimenticata?',
                      style: GoogleFonts.ubuntu(
                          color: const Color(0xFF1565C0),
                          decoration: TextDecoration.underline)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const RecuperoPassword()));
                  },
                ),
              ),

              const SizedBox(height: 30),

              /// Login Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  height: 65,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(colors: [
                      Color(0xFF1565C0),
                      Color(0xFF42A5F5),
                    ]),
                  ),
                  child: CupertinoButton(
                    child: _isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text('Accedi',
                            style: GoogleFonts.ubuntu(
                                color: Colors.white, fontSize: 18)),
                    onPressed: () async {
                      if (!_formKey.currentState!.validate()) return;
                      setState(() => _isLoading = true);
                      await Future.delayed(const Duration(seconds: 1));
                      setState(() => _isLoading = false);

                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => const Benvenuto()));
                    },
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// Register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Non hai un account?",
                      style: GoogleFonts.ubuntu(fontSize: 18)),
                  TextButton(
                    child: Text("Iscriviti",
                        style: GoogleFonts.ubuntu(
                            color: const Color(0xFF1565C0), fontSize: 18)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const RegistrazioneStudente()));
                    },
                  )
                ],
              )
            ]),
          ),
        )
      ]),
    );
  }
}
