import 'package:customersouqjumla/presentation/screen/homescreen/widgets/subheadingwidgets.dart';
import 'package:customersouqjumla/presentation/widgets/appbarreusable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Image(
          width: 92,
          image: AssetImage(
            'assets/images/logo.png',
          ),
        ),
        automaticallyImplyLeading1: true,
      ),
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isTablet = constraints.maxWidth > 600;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25,
                ),
                subheadingwidget(
                  heading: "My Orders",
                  isTablet: isTablet,
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: isTablet
                      ? const EdgeInsets.only(left: 50, right: 50)
                      : const EdgeInsets.only(left: 25, right: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      // color: const Color.fromARGB(255, 245, 245, 245),
                      // color: Colors.yellow,
                      // border: Border.all(width: 1, color: Colors.green),
                      borderRadius: BorderRadius.circular(12),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: const Color.fromARGB(255, 0, 0, 0)
                      //         .withOpacity(0.5), // Shadow color
                      //     spreadRadius: -3, // How much the shadow spreads
                      //     blurRadius: 9, // The blur effect (softness)
                      //     offset:
                      //         Offset(3, 3), // The position of the shadow (x, y)
                      //   )
                      // ],
                    ),
                    child: Text(
                      "Lörem ipsum fädide krov åsk nätdeklarant mir. Tetravis. San sar teska pertotal. Kvasin växtmjölk lähäde sefäpp. Satonera antining pande kament.\n"
                      "Tekont bir intrafäde, om jågon pronde. Betest nånannanism och dungar teläheten ultraskade. Carpa sudoku ifall fasm yns. Vydil läktig. Dunera teraktig: samt tod i prevödat ifall ekokrati.\n"
                      "Reläre viv ist, makonde om pogisk. Treling dåska malysk, för ninade. Hypodubibel fäponing. Synigt epiosmos och prespehet SMS-meddelande yspena. Lagen infravis ljudöra.\n"
                      "Ar poheten: ar. Makrorelyning. Tinira nens. Pren religt. Vöngar kontrast tritesm.\n"
                      "Pregisk nyment har svennefiera. Dekabel flitbonus syngam gigasen prer. Selogi kvasiaktiv utom sost. Preska trerad i renade infralägt. Krobusonat kament. \n"
                      "Koka böcker operalog. Netrerepp misocentrism tede durtad att detris. Pebyd. Astrore neniv ten. Temakonfirmation pår inte paprede för ultravypladide popasat. \\n"
                      "Vösk besam, buvis: i lyvore, i exogöns. Glokal koren prenat. Nisade tirat. Aling nesk sybupp trafficking vaska. Sar växtbaserat kött.\n"
                      "Planade syssna som toren. Nesoskap öläng. Manat platenat. Intralagon fashionista monoparat har delig. Kror popcornhjärna dyrenade lårskav heterons.\n"
                      "",
                      style: TextStyle(
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
