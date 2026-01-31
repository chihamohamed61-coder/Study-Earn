import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_flutter_app/pages/scelta_ruolo.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class Introduzione extends StatefulWidget {
  const Introduzione({super.key});

  @override
  State<Introduzione> createState() => _IntroduzioneState();
}

class _IntroduzioneState extends State<Introduzione> {
  bool onlastpage = false;
  final controllerpage = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controllerpage,
            onPageChanged: (index) {
              setState(() {
                onlastpage = (index == 3);
              });
            },
             children: const [
              PaginaIntro( 
                text2: "Studente a tempo libero",
                color: Colors.white,
                img: 'assets/student5.png',
                colortext1: Color.fromARGB(255, 68, 30, 164),
                colorcontainer: Color.fromARGB(255, 142, 190, 238),
                text1:
                    'Studenti disponibili a trovare \nun lavoro per risparmiare soldi',
              ),
              PaginaIntroDue(
                text2: "Cerca lavoro",
                color: Colors.white,
                img: 'assets/job2.png',
                colortext1: Color.fromARGB(255, 68, 30, 164),
                colorcontainer: Color.fromARGB(255, 200, 186, 243),
                text1:
                    "Study Earn ti aiuta a trovare lavori compatibili con il tuo orario",
              ),
              PaginaIntro(
                text2: "Datore di lavoro in cerca \n  di un lavoratore",
                color: Colors.white,
                img: 'assets/soc11.png',
                colortext1: Color.fromARGB(255, 68, 30, 164),
                colorcontainer: Color.fromARGB(255, 142, 190, 238),
                text1:
                    'Questa applicazione aiuta \ni piccoli imprenditori a trovare qualcuno con cui collaborare',
              ),
              PaginaIntroDue(
                text2: "Benvenuto al lavoro!",
                color: Colors.white,
                img: 'assets/soc2.png',
                colortext1: Color.fromARGB(255, 68, 30, 164),
                colorcontainer: Color.fromARGB(255, 200, 186, 243),
                text1: 'Comunica facilmente con il proprietario',
              )
            ],
          ),

          Container(
            alignment: const Alignment(0, 0.9),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                GestureDetector(
                    onTap: () {
                      controllerpage.jumpToPage(3);
                    },
                    child: Text("Salta",
                        style: GoogleFonts.roboto(
                          color: Color.fromARGB(255, 31, 87, 242),
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ))),
                SmoothPageIndicator(
                  controller: controllerpage,
                  count: 4,
                  effect: const SwapEffect(
                    activeDotColor: Color.fromARGB(255, 31, 87, 242),
                    dotHeight: 16,
                    dotWidth: 16,
                    type: SwapType.yRotation,
                    dotColor: Color(0xFF9E9E9E),

                  ),

                ),
                onlastpage
                    ? GestureDetector(
                         onTap: () {
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const SceltaRuolo()));

                        },
                        child: Text("Fatto",
                            style: GoogleFonts.roboto(
                              color: Color.fromARGB(255, 95, 150, 234),
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            )))
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            controllerpage.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child: Text("Avanti",
                              style: GoogleFonts.roboto(
                                color: Color.fromARGB(255, 31, 87, 242),
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                              )),

                        ),
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PaginaIntro extends StatelessWidget {
  const PaginaIntro(
      {super.key,
      required this.img,
      required this.color,
      required this.text2,
      required this.colortext1,
      required this.colorcontainer,
      required this.text1});
  final String img;
  final Color color;
  final String text2;
  final String text1;
  final Color colortext1;
  final Color colorcontainer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: color,
        body: Stack(

          children: [

            Positioned(
              right: 45,
              left: 45,
              child: Container(
                height: 500,
                width: 400,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 162, 193, 238),
                      offset: Offset(20, 40),
                      blurRadius: 50,
                    ),

                  ],
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(150),
                      bottomRight: Radius.circular(150)),
                  color: colorcontainer,
                ),
              ),
            ),
 // Page 3
            Center(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, top: 50),
                    child: Text(
                      text2,
                      style: GoogleFonts.pacifico(
                          color: colortext1,
                          fontSize: 27,
                          fontWeight: FontWeight.w200),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 60, right: 60, top: 40),
                    child: Column(
                      children: [
                        Text(
                          text1,
                          style: GoogleFonts.ubuntu(
                             color: Color.fromARGB(255, 11, 0, 45),
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Container(
                            width: 50,
                            height: 5,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                              ),
                              color: Color(0xFF190933),
                            ),

                          ),
                        ),

                      ],

                    ),

                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    img,
                    width: 360,
                    height: 360,
                  ),

                ],
              ),
            ),
          ],

        ));
  }
}

class PaginaIntroDue extends StatelessWidget {
  const PaginaIntroDue(
      {super.key,
      required this.img,
      required this.color,
      required this.text2,
      required this.colortext1,
      required this.colorcontainer,
      required this.text1});
  final String img;
  final Color color;
  final String text2;
  final String text1;
  final Color colortext1;
  final Color colorcontainer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: color,
        body: Stack(

          children: [

            Positioned(
              top: 350,
              right: 45,
              left: 45,
              child: Container(
                height: 500,
                width: 400,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 180, 154, 247),
                      offset: Offset(20, 40),
                      blurRadius: 50,
                    ),

                  ],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(150),
                      topRight: Radius.circular(150)),
                  color: colorcontainer,
                ),
              ),
            ),
  //Page 2
            Center(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, top: 50),
                    child: Text(
                      text2,
                      style: GoogleFonts.pacifico(
                          color: colortext1,
                          fontSize: 34,
                          fontWeight: FontWeight.w500),
                    ),

                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 40, right: 40, top: 40),
                    child: Column(
                      children: [
                        Text(
                          text1,
                          style: GoogleFonts.ubuntu(
                              color: Color.fromARGB(255, 11, 0, 45),
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Container(
                            width: 70,
                            height: 5,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                              ),
                              color: Color.fromARGB(255, 142, 187, 238),
                            ),

                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 120,
                  ),

                  Image.asset(
                    img,
                    width: 350,
                    height: 350,
                  ),

                ],
              ),
            ),
          ],

        ));
  }
}
