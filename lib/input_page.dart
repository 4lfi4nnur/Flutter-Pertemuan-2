import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_contet.dart';

const bottomContainerHeight = 80.0;
const activeCardColour = Color(0xFF1D1E33);
const inActiveCardColour = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = inActiveCardColour;
  Color femaleCardColour = inActiveCardColour;

  // 1 = male, 2 = female

  void updateColour(Gender selectedGender) {
    if (selectedGender == Gender.male) {
      if (maleCardColour == inActiveCardColour) {
        maleCardColour = activeCardColour;
        femaleCardColour = inActiveCardColour;
      } else {
        maleCardColour = inActiveCardColour;
      }
    } else {
      if (femaleCardColour == inActiveCardColour) {
        femaleCardColour = activeCardColour;
        maleCardColour = inActiveCardColour;
      } else {
        femaleCardColour = inActiveCardColour;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: Color(0xFF0A0E21),
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            // ini untuk jenis kelamin
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    // child: GestureDetector(
                    //   onTap: () {
                    //     // print('Anda memilih laki laki');
                    //     setState(() {
                    //       updateColour(Gender.male);
                    //     });
                    //   },

                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          updateColour(Gender.male);
                        });
                      },
                      colour: maleCardColour,
                      cardChild: IconContent(
                          icon: FontAwesomeIcons.mars, label: 'MALE'),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // print('Anda memilih perempuan');
                        setState(() {
                          updateColour(Gender.female);
                        });
                      },
                      child: ReusableCard(
                        colour: femaleCardColour,
                        cardChild: IconContent(
                            icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // ini untuk tinggi
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: inActiveCardColour,
                  ),
                ),
              ],
            )),

            // ini untuk berat dan umur
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: inActiveCardColour,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: inActiveCardColour,
                  ),
                ),
              ],
            )),

            // tombol untuk calculate
            Container(
              margin: EdgeInsets.only(top: 10.0),
              height: bottomContainerHeight,
              width: double.infinity,
              color: bottomContainerColor,
            )
          ],
        ));
  }
}
