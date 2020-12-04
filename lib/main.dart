import 'package:flutter/material.dart';
import 'package:votosflutter/votoslist.dart';
import 'package:votosflutter/models/votos.dart';
import 'package:votosflutter/services/api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  final ApiService api = ApiService();

  List<Votos> votosList;

  @override
  Widget build(BuildContext context) {
    if (votosList == null) {
      votosList = List<Votos>();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: loadList(),
            builder: (context, snapshot) {
              return votosList.length > 0
                  ? VotosList(votos: votosList)
                  : Center(
                      child: Text('No hay registros'),
                    );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future loadList() {
    Future<List<Votos>> futureVotos = api.getVotos();
    futureVotos.then((votosList) {
      setState(() {
        this.votosList = votosList;
      });
    });
    return futureVotos;
  }
}
