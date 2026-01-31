import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_flutter_app/pages/datore/benvenuto_datore.dart';

class _GlobalData {
  String? selectville1;
}

final global = _GlobalData();


TextEditingController confirmPasswordC = TextEditingController();
TextEditingController  cityctr = TextEditingController();
TextEditingController namectr = TextEditingController();
TextEditingController emailrctr = TextEditingController();
TextEditingController  phonectr= TextEditingController();
TextEditingController passwordrctr = TextEditingController();
final registerkeycl = GlobalKey<FormState>();

class RegistrazioneDatore extends StatefulWidget {
  const RegistrazioneDatore({super.key});

  @override
  State<RegistrazioneDatore> createState() => _RegistrazioneDatoreState();
}

class _RegistrazioneDatoreState extends State<RegistrazioneDatore> {
   String? selectValue1;
  final List<String> items = [
    'Roma',
    'Milano',
    'Urbino',
    'Firenze'

  ];
    bool   isemailcorrect = false;
   bool    isnamecorrect = false;
   bool    isphonecorrect = false;
   bool    ispasswordcorrect = false;
     bool isConfirm = true;

  bool isVisibler = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:   Colors.white,
      body: Stack(children: [
        
         Positioned(
         
          left: 40,
          top:20, 
          
          child: Container(
            height: 90,
            width:90,
        
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                   Color(0xFF1565C0),
                   Color(0xFF42A5F5),
                ],
              ),
              shape: BoxShape.circle
            ),
          ) ,
          ),
       
       
        Positioned(
         
          left: -60,
          top:-90, 
          
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
              shape: BoxShape.circle
            ),
          ) ,
          ),
           Padding(
          padding: const EdgeInsets.only(
            top: 90,
            left:150
          ),
          child: Column(
            children: [
              Text("Registrati!", style: GoogleFonts.ubuntu(
                color:const Color(0xFF2F80ED),
                fontSize: 40,
                fontWeight: FontWeight.w400,
              ),)
            ],
          ),
        ),
        
        
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key:registerkeycl,
              child:Column(
                children: [
                const SizedBox(height: 160,),
              
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: SizedBox(
                      height: 75,
                      child: TextFormField(
                        controller: namectr,
                        onChanged: (value) {
                          setState(() {
                            isnamecorrect = RegExp(r'^[a-zA-Z\s]+$').hasMatch(value);
                          });
                        },
                         validator: (value) {
                          if(value == null || value.isEmpty){
                            return "Il nome non può essere vuoto";
                          }
                         if(!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                             return "Per favore inserisci il tuo nome";
                         }
                                  return null;
                        },
                        style: GoogleFonts.pacifico(
                          color: const Color(0xFF2F80ED),
                          fontSize: 20,
                            
                        ),
                        decoration: InputDecoration(
                          labelText: "Nome",
                          labelStyle: GoogleFonts.ubuntu(
                            color: const Color(0xFF2F80ED),
                            fontSize: 30,
                            fontWeight: FontWeight.w400
                          ),
                          hintText: "inserisci il tuo nome",
                          hintStyle: GoogleFonts.ubuntu(
                            color:const Color(0xFFFFDBC3)
                          ),
                          prefixIcon: 
                          const Padding(
                            padding: EdgeInsets.only(top: 1),
                            child: SizedBox(width: 70,
                              child: Icon(Icons.person,
                              color:Colors.blue,
                              shadows: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 5, 24, 188),
                                  blurRadius: 20,
                                )
                              ],
                              ),
                            ),
                          ),
                           
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color:Color(0xFF190933),
                              width: 3
                              )
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                color: isnamecorrect ==false?
                              Colors.red :
                               Colors.green,
                              )
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color:Color.fromARGB(255, 173, 11, 133),
                              width: 3
                              )
                          ),
                          errorBorder:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color:Color.fromARGB(255, 221, 21, 7),
                              width: 3
                              )
                          ),
                          suffixIcon:IconButton(
                            icon:const Icon(Icons.clear,color:Colors.blue),
                            onPressed:()=> namectr.clear(),
                          )
                      ),
                    )),
                  ),
                   const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: SizedBox(
                      height: 75,
                      child: TextFormField(
                        controller: emailrctr,
                         onChanged: (value) {
                          setState(() {
                            isemailcorrect = RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(value);
                          });
                        },
                         validator: (value) {
                          if(value == null || value.isEmpty){
                            return "L'email non può essere vuota";
                          }
                         if(!RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(value)) {
                             return "Per favore inserisci un'email valida";
                         }
                                  return null;
                        },
                        style: GoogleFonts.pacifico(
                          color: const Color(0xFF2F80ED),
                          fontSize: 20,
                            
                        ),
                        decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: GoogleFonts.ubuntu(
                            color: const Color(0xFF2F80ED),
                            fontSize: 30,
                            fontWeight: FontWeight.w400
                          ),
                          hintText: "User@gmail.com",
                          hintStyle: GoogleFonts.ubuntu(
                            color: const Color(0xFFFFDBC3)
                          ),
                          prefixIcon: 
                          const Padding(
                            padding: EdgeInsets.only(top: 1),
                            child: SizedBox(width: 70,
                              child: Icon(Icons.email,
                              color:Colors.blue,
                              shadows: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 5, 24, 188),
                                  blurRadius: 20,
                                )
                              ],
                              ),
                            ),
                          ),
                          suffixIcon:isemailcorrect ==false?
                  const Icon(Icons.tab,color:Colors.transparent):
                   const Icon(Icons.done,color:Colors.transparent),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color:Color(0xFF190933),
                              width: 3
                              )
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: isemailcorrect ==false?
                              Colors.red :
                               Colors.green,
                             
                              )
                        ),
                         border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color:Color.fromARGB(255, 173, 11, 133),
                              width: 3
                              )
                          ),
                          errorBorder:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color:Color.fromARGB(255, 221, 21, 7),
                              width: 3
                              )
                          ),
                         
                      ),
                    )),
                  ),
                   const SizedBox(height: 20,),
              
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                    ),
                    child: SizedBox(
                      height: 75,
                      
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          hint: const Row(
                            children: [
                              SizedBox(
                                width: 47,
                                child: Icon(Icons.location_city_sharp,
                                    size: 26,
                                    color: Colors.blue,
                                    shadows: [
                                      BoxShadow(
                                          color: Color.fromARGB(255, 5, 24, 188),
                                          offset: Offset(3, 3),
                                          //spreadRadius: 1,
                                          blurRadius: 20),
                                     //BoxShadow(
                                       //   color: Color(0xFF1F3E41),
                                        //  offset: Offset(-3, -3),
                                        //  blurRadius: 15,
                                        //  spreadRadius: 1)
                                    ]),
                              ),
                              SizedBox(
                                width: 11,
                              ),
                              Text(
                                'Città',
                                style: TextStyle(
                                  color: Color(0xFF2F80ED),
                                  fontSize: 30,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          items: items
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 50,
                                          child: Container(
                                            child: const Icon(
                                                Icons.location_city_sharp,
                                                size: 26,
                                                color: Colors.blue,
                                                shadows: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(255, 6, 66, 163),
                                                      offset: Offset(3, 3),
                                                      spreadRadius: 1,
                                                      blurRadius: 20),
                                                ],
                                          ),
                                        )),
                                        Text(
                                          item,
                                          style: const TextStyle(
                                            color: Color(0xFF190933),
                                            fontWeight: FontWeight.w500,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ))
                              .toList(),
                          value: selectValue1,
                          isExpanded: false,
                          onChanged: (value) {
                            setState(() {
                              global.selectville1 = value as String;
                              selectValue1 = value;
                            });
                          },
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            size: 30,
                          ),
                          iconSize: 14,
                          iconDisabledColor: const Color(0xFFFFF5E0),
                          buttonHeight: 50,
                          buttonWidth: 400,
                          buttonPadding:
                              const EdgeInsets.only(left: 14, right: 14),
                          buttonDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: const Color(0xFF190933),
                                width: 3
                              ),
                              color:  Colors.white,),
                          buttonElevation: 2,
                          itemHeight: 40,
                          itemPadding:
                              const EdgeInsets.only(left: 14, right: 14),
                          dropdownMaxHeight: 700,
                          dropdownWidth: 200,
                          dropdownPadding: null,
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0xFFFFF5E0),
                          ),
                          dropdownElevation: 8,
                          scrollbarRadius: const Radius.circular(40),
                          scrollbarThickness: 6,
                          scrollbarAlwaysShow: true,
                          offset: const Offset(0, -8),
                        ),
                      ),
                    ),
                  ),
                  
                    const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: SizedBox(
                      height: 75,
                      child: TextFormField(
                        controller: phonectr,
                         onChanged: (value) {
                          setState(() {
                            isphonecorrect = RegExp(r'^\d+$').hasMatch(value);
                          });
                        },
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return "Il numero di telefono non può essere vuoto";
                          }
                         if(!RegExp(r'^\d+$').hasMatch(value)) {
                             return "Per favore inserisci il tuo numero di telefono";
                         }
                                  return null;
                        },
                        style: GoogleFonts.pacifico(
                          color: const Color(0xFF2F80ED),
                          fontSize: 20,
                            
                        ),
                        decoration: InputDecoration(
                          labelText: "Telefono",
                          labelStyle: GoogleFonts.ubuntu(
                            color: const Color(0xFF2F80ED),
                            fontSize: 30,
                            fontWeight: FontWeight.w400
                          ),
                          hintText: "inserisci il tuo numero di telefono",
                          hintStyle: GoogleFonts.ubuntu(
                            color: const Color(0xFFFFDBC3)
                          ),
                          prefixIcon: 
                          const Padding(
                            padding: EdgeInsets.only(top: 1),
                            child: SizedBox(width: 70,
                              child: Icon(Icons.phone,
                              color:Colors.blue,
                              shadows: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 5, 24, 188),
                                  blurRadius: 20,
                                )
                              ],
                              ),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color:Color(0xFF190933),
                              width: 3
                              )
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                               color: isphonecorrect ==false?
                              Colors.red :
                               Colors.green,
                              )
                        ),
                         border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color:Color.fromARGB(255, 173, 11, 133),
                              width: 3
                              )
                          ),
                          errorBorder:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color:Color.fromARGB(255, 221, 21, 7),
                              width: 3
                              )
                          ),
                          suffixIcon:IconButton(
                            icon:const Icon(Icons.clear,color:Colors.blue),
                            onPressed:()=> phonectr.clear(),
                          )
                      ),
                    )),
                  ),
                   const SizedBox(height: 20,),
              
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: SizedBox(
                      height: 75,
                   
                      child: TextFormField(
                         obscureText: isVisibler,
                        controller: passwordrctr,
                         onChanged: (value) {
                          setState(() {
                            ispasswordcorrect = RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value);
                          });
                        },
                         validator: (value) {
                          if(value == null || value.isEmpty){
                            return "La password non può essere vuota";
                          }
                         if(!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
                             return "Per favore inserisci una password valida";
                         }
                            return null;
                        },
                        style: GoogleFonts.pacifico(
                          color: const Color(0xFF2F80ED),
                          fontSize: 20,
                            
                        ),
                          
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: GoogleFonts.ubuntu(
                            color: const Color(0xFF2F80ED),
                            fontSize: 30,
                            fontWeight: FontWeight.w400
                          ),
                          hintText: "inserisci la password",
                          hintStyle: GoogleFonts.ubuntu(
                            color: const Color(0xFFFFDBC3)
                          ),
                          prefixIcon: 
                          const Padding(
                            padding: EdgeInsets.only(top: 1),
                            child: SizedBox(width: 70,
                              child: Icon(Icons.lock,
                              color:Colors.blue,
                              shadows: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 5, 24, 188),
                                  blurRadius: 20,
                                )
                              ],
                              ),
                              
                            ),
                          ),
                          suffixIcon: IconButton(onPressed: () {
                            setState(() {
                              isVisibler =! isVisibler;
                            });
                            
                          },
                          icon: isVisibler?
                           const Icon(Icons.visibility_off,color:  Color.fromARGB(255, 18, 17, 18),):
                           const Icon(Icons.visibility,color:  Colors.blue,),
                          ),
                           enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color:Color(0xFF190933), 
                              width: 3
                              ),
                           ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                             color: ispasswordcorrect ==false?
                              Colors.red :
                               Colors.green,
                              )
                        ),
                         border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color:Color.fromARGB(255, 173, 11, 133),
                              width: 3
                              )
                          ),
                          errorBorder:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color:Color.fromARGB(255, 221, 21, 7),
                              width: 3
                              )
                          ),
                      ),
                    ),     
                    ),
                    
                  ),
                  const SizedBox(height: 20,),
                    Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: SizedBox(
                      height: 75,
                      child: TextFormField(
                        obscureText: isConfirm,
                        style: GoogleFonts.pacifico(
                          color: const Color(0xFF2F80ED),
                          fontSize: 20,
                        ),
                        controller: confirmPasswordC,
                        validator: (value) {
                          if (confirmPasswordC.text != passwordrctr.text) {
                            return "Le password non corrispondono";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          confirmPasswordC.text = value!;
                        },
                        decoration: InputDecoration(
                            labelStyle: GoogleFonts.ubuntu(
                              color:const Color(0xFF2F80ED),
                              fontSize: 20,
                              fontWeight: FontWeight.w200,
                            ),
                            hintStyle:
                                GoogleFonts.ubuntu(color: const Color(0xFFFFDBC3)),
                            prefixIcon: const Padding(
                              padding: EdgeInsets.only(top: 1),
                              child: SizedBox(
                                width: 70,
                                child: Icon(
                                  Icons.lock,
                                   color:Colors.blue,
                              shadows: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 5, 24, 188),
                                  blurRadius: 20,
                                )
                                  ],
                                ),
                              ),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isConfirm = !isConfirm;
                                });
                              },
                              icon: isConfirm
                                  ? const Icon(
                                      Icons.visibility_off,
                                      color: Color.fromARGB(255, 18, 17, 18),
                                    )
                                  : const Icon(
                                      Icons.visibility,
                                      color: Colors.blue,
                                    ),
                            ),
                            hintText: "Conferma la password",
                            labelText: "Conferma password",
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color:Color(0xFF190933), width: 3),
                              borderRadius: BorderRadius.circular(13),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xFF190933), width: 2),
                              borderRadius: BorderRadius.circular(13),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xFF190933), width: 2),
                              borderRadius: BorderRadius.circular(13),
                            )),
                      ),
                    ),
                  ),
              
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 70,
                      width: 300,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color:  Color.fromARGB(255, 177, 204, 239),
                            offset: Offset(20, 20),
                            blurRadius: 50,
                          ),
                          BoxShadow(
                            color:  Color.fromARGB(255, 177, 204, 239),
                            offset: Offset(-20, -20),
                            blurRadius: 50
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15),
                        gradient: const LinearGradient(colors: [
                          
                           Color(0xFF1565C0),
                           Color(0xFF42A5F5), 
                           
                        
                        ])
                      ),
                      child: CupertinoButton(
                        child: Text('Registrati',style: GoogleFonts.ubuntu(
                          color: Colors.white,
                          fontSize: 16
                        ),),
                        onPressed: ()   { 
                       
                           
  if (registerkeycl.currentState!.validate()) {

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Account creato con successo"),
        backgroundColor: Color(0xFF190933),
      ),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const BenvenutoDatore()),
    );
  
  }

                          }
                       
                        ),
                       ),
                    ),       
                ],
              )),
          ),
      ]
       ),
       
        ); 
  }
}
