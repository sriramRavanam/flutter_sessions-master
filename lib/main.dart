import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new TabController(
      length: 3,
      initialIndex: 0,
      vsync: this,
    );
  }

  List<WhatsAppDetails> details = [
    WhatsAppDetails(
      'Sriram1',
      'hello',
      '16:52',
      MessageStatus.delivered,
    ),
    WhatsAppDetails(
      'Sriram2',
      'hello2',
      '16:53',
      MessageStatus.delivered,
    ),
    WhatsAppDetails(
      'Sriram3',
      'bhak',
      '16:52',
      MessageStatus.delivered,
    ),
    WhatsAppDetails(
      'Sriram4',
      'dontRead',
      '16:52',
      MessageStatus.delivered,
    ),
    WhatsAppDetails(
      'Sriram5',
      'ez4ence',
      '16:52',
      MessageStatus.delivered,
    ),
    WhatsAppDetails(
      'Sriram6',
      'KennyS',
      '16:52',
      MessageStatus.delivered,
    ),
    WhatsAppDetails(
      'Sriram7',
      ':)',
      '16:52',
      MessageStatus.delivered,
    ),
    WhatsAppDetails(
      'Sriram8',
      'hi',
      '16:52',
      MessageStatus.delivered,
    ),
    WhatsAppDetails(
      'Sriram9',
      'LLG',
      '16:52',
      MessageStatus.delivered,
    ),
    WhatsAppDetails(
      'Sriram10',
      'hello',
      '16:52',
      MessageStatus.delivered,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Color whatsAppColor = Color(0xFF32642E);
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: controller,
          tabs: <Widget>[
            Tab(
              child: Text("CHATS"),
            ),
            Tab(
              child: Text("STATUS"),
            ),
            Tab(
              child: Text("CALLS"),
            ),
          ],
        ),
        actions:
        <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            onPressed: () {
              //ToDo
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              //ToDo
            },
          ),
        ],
        backgroundColor: whatsAppColor,
        title: Text('WhatsApp'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //ToDo
        },
        child: Icon(Icons.chat),
        backgroundColor: whatsAppColor,
      ),
      body:
      ListView.builder(
          itemCount: details.length,
          itemBuilder: (BuildContext context, int count) {
            return WhatsAppCard(
              name: details[count].name,
              message: details[count].message,
              time: details[count].time,
              status: details[count].status,
            );
          }),
    );
  }
}

class WhatsAppCard extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final MessageStatus status;
  WhatsAppCard({
      this.name,
      this.message,
      this.time,
      this.status,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95.0,
      padding: EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.account_circle,
              size: 75.0,
              color: Colors.grey.withOpacity(0.7),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 30, //fontFamily: 'myscars' ,
                      fontWeight: FontWeight.w400),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.check,
                      size: 15.0,
                      color: Colors.grey,
                    ),
                    Text(
                      message,
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Padding(
            padding: EdgeInsets.only(top: 14.0),
            child: Text(time),
          ),
        ],
      ),
    );
  }
}
class WhatsAppDetails{
  String name;
  String message;
  String time;
  MessageStatus status;
  WhatsAppDetails(this.name,this.message,this.time,this.status);
}
enum MessageStatus{
  delivered,
  recieved,
  seen
}
