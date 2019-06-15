import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/utils/blocs/sayi_bloc.dart';
import 'package:flutter_bloc_example/utils/states/sayi_state.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  final _mySayiBloc = SayiBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SayiBloc>(
      builder: (context) => _mySayiBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: new MyCenterWidget(),
        floatingActionButton: new MyFloatingActionButtons(),
      ),
    );
  }
}

class MyFloatingActionButtons extends StatelessWidget {
  const MyFloatingActionButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MySayiWidget();
  }
}

class MySayiWidget extends StatelessWidget {
  const MySayiWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          tooltip: 'Increment',
          child: Icon(Icons.add),
          onPressed: () => BlocProvider.of<SayiBloc>(context).onArttir(),
        ),
        FloatingActionButton(
          tooltip: 'Increment',
          child: Icon(Icons.remove),
          onPressed: () => BlocProvider.of<SayiBloc>(context).onAzalt(),
        ),
      ],
    );
  }
}

class MyCenterWidget extends StatelessWidget {
  const MyCenterWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BlocBuilder(
            bloc: BlocProvider.of<SayiBloc>(context),
            builder: (BuildContext context, SayiState state) {
              return Text(
                '${state.sayi.toString()}',
                style: Theme.of(context).textTheme.display1,
              );
            },
          ),
        ],
      ),
    );
  }
}
