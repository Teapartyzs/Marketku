import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:marketku/global_variables.dart';
import 'package:marketku/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:marketku/services/http_response.dart';

class AuthController {
  Future<void> signUpUser({
    required BuildContext context,
    required String fullname,
    required String email,
    required String password,
  }) async {
    try {
      User user = User(
          id: '',
          fullname: fullname,
          email: email,
          password: password,
          city: '',
          fullAddress: '',
          token: '');
      http.Response response = await http.post(Uri.parse('$ip/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8"
          });
      httpResponse(
          response: response,
          context: context,
          onSuccess: () {
            showSnackBar(context, "Create account success!");
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response response = await http.post(Uri.parse('$ip/api/signin'),
          body: jsonEncode({'email': email, 'password': password}),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });
      httpResponse(
          response: response,
          context: context,
          onSuccess: () {
            showSnackBar(context, "Sign in success, welcome!");
          });
    } catch (e) {}
  }
}
