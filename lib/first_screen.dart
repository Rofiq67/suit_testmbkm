import 'package:flutter/material.dart';
import 'package:test_mbkm/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  // TextEditingController labelController = TextEditingController();
  final TextEditingController _name = TextEditingController();
  TextEditingController sentenceController = TextEditingController();

  bool isPalindrome(String text) {
    String cleanedText = text.toLowerCase().replaceAll(" ", "");
    String reversedText = cleanedText.split('').reversed.join('');
    return cleanedText == reversedText;
  }

  void checkPalindrome() {
    String sentence = sentenceController.text;
    bool result = isPalindrome(sentence);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(result ? 'isPalindrome' : 'not palindrome'),
          content: Text(sentence),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff4498ac),
                Color(0xff8096ac),
                Color(0xff316a89),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 0.5, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 116,
                    width: 116,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.5)),
                    child: const Center(
                      child: Icon(
                        Icons.person_add_alt_1,
                        color: Colors.white,
                        size: 29,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 51,
                  ),
                  //name
                  Container(
                    width: 310,
                    height: 41,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: _name,
                      decoration: const InputDecoration(
                        hintText: 'Name',
                        hintStyle: TextStyle(
                          color: Color(0x5B686777),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 22.12,
                  ),
                  //palindrome
                  Container(
                    width: 310,
                    height: 41,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: sentenceController,
                      decoration: const InputDecoration(
                        hintText: 'Palindrom',
                        hintStyle: TextStyle(
                          color: Color(0x5B686777),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      checkPalindrome();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2B637B),
                        maximumSize: const Size(310, 41),
                        minimumSize: const Size(310, 41),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: const Text(
                      'CHECK',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecondScreen(name: _name.text),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2B637B),
                        maximumSize: const Size(310, 41),
                        minimumSize: const Size(310, 41),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: const Text(
                      'NEXT',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
