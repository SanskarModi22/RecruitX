import 'package:flutter/material.dart';
class applicants_info{
  String name;
  num number;
  String displayimage;
  applicants_info(this.name,this.number,this.displayimage);
}



class applicants_Info extends StatefulWidget {
 // const applicants_Info({Key? key}) : super(key: key);

  @override
  _applicants_InfoState createState() => _applicants_InfoState();
}

class _applicants_InfoState extends State<applicants_Info> {
  List<applicants_info> applicantsInfo=[
    applicants_info ('pranay',988888888,'avatar.png'),
    applicants_info ('kartik',988888888,'avatar.png'),
    applicants_info ('sanskar',988888888,'avatar.png'),
    applicants_info ('gunjan',988888888,'avatar.png'),
    applicants_info ('surya',988888888,'avatar.png'),
    applicants_info ('modi bhai',988888888,'avatar.png'),


  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text('Applicants'),),
          body:ListView.builder(
            itemCount: applicantsInfo.length,
            itemBuilder: (context,index){
              return Card(
                child:ListTile(
                  onTap: (){},
                  title: Text(applicantsInfo[index].name),
                  subtitle: Text(applicantsInfo[index].number.toString()),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/${applicantsInfo[index].displayimage}'),
                  ),
                ) ,
              );
            },
          )
      ),
    );
  }
}
