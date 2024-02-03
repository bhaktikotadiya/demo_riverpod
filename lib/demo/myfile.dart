import 'package:demo_riverpod/demo/allprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main()
{
      runApp(ProviderScope(
          child: MaterialApp(
            home: myfile(),debugShowCheckedModeBanner: false,
          )
      ));
}

/*class myfile extends ConsumerStatefulWidget {
  const myfile({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _myfileState();
}

class _myfileState extends ConsumerState<myfile> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}*/

/*class myfile extends ConsumerWidget
{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Text("${}"),
        ElevatedButton(onPressed: (){

        }, child: Text("Increment")),
        ElevatedButton(onPressed: (){

        }, child: Text("Decrement")),
        Text("${}"),
      ]),
    );
  }
}*/

class myfile extends ConsumerStatefulWidget
{
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => myfileState();
}
class myfileState extends ConsumerState<myfile>
{
  @override
  Widget build(BuildContext context) {

    final c = ref.watch(Counterclass);
    final t = ref.watch(testString);

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Text("${c.counter}"),
        ElevatedButton(onPressed: (){
            c.inc();
        }, child: Text("Increment")),
        ElevatedButton(onPressed: (){
            c.dec();
        }, child: Text("Decrement",style: TextStyle(color: Colors.black),)),
        Text("${t}"),
      ]),
    );
  }

}
