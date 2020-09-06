import 'dart:convert';

import 'package:easytmdb/Helper/UrlMaker.dart';
import 'package:easytmdb/Helper/Utils.dart';
import 'package:easytmdb/Model/Find/Find.dart';
import 'package:http/http.dart' as http;

class FindExternal{
  Future<Find> externalItem(String id, String externalSourceName) async {
    var response = await http.get(UrlMaker.find(id, externalSourceName));

    return Utils.isValidResponse(response)
        ? Find.fromJson(json.decode(response.body))
        : Utils.error(response);
  }
}