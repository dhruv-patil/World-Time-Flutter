import 'package:http/http.dart' ;
import 'dart:convert';
import 'package:intl/intl.dart';

class Worldtime {

  String location;
  String flag;
  String time="" ;
  String url;
  late bool Daytime;

  Worldtime ({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);


      String datetime = data['utc_datetime'];
      String offset1 = data['utc_offset'].substring(0,3);
      String offset2 = data['utc_offset'].substring(4,6);
      //print (datetime);
      //print (offset);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset1),minutes:int.parse(offset2)));

      Daytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);


    }
    catch (e) {

      print('caught error $e');
      time = 'couldnt find any data';

    }




  }
}


