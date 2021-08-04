import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:chaquopy/chaquopy.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _controller;
  TextEditingController temperature = TextEditingController();
  TextEditingController windSpeed = TextEditingController();
  TextEditingController windDirection = TextEditingController();
  TextEditingController humidity = TextEditingController();

  late FocusNode _focusNode;

  String _outputOrError = "", _error = "";

  Map<String, dynamic> data = Map();
  bool loadImageVisibility = true;

  @override
  void initState() {
    _controller = TextEditingController();
    _focusNode = FocusNode();
    super.initState();
  }

  Future<String> getFileData(String path) async {
    return await rootBundle.loadString(path);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // top: true,
      // minimum: EdgeInsets.only(top: 4),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: new DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.2), BlendMode.dstATop),
                  image: AssetImage(
                    'assets/Background.jpeg',
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
              // child: Image.asset(
              //   'assets/Background.jpeg',
              //   fit: BoxFit.cover,
              // ),
            ),
            Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Center(
                      child: Container(
                        child: Text(
                          'Solar Radiation Prediction',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    )),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Row(
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Temperature: '),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: TextFormField(
                                  textInputAction: TextInputAction.next,
                                  controller: temperature,
                                  // autofocus: true,
                                  keyboardType: TextInputType.emailAddress,
                                  // onEditingComplete: () =>
                                  //     FocusScope.of(context).nextFocus(),

                                  // validator: (value) {
                                  //   if (value!.isEmpty) {
                                  //     return "Cannot be empty";
                                  //   } else if (!emailValidatorRegExp
                                  //       .hasMatch(value)) {
                                  //     // addError(error: kInvalidEmailError);
                                  //     return "Invalid Email Id";
                                  //   }
                                  //   return null;
                                  // },
                                  decoration: InputDecoration(
                                    filled: true,
                                    // fillColor: Colors.white,
                                    hintText: 'Temperature',
                                    // labelText: 'Temperature',
                                    labelStyle: TextStyle(
                                      color: Colors.red,
                                    ),

                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 15.0, horizontal: 22.0),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Row(
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Wind Speed: '),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: TextFormField(
                                  textInputAction: TextInputAction.next,
                                  controller: windSpeed,
                                  // autofocus: true,
                                  keyboardType: TextInputType.emailAddress,
                                  // onEditingComplete: () =>
                                  //     FocusScope.of(context).nextFocus(),

                                  // validator: (value) {
                                  //   if (value!.isEmpty) {
                                  //     return "Cannot be empty";
                                  //   } else if (!emailValidatorRegExp
                                  //       .hasMatch(value)) {
                                  //     // addError(error: kInvalidEmailError);
                                  //     return "Invalid Email Id";
                                  //   }
                                  //   return null;
                                  // },
                                  decoration: InputDecoration(
                                    filled: true,
                                    // fillColor: Colors.white,
                                    hintText: 'Wind Speed',
                                    // labelText: 'Temperature',
                                    labelStyle: TextStyle(
                                      color: Colors.red,
                                    ),

                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 15.0, horizontal: 22.0),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Row(
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Humidity: '),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: TextFormField(
                                  textInputAction: TextInputAction.next,
                                  controller: humidity,
                                  // autofocus: true,
                                  keyboardType: TextInputType.emailAddress,
                                  // onEditingComplete: () =>
                                  //     FocusScope.of(context).nextFocus(),

                                  // validator: (value) {
                                  //   if (value!.isEmpty) {
                                  //     return "Cannot be empty";
                                  //   } else if (!emailValidatorRegExp
                                  //       .hasMatch(value)) {
                                  //     // addError(error: kInvalidEmailError);
                                  //     return "Invalid Email Id";
                                  //   }
                                  //   return null;
                                  // },
                                  decoration: InputDecoration(
                                    filled: true,
                                    // fillColor: Colors.white,
                                    hintText: 'Humidity',
                                    // labelText: 'Temperature',
                                    labelStyle: TextStyle(
                                      color: Colors.red,
                                    ),

                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 15.0, horizontal: 22.0),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Row(
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Wind Direction: '),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: TextFormField(
                                  textInputAction: TextInputAction.next,
                                  controller: windDirection,
                                  // autofocus: true,
                                  keyboardType: TextInputType.emailAddress,
                                  // onEditingComplete: () =>
                                  //     FocusScope.of(context).nextFocus(),

                                  // validator: (value) {
                                  //   if (value!.isEmpty) {
                                  //     return "Cannot be empty";
                                  //   } else if (!emailValidatorRegExp
                                  //       .hasMatch(value)) {
                                  //     // addError(error: kInvalidEmailError);
                                  //     return "Invalid Email Id";
                                  //   }
                                  //   return null;
                                  // },
                                  decoration: InputDecoration(
                                    filled: true,
                                    // fillColor: Colors.white,
                                    hintText: 'Wind Direction',
                                    // labelText: 'Temperature',
                                    labelStyle: TextStyle(
                                      color: Colors.red,
                                    ),

                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 15.0, horizontal: 22.0),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Expanded(
                //   flex: 3,
                //   child: TextFormField(
                //     keyboardType: TextInputType.multiline,
                //     focusNode: _focusNode,
                //     controller: _controller,
                //     minLines: 10,
                //     maxLines: 20,
                //   ),
                // ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Text(
                      'Result : $_outputOrError',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                FutureBuilder(
                  future: getFileData('assets/mlproject.py'),
                  initialData: "Loading..",
                  builder: (context, AsyncSnapshot<String> snapshot) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: MaterialButton(
                            height: 50,
                            color: Colors.amber,
                            child: Text(
                              'Get Result!',
                            ),
                            onPressed: () async {
                              final _result = await Chaquopy.executeCode(
                                  snapshot.data.toString());
                              setState(() {
                                _outputOrError =
                                    _result['textOutputOrError'] ?? '';
                              });
                            },
                          ),
                        ),
                      ],
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
