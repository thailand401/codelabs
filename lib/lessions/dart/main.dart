import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  var str = getJSONData();
  print(str);
}

getFuture() => Future(() => ['1', '2']);

class ContactModal {
  final String fullName;

  const ContactModal({this.fullName});
}

Future<String> getJSONData() async {
  final String url =
      "https://api.airtable.com/v0/appxz494JfvEM6uv4/menu?maxRecords=15";
  List data;
  var response = await http.get(
      // Encode the url
      Uri.encodeFull(url),
      // Only accept JSON response
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer keyzAKTDalx09sgph"
      });

  var dataConvertedToJSON = json.decode(response.body);
  // Extract the required part and assign it to the global variable named data
  data = dataConvertedToJSON['records'];
  print("--------------------------------");
  //print(data);
  for (var x in data) {
    print(x['fields']['title']);
  }
  print("--------------------------------");

  return "Successfull";
}
