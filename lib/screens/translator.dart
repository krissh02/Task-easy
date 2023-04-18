import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

import '../constants/colors.dart';
// import 'constants/colors.dart';

final translator = GoogleTranslator();
String? _dropDownvalue;
String? translated_text;
TextEditingController myController = TextEditingController();

class TranslatorDemo extends StatefulWidget {
  @override
  _TranslatorDemoState createState() => _TranslatorDemoState();
}

class _TranslatorDemoState extends State<TranslatorDemo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:
              const Color.fromRGBO(35, 103, 249, 1), // elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('TRANSLATE',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),
              Container(
                height: 40,
                width: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset('assets/img1.jpg'),
                ),
              ),
            ],
          ),
        ),
        body: Container(
            margin: EdgeInsets.fromLTRB(10, 30, 10, 50),
            child: Column(
              children: [
                Container(
                    width: double.infinity,
                    height: 40,
                    child: TextField(
                        controller: myController,
                        focusNode: FocusNode(canRequestFocus: false),
                        decoration: InputDecoration(
                          hintText: 'Enter Text',
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(35, 103, 249, 1),
                                width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                        ))),
                Container(
                    margin: EdgeInsets.only(top: 20),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      hint: _dropDownvalue == null
                          ? Text('Select language')
                          : Text(_dropDownvalue!,
                              style: TextStyle(color: Color.fromRGBO(35, 103, 249, 1))),
                      items: <String>[
                        'English',
                        'Hindi',
                        'Marathi',
                        'Gujarati',
                        'Kannada',
                        'Malayalam',
                        'Bengali',
                        'Oriya',
                        'Sanskrit',
                        'Spanish',
                        'Chineese',
                        'German',
                        'Arabic',
                        'French',
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Container(child: Text(value)),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _dropDownvalue = newValue;
                        });

                        if (_dropDownvalue == 'English') {
                          translate_text('en');
                        } else if (_dropDownvalue == 'Hindi') {
                          translate_text('hi');
                        } else if (_dropDownvalue == 'Marathi') {
                          translate_text('mr');
                        } else if (_dropDownvalue == 'Gujarati') {
                          translate_text('gu');
                        } else if (_dropDownvalue == 'Bengali') {
                          translate_text('bn');
                        } else if (_dropDownvalue == 'Kannada') {
                          translate_text('kn');
                        } else if (_dropDownvalue == 'Malayalam') {
                          translate_text('ml');
                        } else if (_dropDownvalue == 'Oriya') {
                          translate_text('or');
                        } else if (_dropDownvalue == 'Sanskrit') {
                          translate_text('sa');
                        } else if (_dropDownvalue == 'Chineese') {
                          translate_text('zh-cn');
                        } else if (_dropDownvalue == 'German') {
                          translate_text('de_DE');
                        } else if (_dropDownvalue == 'Arabic') {
                          translate_text('ar');
                        }
                      },
                    )),
                Container(
                    margin: EdgeInsets.only(top: 60),
                    child: translated_text != null
                        ? Text(translated_text!,
                            style: TextStyle(
                                fontSize: 60, 
                                fontWeight: FontWeight.bold))
                        : Text('')),
              ],
            )));
  }

  void translate_text(String locale) {
    translator.translate(myController.text, to: locale).then((value) {
      setState(() {
        translated_text = value.text;
      });
    });
  }
}
MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
  // ignore: prefer_function_declarations_over_variables
  final getColor = (Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return colorPressed;
    } else {
      return color;
    }
  };

  return MaterialStateProperty.resolveWith(getColor);
}

