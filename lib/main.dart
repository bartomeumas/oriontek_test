import 'package:flutter/material.dart';
import 'package:oriontek_test/widgets/client_list.dart';
import 'package:oriontek_test/widgets/new_client.dart';

import 'models/client.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oriontek',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Oriontek'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Client> _clients = [];
  
  void _addNewClient(String clientFirstName, String clientLastName, int clientCedula, String clientAddress1, clientAddress2, clientAddress3) {
    final newClient = Client(
      firstName: clientFirstName,
      lastName: clientLastName,
      cedula: clientCedula,
      address1: clientAddress1,
      address2: clientAddress2,
      address3: clientAddress3,
      id: DateTime.now().toString(), 
    );

    setState(() {
          _clients.add(newClient);
        });
  }

  void _startAddNewClient(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewClient(_addNewClient),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteClient(String id) {
    setState(() {
      _clients.removeWhere((client) {
        return client.id == id;
      }); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          child: ClientList(_clients, _deleteClient),

        
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewClient(context),
        child: Icon(Icons.add),
      ), 
    );
  }
}