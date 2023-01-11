import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var data = {};


  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    String bgImg = data['Daytime'] ? 'assets/images/days.png' : 'assets/images/nights.png';
    Color bgColor = data['Daytime'] ? Colors.blue : Colors.indigo[700] as Color;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child:Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(bgImg),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,160,0,0),
              child: Column(
                children: [
                  TextButton.icon(
                    onPressed: () async {
                    dynamic result =  await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'flag': result['flag'],
                        'Daytime': result['Daytime'],
                      };
                    });
                    },
                    label: Text('Edit Location'),
                    icon: Icon(Icons.edit_location_alt_outlined),
                    style: ButtonStyle(
                      foregroundColor: MaterialStatePropertyAll(Colors.grey[200]),
                    ),
                  ),
                  SizedBox(height: 25),
                  Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                      data['location'],
                        style: TextStyle(
                          fontSize: 36,
                          letterSpacing: 2,
                          color: Colors.white,
                        ) ,
                      ),
                    ],
                  ),
                  SizedBox(height: 35),
                  Text(
                      data['time'],
                    style: TextStyle(
                      fontSize: 70,
                      letterSpacing: 2,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
