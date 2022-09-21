// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mail_validator/services/networking.dart';

class ResultPage extends StatefulWidget {
  final String emailAddress;
  const ResultPage({super.key, required this.emailAddress});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  var returnedData;

  emailData(String email) async {
    returnedData = await ApiService().getMailInfo(widget.emailAddress);

    return returnedData;
  }

  @override
  void initState() {
    emailData(widget.emailAddress);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Center(
                child: FutureBuilder(
                  future: emailData(widget.emailAddress),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.connectionState ==
                            ConnectionState.done &&
                        snapshot.hasData) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 80,
                          ),
                          ListTile(
                            iconColor: Colors.blue,
                            leading: Icon(Icons.email),
                            title: Text(
                              returnedData['email'],
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              returnedData['autocorrect'].toString().isNotEmpty
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Container(
                                        color: Colors.grey[300],
                                        width: double.infinity,
                                        height: 50,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'AutoCorrect: ${returnedData['autocorrect']}',
                                                style: TextStyle(fontSize: 17),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : Container(),
                              SizedBox(
                                height: 20,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  color: Colors.grey[300],
                                  width: 230,
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Deliverability',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      returnedData['deliverability'] == 'TRUE'
                                          ? Icon(
                                              Icons.check,
                                              color: Colors.blue,
                                            )
                                          : Icon(
                                              Icons.cancel,
                                              color: Colors.blue,
                                            )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  color: Colors.grey[300],
                                  width: 230,
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Valid Format',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      returnedData['is_valid_format']['text'] ==
                                              'TRUE'
                                          ? Icon(
                                              Icons.check,
                                              color: Colors.blue,
                                            )
                                          : Icon(
                                              Icons.cancel,
                                              color: Colors.blue,
                                            )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  color: Colors.grey[300],
                                  width: 230,
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Free Email',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      returnedData['is_valid_format']['text'] ==
                                              'TRUE'
                                          ? Icon(
                                              Icons.check,
                                              color: Colors.blue,
                                            )
                                          : Icon(
                                              Icons.cancel,
                                              color: Colors.blue,
                                            )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  color: Colors.grey[300],
                                  width: 230,
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Quality Score',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      double.parse(returnedData[
                                                  'quality_score']) <
                                              0.5
                                          ? Text(
                                              returnedData['quality_score'],
                                              style:
                                                  TextStyle(color: Colors.red),
                                            )
                                          : Text(
                                              returnedData['quality_score'],
                                              style:
                                                  TextStyle(color: Colors.blue),
                                            )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    } else {
                      return const Text('Error');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
