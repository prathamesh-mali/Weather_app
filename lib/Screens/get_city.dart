import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CityName extends StatefulWidget {
  const CityName({super.key});

  @override
  State<CityName> createState() => _CityNameState();
}

class _CityNameState extends State<CityName> {
  get _textController => TextEditingController();
  String _displayText = '';

  void _submitText() {
    setState(() {
      _displayText = _textController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
        ),
        body: Padding(
            padding:
                const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(children: [
                  Align(
                    alignment: const AlignmentDirectional(3, -0.3),
                    child: Container(
                      height: 300,
                      width: 300,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.deepPurple),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-3, -0.3),
                    child: Container(
                      height: 300,
                      width: 300,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xFF673AB7)),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0, -1.2),
                    child: Container(
                      height: 300,
                      width: 600,
                      decoration: const BoxDecoration(color: Color(0xFFFFAB40)),
                    ),
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                    child: Container(
                      decoration:
                          const BoxDecoration(color: Colors.transparent),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextField(
                          controller: _textController,
                          decoration: const InputDecoration(
                            focusColor: Colors.white,
                            labelText: 'Enter Text',
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: _submitText,
                          child: const Text('Submit'),
                        ),
                        Text(
                          'You entered: $_displayText',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  )
                ]))));
  }
}
