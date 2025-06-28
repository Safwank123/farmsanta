// ignore_for_file: empty_catches

import 'dart:convert';


import 'package:farmsanta_new/Services/shared_helper.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class CrudApi {
  final Function? fromMapFunc;
  final Function? sortModelFunc;
  final String? crudUrl;
  final String? endpointPaginated;
  CrudApi({
    this.fromMapFunc,
    this.sortModelFunc,
    this.crudUrl,
    this.endpointPaginated,
  });

  Future<http.Response?> post(
    data, {
    bool passToken = true,
    String? url,
  }) async {
    try {
      var response =
          await createPostRequest(url ?? crudUrl!, json.encode(data));
      print(
          "create request url - ${response.request!.url}\nrequest body- $data\nstatus code - ${response.statusCode}\nresponse body - ${response.body}");
      return response;
    } catch (e) {
      return null;
    }
  }

  Future<http.Response?> put(
    data, {
    bool passToken = true,
    String? url,
  }) async {
    try {
      var response = await createPutRequest(crudUrl!, json.encode(data));
      print(
          "update request url - ${response.request!.url}\nrequest body- $data\nstatus code - ${response.statusCode}\nresponse body - ${response.body}");

      return response;
    } catch (e) {}

    return null;
  }

  Future<http.Response?> get({
    bool passToken = true,
    String? url,
  }) async {
    try {
      var response = await createGetRequest(
          "${url ?? crudUrl!}?languageId=${SharedHelper.languageId}");
      var logger = Logger();
      logger.e("response body - ${response.body} ${response.headers}");

      return response;
    } catch (e) {}
    return null;
  }

  Future<http.Response?> delete({bool passToken = true, String? url}) async {
    try {
      var response = await createDeleteRequest(
        url ?? crudUrl!,
      );
      print(
          "delete request url - ${response.request!.url}\nstatus code - ${response.statusCode}\nresponse body - ${response.body}");

      return response;
    } catch (e) {}
    return null;
  }

  Future<List> getPaginatedData(List params, {bool passToken = true}) async {
    List model = [];
    String url = endpointPaginated!;
    for (var param in params) {
      url += "/$param";
    }

    try {
      var response = await createGetRequest(url);
      if (response.statusCode == 200) {
        final jsonData = Map<String, dynamic>.from(jsonDecode(response.body));
        List json = jsonData['data'];
        for (var element in json) {
          try {
            model.add(sortModelFunc!(element));
          } catch (e) {}
        }
      }
    } catch (e) {}
    return model;
  }
}

////// CREATING CRUD REQUEST WITH/WITHOUT AUTH TOKENS //////////
Map<String, String> headers() {
  return {
    'accept': '*/*',
    'Content-Type': 'application/json',
    'Authorization': SharedHelper.authToken,
  };
}

Future<http.Response> createPostRequest(String url, body,
    {bool passToken = true}) async {
  var header = headers();
  if (!passToken) {
    header.remove("authToken");
  }
  print("request url- $url \nrequest body - $body");
  return await http.post(
    Uri.parse(url),
    headers: header,
    body: body,
  );
}

Future<http.Response> createPutRequest(String url, body,
    {bool passToken = true}) async {
  var header = headers();
  if (!passToken) {
    header.remove("authToken");
  }
  return await http.put(
    Uri.parse(url),
    headers: header,
    body: body,
  );
}

Future<http.Response> createGetRequest(String url,
    {bool passToken = true}) async {
  var header = headers();
  if (!passToken) {
    header.remove("authToken");
  }

  print("url is $url $header");
  return await http.get(
    Uri.parse(url),
    headers: header,
  );
}

Future<http.Response> createDeleteRequest(String url,
    {bool passToken = true}) async {
  var header = headers();
  if (!passToken) {
    header.remove("authToken");
  }
  return await http.delete(
    Uri.parse(url),
    headers: header,
  );
}
