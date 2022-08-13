import 'dart:convert';

class JSONObject {
  // map to store the JSON decoded data
  late Map<String, dynamic> jsonContents;

  JSONObject(String jsonString) {
    jsonContents = json.decode(jsonString);
  }

  dynamic _get(String key, Map<String, dynamic> json) {
    if (json.containsKey(key)) {
      return json[key]; // returns the value associated with the given key
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

  // return the data associated with the given key
  dynamic get(String key) {
    return _get(key, jsonContents);
  }

  // return the data associated with the given key in string format
  String getString(String key) {
    return _get(key, jsonContents);
  }

  // returns the JSON data in a map format
  Map<String, dynamic> getJSONMap() {
    return jsonContents;
  }
}
