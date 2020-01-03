import 'package:flutter/material.dart';
import 'package:orakolo_training/app/modules/home/home_module.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc _bloc = HomeModule.to.getBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Teste'),
          StreamBuilder(
            stream: _bloc.counter,
            builder: (context, AsyncSnapshot<int> snapshot) {
              if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
              if (snapshot.hasError) return Center(child: Text('Erro'));

              return Center(child: Text('counter: ${snapshot.data}'));
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _bloc.changeCounter,
        child: Icon(Icons.add),
      ),
    );
  }
}
