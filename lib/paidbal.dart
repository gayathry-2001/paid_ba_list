import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/api2.dart';
// import 'package:meatshopproj/api2.dart';
// import 'package:meatshopproj/modals/modal2.dart';

// import 'api.dart';

class Paidbal extends StatefulWidget {
  const Paidbal({super.key});

  @override
  State<Paidbal> createState() => _PaidbalState();
}

class _PaidbalState extends State<Paidbal>{
  final TextEditingController codeControl = TextEditingController();

  var jsonList = [];
  List <String> jList =[];

  // void initState(){
  //   super.initState();
  //   // saveval();
  //   paidbalApii2();
  // }


  void paidbalApii2 () async{
    try{
      Response result = await Dio().get('https://uatonpay.manappuram.com/paidbapublicapi/api/PaidBAList/GetPaidBAList?BranchId=3038');
      if(result.statusCode==200) {
        setState(() {
          jsonList = List<String>.from(result.data.toString() as Iterable);
          // result.data['paidBAList'] as List;
        });
        print(result);
      }
      else{
        print(result.statusCode);
      }
    }
    on DioException catch(e){
      print(e);
      print("%%%%%%%%%%%%%%%%%");
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Paidbal List"),),
      body: SafeArea(
        child:Column(

          mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children:[


          Padding(
            padding: const EdgeInsets.all(50.0),
            child: TextField(
              controller: codeControl,
              decoration: InputDecoration(hintText: "Enter branch code",border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),borderSide: BorderSide(color: Colors.lightBlue)
              )),
            ),
          ),

              ElevatedButton(
                onPressed: ()
                  => paidBalFun(),

                // =>   paidbalApii2(),

                child: Text("Submit"),

              ),
          SizedBox(height: 20,),
          Expanded(
            child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Color.fromRGBO(180, 197, 234, 1.0),

              elevation: 6,
              child:
              ListTile(
                title: Text(jsonList[index]['paidBACode']),

              ),

            );

                    },
                    itemCount: jsonList.length,
              // itemCount: 10,
                    ),
          ),
            ])
      )


    );
  }


  void paidBalFun() async{
    final codee = codeControl.text;
    // final FormData formData = FormData({});
    final String formData = codee.toString();

    final result = await Api2().paidbalApi(formData);
    if(result?.code == 200){
      setState(() {
         jsonList = result!.paidBaList!;
      });
      print("#######$jsonList");

    }
    }

  // void paidBalFun() async{
  //   final codee = codeControl.text;
  //   final FormData formData = FormData.fromMap({'paidBACode':codee});
  //
  //   final result = await Api2().paidbalApi(codee);
  //   if(result?.code == 200){
  //     setState(() {
  //       jsonList = result!.paidBaList!;
  //     });
  //   }
  // }



  // void paidBalFun() async{
  //   final formData =
  //   FormData.fromMap({'code':});
  //
  //   final result = await Api2().paidbalApi(formData);
  //   if(result?.code ==200){
  //     setState(() {
  //       jsonList = result.paidBaList.toString();
  //     });
  //   }
  //
  // }







}

