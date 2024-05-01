import 'dart:convert';

import 'package:advicer/0_data/exception/exception.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/advice_models.dart';

abstract class AdviceRemoteDatasource {
  /// request a random advice from API
  ///  return [adviceModel ] if successful
  /// throws a server-exception if status code is not 200
  Future<AdviceModel> getRandomAdviceFromApi();
}

class AdviceRemoteDatasourceImpl implements AdviceRemoteDatasource {
  final http.Client client;

  AdviceRemoteDatasourceImpl({required this.client});

  @override
  Future<AdviceModel> getRandomAdviceFromApi() async {
    final response = await client.get(
        Uri.parse('https://api.flutter-community.com/api/v1/advice'),
        headers: {
          'content-type': 'application/json',
        });
    debugPrint('response ${response.body}');
    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final responseBody = json.decode(response.body);
      return AdviceModel.fromJson(responseBody);
    }
  }
}
