import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home();

  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  static const TextStyle linkStyle = const TextStyle(
    color: Colors.blue,
    decoration: TextDecoration.underline,
  );

  Widget home(BuildContext context) {
    return new Material(
      child: new ElevatedButton(
        child: const Text('Show Pop-up'),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => _buildAboutDialog(context),
          );
          // Perform some action
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.only(top: 100.0),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: new Column(
        children: [
          home(context),
        ],
      ),
    );
  }

  Widget _buildAboutDialog(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 400,
        width: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAboutText(),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutText() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.home,
              color: Colors.blue,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              'Online Test',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Icon(
              Icons.calendar_today,
              color: Colors.grey,
              size: 14,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              '15 sep 2022',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Your Online Test schedule is given below. After this phase, Employer will let you konw about the next step:',
          style: TextStyle(color: Colors.black54),
        ),
        SizedBox(
          height: 10,
        ),
        Stack(
          children: [
            SizedBox(
              width: 300,
              height: 158,
              child: Card(
                elevation: 0,
                color: Colors.grey.shade100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_today,
                                        size: 14,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text('Date'),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Text('18 Sep 2022'),
                                ],
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.access_time_sharp,
                                        size: 14,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text('Time'),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Text('18 Sep 2022'),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              right: 10,
              top: 70,
              child:Card(
                child: Container(
                  height: 70,
                  width: 200,
                  color: Colors.red.shade100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('This is an Online Test so no need to be present at company office. You can attend this test from home or any convention place',
                        style: TextStyle(color: Colors.red.shade800,fontSize: 12),),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10,),
        Align(
          alignment: Alignment.centerRight,
            child: Text('Test Instructions',style: TextStyle(fontSize: 12),)),
        SizedBox(height: 20,),
        Row(
          children: [
            Text('Expired',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
            Spacer(),
            Text('16 Sep 2022',style: TextStyle(fontSize: 12),),
          ],
        ),
        SizedBox(height: 10,),
        Text('This online test has been expired',style: TextStyle(fontSize: 14),),
        Text('- - - - - - - - - - - - - - - - - - - - - - - -')
      ],
    );
  }

  void _selectDate() async{
    final selectDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime.now()
    );
    if(selectDate !=null){
      setState((){
        //_dob=DateFormat('dd/MM/yyyy').format(selectDate);
      });
    }
  }
}


