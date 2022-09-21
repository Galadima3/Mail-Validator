// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mail_validator/screens/result_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final emailController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Center(
              child: SizedBox(
                width: 290,
                child: TextField(
                  controller: emailController,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Validate Email',
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return ResultPage(
                        emailAddress: emailController.text.trim());
                  },
                ));
              },
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 42,
                    width: 190,
                    color: Colors.blueAccent,
                    child: Center(
                      child: Text(
                        'Validate',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
