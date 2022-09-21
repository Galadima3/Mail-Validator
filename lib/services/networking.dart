import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:mail_validator/constants.dart';
import 'package:mail_validator/models/email.dart';

class ApiService{
  Future getMailInfo(String email) async{
    try{
      String uri = 'https://emailvalidation.abstractapi.com/v1/?api_key=d35fa8a4a15a406b997485548d46211b&email=$email';
      var url = Uri.parse(uri);
      var response = await get(url);
      if (response.statusCode == 200){
        var emailData = jsonDecode(response.body);
        
        return emailData;
      }
    } catch (e){
      log(e.toString());
    }
  }
}