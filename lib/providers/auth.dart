import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_complete_guide/models/http_exception.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _userId;

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyBQgJamvfUVYsLheuskV06cZFi5y4sI_8M');

    try {
      final response = await http.post(url,
          body: json.encode(
            {
              'email': email,
              'password': password,
              'returnSecureToken': true,
            },
          ));
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        //customException
        throw HttpException(responseData['error']['message']);
      }
    } catch (error) {
      throw error;
    }

    //print(json.decode(response.body));
  }

  Future<void> signUp(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }
}