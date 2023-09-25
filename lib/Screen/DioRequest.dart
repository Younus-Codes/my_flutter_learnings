import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioRequest extends StatefulWidget {
  const DioRequest({super.key});

  @override
  State<DioRequest> createState() => _DioRequestState();
}

class _DioRequestState extends State<DioRequest> {
  var jsonData;
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    try {
      var response = await Dio()
          .get("https://protocoderspoint.com/jsondata/superheros.json");
      if (response.statusCode == 200) {
        jsonData = response.data["superheros"] as List;
        print(jsonData);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(jsonData[index]["url"]),
                ),
                title: Text(jsonData[index]["name"]),
                subtitle: Text(jsonData[index]["power"]),
              ),
            );
          },
          itemCount: jsonData == null ? 0 : jsonData.length),
    );
  }
}
