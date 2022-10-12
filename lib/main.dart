import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:  FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
   FormPage({Key? key}) : super(key: key);
  @override
  _FormPageState createState() => _FormPageState();

}
class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  ValueNotifier<String> changetext =  ValueNotifier('');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value){
                  if(value==null || value.isEmpty){
                    return 'Text empty';
                  }
                  return null;
                },
              ),

              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                onChanged: (text) {
                  changetext.value = text;
                 print(text.toString());
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please make inputs';
                  }
                  return null;
                },
              ),

              ValueListenableBuilder(valueListenable: changetext, builder: (context,value, child){
                if(value==''){
                  return SizedBox();
                } else if(int.parse(value.toString())<1000){
                  return Text('change');
                }
                else{
                  return SizedBox();
                }
              }),

              ElevatedButton(onPressed: (){
                if(_formKey.currentState!.validate()){

                }
              }, child: Text('submit'))
            ]
          ),)),
    );
  }
}
