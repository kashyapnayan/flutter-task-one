import 'package:flutter/material.dart';
import 'package:flutter_task_one/bloc/text_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    print('-----------build-----------');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: bloc.firstTextStream,
              builder: (context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!);
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return const Text('Text 1');
              },
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                bloc.updateFirstText('Button 1 Clicked');
              },
              child: const Text('Button One'),
            ),
            const SizedBox(height: 20,),
            StreamBuilder(
              stream: bloc.secondTextStream,
              builder: (context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!);
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return const Text('Text 2');
              },
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                bloc.updateSecondText('Button 2 Clicked');
              },
              child: const Text('Button Two'),
            )
          ],
        ),
      ),
    );
  }
}
