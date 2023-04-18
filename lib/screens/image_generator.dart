import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ImageGeneratorScreen extends StatefulWidget {
  @override
  _ImageGeneratorScreenState createState() => _ImageGeneratorScreenState();
}

class _ImageGeneratorScreenState extends State<ImageGeneratorScreen> {
  String _inputText = '';
  String _imageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(35, 103, 249, 1),
        // elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('IMAGE GENERATOR',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              TextField(
                // onChanged: (value) {
                //   setState(() {
                //     _inputText = value;
                //   });
                // },
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(35, 103, 249, 1), width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  hintText: 'Enter some text...',
                  prefixIcon: Icon(Icons.textsms_rounded),
                  suffixIcon: Icon(Icons.cancel),
                ),
              ),
              const SizedBox(height: 15),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                      overlayColor: getColor(
                    Colors.white,
                    Color.fromRGBO(35, 103, 249, 1),
                  )),
                  onPressed: () async {
                    String apiKey =
                        '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';
                    String model = 'image-alpha-001';
                    String prompt =
                        'Generate an image based on the text: $_inputText';
                    String url = 'https://api.openai.com/v1/images/generations';
                    Map<String, String> headers = {
                      'Content-Type': 'application/json',
                      'Authorization': 'Bearer $apiKey',
                    };
                    Map<String, dynamic> body = {
                      'model': model,
                      'prompt': prompt,
                      'num_images': 1,
                      'size': '512x512',
                    };
                    var response = await http.post(
                      Uri.parse(url),
                      headers: headers,
                      body: json.encode(body),
                    );
                    var data = json.decode(response.body);
                    var imageUrl = data['data'][0]['url'];
                    setState(() {
                      _imageUrl = imageUrl;
                    });
                  },
                  child: const Text('Generate Image'),
                ),
              ),
              const SizedBox(height: 20),
              _imageUrl != ''
                  ? Image.network(_imageUrl)
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
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
