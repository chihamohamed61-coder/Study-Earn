import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:simple_flutter_app/pages/datore/login_datore.dart';
import 'package:simple_flutter_app/pages/datore/offerta.dart';
import 'package:simple_flutter_app/pages/datore/profilo_datore.dart';
import 'package:simple_flutter_app/pages/datore/registrazione_datore.dart';


final GlobalKey<FormState> offreKey = GlobalKey<FormState>();

TextEditingController nameCtr = TextEditingController();
TextEditingController describeCtr = TextEditingController();
TextEditingController salaryCtr = TextEditingController();
TextEditingController dateCtr = TextEditingController();
TextEditingController startTimeCtr = TextEditingController();
TextEditingController endTimeCtr = TextEditingController();

class HomeDatore extends StatefulWidget {
  const HomeDatore({Key? key}) : super(key: key);

  @override
  State<HomeDatore> createState() => _HomeDatoreState();
}

class _HomeDatoreState extends State<HomeDatore> {
  String? selectedCity;

  final List<String> cities = [
    'Rome',
    'Milano',
    'Urbino',
    'Firenze',
  ];

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
        MaterialPageRoute(builder: (context) => const ProfiloDatore()),
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
                // simulate sign out: go back to login
                Navigator.pushAndRemoveUntil(
                    context, MaterialPageRoute(builder: (context) => const LoginDatore()), (route) => false);
              },
              icon: const Icon(Icons.logout , color: Colors.white, 
        size: 26,)),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: offreKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            
            child: Column(
              children: [
                 Text(
                        'aggiungi offerta!',
                        style: GoogleFonts.ubuntu(color: const Color(0xFF190933), fontSize: 30 ),
                      ),
                      SizedBox(width: 50,),
                _textField(
                  controller: nameCtr,
                  label: "Name",
                  icon: Icons.title,
                ),
                const SizedBox(height: 15),

                _textField(
                  controller: describeCtr,
                  label: "Descrizione",
                  icon: Icons.description,
                ),
                const SizedBox(height: 15),

                _textField(
                  controller: salaryCtr,
                  label: "Stipendio",
                  icon: Icons.money,
                  isNumber: true,
                ),
                const SizedBox(height: 15),

                TextFormField(
                  controller: dateCtr,
                  readOnly: true,
                  decoration: _decoration("Data", Icons.calendar_today),
                  onTap: () async {
                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (picked != null) {
                      dateCtr.text =
                          DateFormat('dd-MM-yyyy').format(picked);
                    }
                  },
                ),
                const SizedBox(height: 15),

                Row(
                  children: [
                    Expanded(
                      child: _timeField(
                        controller: startTimeCtr,
                        label: "Ora di inizio",
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _timeField(
                        controller: endTimeCtr,
                        label: "Ora di fine",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    hint: const Text("Seleziona città"),
                    value: selectedCity,
                    items: cities
                        .map(
                          (c) => DropdownMenuItem<String>(
                            value: c,
                            child: Text(c),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCity = value;
                        global.selectville1 = value!;
                      });
                    },
                    buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                CupertinoButton(
                  color: Color.fromARGB(255, 76, 125, 216),
                  child: const Text(
                    "Pubblica questo lavoro",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: submitOffer,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ---------------- FUNCTIONS ----------------

  void submitOffer() async {
    if (!offreKey.currentState!.validate()) return;

    if (selectedCity == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select a city")),
      );
      return;
    }

    

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Offer added successfully")),
    );

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LeMieOfferte()));
  }

  // ---------------- WIDGET HELPERS ----------------

  Widget _textField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool isNumber = false,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      validator: (v) => v!.isEmpty ? "Required" : null,
      decoration: _decoration(label, icon),
    );
  }

  Widget _timeField({
    required TextEditingController controller,
    required String label,
  }) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      decoration: _decoration(label, Icons.access_time),
      onTap: () async {
        TimeOfDay? picked = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
        if (picked != null) {
          controller.text = picked.format(context);
        }
      },
    );
  }

  InputDecoration _decoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
