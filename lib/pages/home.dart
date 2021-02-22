import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data= {};

  @override
  Widget build(BuildContext context) {

    data= ModalRoute.of(context).settings.arguments;
    print(data);

    //set background
    String bgImage= data['isDayTime']? 'day.png': 'night.png';
    Color bgcolor= data['isDayTime']? Colors.blue: Colors.indigo[900];

    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0,120.0,0.0,0.0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/location');
                    },
                    icon: Icon(
                        Icons.edit_location,
                        color: Colors.white,
                    ),
                    label: Text(
                        'Edit Location',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                    )
                ),
                SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 20.0,
                        letterSpacing: 2.0,
                        color: Colors.grey[200],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 60.0,
                    color: Colors.grey[200]
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}