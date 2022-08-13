import 'dart:convert';

class JSONObject {
  late Map<String, dynamic> jsonContents;

  JSONObject(String jsonString) {
    jsonContents = json.decode(jsonString);
  }

  dynamic _get(String key, Map<String, dynamic> json) {
    if (json.containsKey(key)) {
      return json[key];
    } else {
      Iterable<dynamic> values = json.values;
      for (dynamic jsonValue in values) {
        try {
          return _get(key, jsonValue);
        } catch (e) {
          e.toString();
        }
      }
    }
    return null;
  }

  dynamic get(String key) {
    return _get(key, jsonContents);
  }

  String getString(String key) {
    return _get(key, jsonContents);
  }

  Map<String, dynamic> getJSONMap() {
    return jsonContents;
  }
}
