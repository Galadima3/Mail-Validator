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

  EmailData(String email) async {
    returnedData = await ApiService().getMailInfo(widget.emailAddress);
    print(returnedData);
    return returnedData;
  }

  @override
  void initState() {
    // TODO: implement initState
    EmailData(widget.emailAddress);
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
                  future: EmailData(widget.emailAddress),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.connectionState ==
                            ConnectionState.done &&
                        snapshot.hasData) {
                      //return Text(returnedData.toString());
                      return Column(
                        children: [
                          SizedBox(
                            height: 50,
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
                              Card(
                                child: Container(
                                  color: Colors.grey[300],
                                  width: 250,
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Deliverability',
                                        style: TextStyle(fontSize: 19),
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Valid Format',
                                    style: TextStyle(fontSize: 19),
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Free Email',
                                    style: TextStyle(fontSize: 19),
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
