import 'package:flutter/material.dart';

import '../models/client.dart';

class ClientList extends StatelessWidget {
  final List<Client> clients;
  final Function deleteClient;

  ClientList(this.clients, this.deleteClient);

  @override
  Widget build(BuildContext context) {
    return clients.isEmpty
          ? LayoutBuilder (builder: (ctx, constraints){
            return Column(
              children: <Widget>[
                Text(
                  'No clients added yet!',
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            );
          })
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Column(
                  children: [
                    Card(
                        elevation: 5,
                        margin: EdgeInsets.symmetric
                        (vertical: 8, 
                        horizontal: 5),
                        child: ListTile(
                        leading: CircleAvatar(
                        radius: 30, child: Padding (
                          padding: EdgeInsets.all(6), child: FittedBox(
                            child: Text(
                              clients[index].firstName[0] + clients[index].lastName[0])
                              )
                             ),
                            ), 
                              title: Text(
                                clients[index].firstName + ' ' +  clients[index].lastName, 
                                style: Theme.of(context).textTheme.headline6,), 
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                    clients[index].cedula.toString()),
                                    Text(
                                      clients[index].address1.toString()
                                    ),
                                    clients[index].address2.toString() == 'null'
                                    ? Text('')
                                    : Text(
                                      clients[index].address2.toString()),
                                    clients[index].address3.toString() == 'null'
                                    ? Text('')
                                    : Text(
                                      clients[index].address3.toString()),
                                    ],
                                ), 
                                  trailing: MediaQuery.of(context).size.width > 360 ?
                                    TextButton.icon(icon: Icon(Icons.delete), label: Text('Delete') , onPressed: () => deleteClient(clients[index].id)) 
                                    : IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () => deleteClient(clients[index].id),
                        ),
                      ),
                    ),
                  ],
                );
              },
              itemCount: clients.length,
            );
          }
        }
