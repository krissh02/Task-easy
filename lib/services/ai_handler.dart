import 'dart:convert';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

class AIHandler {
  final List<Map<String, String>> messages = [];
  final _openAI = OpenAI.instance.build(
    token: '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',
    baseOption: HttpSetup(
      receiveTimeout: const Duration(seconds: 60),
      connectTimeout: const Duration(seconds: 60),
    ),
  );

Future<String> getResponse(String message) async {
    messages.add({
      'role': 'user',
      'content': message,
    });
    try {
      final request = ChatCompleteText(messages: messages, maxToken: 200, model: kChatGptTurbo0301Model);

      final response = await _openAI.onChatCompletion(request: request);
      if (response != null) {
        return response.choices[0].message.content.trim();
      }
      return 'Some thing went wrong';
    } catch (e) {
      return 'Bad response';
    }
  }


  void dispose() {
    _openAI.close();
  }
}



// import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
// import 'package:http/http.dart' as http;
// import '../constants/api_consts.dart';

// class Api {
//   static final url = Uri.parse("https://api.openai.com/v1/images/generations");

//   static final headers = {
//     "Content-Type": "application/json",
//     "Authorization": "Bearer $OPENAI_API_KEY"
//   };

//   static generateImage(String text, String size) async {
//     var res = await http.post(url,
//         headers: headers,
//         body: jsonEncode({"prompt": text, "n": 1, "size": size}));
//     if (res.statusCode == 200) {
//       var data = jsonDecode(res.body.toString());
//       print(data);
//     } else {
//       print("Failed to fetch image");
//     }
//   }
// }
