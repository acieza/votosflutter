import 'package:votosflutter/models/votos.dart';
import 'package:flutter/material.dart';

class VotosList extends StatelessWidget {
  const VotosList({Key key, this.votos}) : super(key: key);

  final List<Votos> votos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: votos == null ? 0 : votos.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            leading: Icon(Icons.person),
            title: Text(votos[index].titulo),
            subtitle: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: LinearProgressIndicator(
                value: votos[index].likes.toDouble() / 1000,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black38),
                backgroundColor: Colors.grey.withOpacity(0.3),
              ),
            ),
          ),
        );
      },
    );
  }
}
