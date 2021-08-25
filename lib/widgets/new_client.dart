import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:expand_widget/expand_widget.dart';

class NewClient extends StatefulWidget {
  final Function addClient;
  NewClient(this.addClient);

  @override
  _NewClientState createState() => _NewClientState(); 
}

class _NewClientState extends State<NewClient> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _cedulaController = TextEditingController();
  final _address1Controller = TextEditingController();
  final _address2Controller = TextEditingController();
  final _address3Controller = TextEditingController();

  void _submitData() {
    if(_cedulaController.text.isEmpty){
      return;
    }

    final enteredFirstName = _firstNameController.text;
    final enteredLastName = _lastNameController.text;
    final enteredCedula = _cedulaController.text;
    final enteredAddress1 = _address1Controller.text;
    final enteredAddress2 = _address2Controller.text;
    final enteredAddress3 = _address3Controller.text;
   

    if (enteredFirstName.isEmpty || enteredLastName.isEmpty || enteredCedula.isEmpty || enteredAddress1.isEmpty) {
      return;
    }

    widget.addClient(
      enteredFirstName,
      enteredLastName,
      enteredCedula,
      enteredAddress1,
      enteredAddress2,
      enteredAddress3,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
          child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(top: 10, right: 10, left: 10, bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'First Name'),
                controller: _firstNameController,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Last Name'),
                controller: _lastNameController,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Cedula'),
                controller: _cedulaController,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Address 1'),
                controller: _address1Controller,
                onSubmitted: (_) => _submitData(),
              ),
              ExpandChild(
                child: Column(
                  children: [
                    TextField(
                decoration: InputDecoration(labelText: 'Address 2'),
                controller: _address2Controller,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Address 3'),
                controller: _address3Controller,
                onSubmitted: (_) => _submitData(),
              ),
              ],
                ),
              ),
              ElevatedButton(
                child: Text('Add Client'),
                onPressed: _submitData,
              ),
            ],
          ),
        ),
      ),
    );
  }

}
