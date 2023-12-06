import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'main.dart';
import 'objects_child.dart';

class AddChildForm extends StatefulWidget {
  const AddChildForm({super.key});

  @override
  State<AddChildForm> createState() => _AddChildFormState();
}

class _AddChildFormState extends State<AddChildForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _countryController = TextEditingController();

  bool childisNice = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Add a child to the list",style: TextStyle(color: Colors.black, fontFamily: "Lato", fontWeight: FontWeight.w700, fontSize: 18, height: 0)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(child: const Icon(Icons.arrow_back_ios_new_rounded,color: Colors.black,),onTap: (){
          Navigator.of(context).pop();
        },),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 35,right: 35,top: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                    labelText: 'Name of child',
                    hintText: 'Alex...',
                    hintStyle: TextStyle(color: Colors.grey[600],fontFamily: "Lato",fontWeight: FontWeight.w700,fontSize: 14),
                    floatingLabelStyle: TextStyle(color: Colors.grey[600],fontFamily: "Lato",fontWeight: FontWeight.w700,fontSize: 14),
                    labelStyle: TextStyle(color: Colors.grey[600],fontFamily: "Lato",fontWeight: FontWeight.w700,fontSize: 14),
                    prefixIcon: Icon(Icons.person,color: Colors.black,),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 2.5,style: BorderStyle.solid,),borderRadius: BorderRadius.circular(12)),
                    errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red.shade700,width: 2.5,style: BorderStyle.solid,),borderRadius: BorderRadius.circular(12)),
                    errorStyle: TextStyle(color: Colors.red.shade700,fontFamily: "Lato",fontWeight: FontWeight.w700,fontSize: 12),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey,width: 2.5,style: BorderStyle.solid,),borderRadius: BorderRadius.circular(12)),
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 2.5,style: BorderStyle.solid,),borderRadius: BorderRadius.circular(12))
                ),
                validator: (value)
                {
                  if (value!.isEmpty)
                  {
                    return 'Name is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: _countryController,
                decoration: InputDecoration(
                    labelText: 'Country of child',
                    hintText: 'Germany...',
                    hintStyle: TextStyle(color: Colors.grey[600],fontFamily: "Lato",fontWeight: FontWeight.w700,fontSize: 14),
                    floatingLabelStyle: TextStyle(color: Colors.grey[600],fontFamily: "Lato",fontWeight: FontWeight.w700,fontSize: 14),
                    labelStyle: TextStyle(color: Colors.grey[600],fontFamily: "Lato",fontWeight: FontWeight.w700,fontSize: 14),
                    prefixIcon: Icon(Icons.public,color: Colors.black,),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 2.5,style: BorderStyle.solid,),borderRadius: BorderRadius.circular(12)),
                    errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red.shade700,width: 2.5,style: BorderStyle.solid,),borderRadius: BorderRadius.circular(12)),
                    errorStyle: TextStyle(color: Colors.red.shade700,fontFamily: "Lato",fontWeight: FontWeight.w700,fontSize: 12),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey,width: 2.5,style: BorderStyle.solid,),borderRadius: BorderRadius.circular(12)),
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 2.5,style: BorderStyle.solid,),borderRadius: BorderRadius.circular(12))
                ),
                validator: (value)
                {
                  if (value!.isEmpty)
                  {
                    return 'Country is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20,),
              ToggleSwitch(
                initialLabelIndex: 0,
                labels: ['Nice','Naughty'],
                totalSwitches: 2,
                minHeight: 50,
                minWidth: MediaQuery.of(context).size.width/2.5,
                cornerRadius: 12,
                activeBgColor: [Colors.blue],
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.grey[700],
                inactiveFgColor: Colors.white60,
                icons: const [Icons.check,Icons.warning_amber_rounded],
                iconSize: 20,
                onToggle: (index)
                {
                  childisNice = !childisNice;
                  print(childisNice);
                },

              ),
              SizedBox(height: 20,),
              SizedBox(
                height: MediaQuery.of(context).size.height/14.60,
                width: MediaQuery.of(context).size.width/1.205,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.add,color: Colors.white,),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey[900]), elevation: MaterialStateProperty.all(0), shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))))),
                  label: Text("Add child", style: TextStyle(color: Colors.white,fontSize:16, fontFamily: "Lato", fontWeight: FontWeight.w600)),
                  onPressed: () async
                  {
                    if (_formKey.currentState!.validate())
                    {

                      print('Name: ${_nameController.text}');
                      print('Con: ${_countryController.text}');
                      Child newChild = Child(_nameController.text, _countryController.text, childisNice);
                      context.read<ChildListBloc>().addChild(newChild);
                      Navigator.of(context).pop();
                    }

                  },
                ),
              ),

            ],
          ),
        ),
      ),


    );
  }
}
