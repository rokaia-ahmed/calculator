import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:calculator(),
    );
  }

}
class calculator extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MYCalculator() ;
  }

}

class MYCalculator extends State<calculator> {
  String text ='0';
  double numOne =0;
  double numTwo =0;
  String result ='0';
  String finalResult ='0';
  String opr= '';
  String preOpr= '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:Container(
        padding: EdgeInsets.only(top:20.0,right:15 ,left: 15 ),
        child: Column(
          children:[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                FlatButton(onPressed:(){},
                  child:Text('Calculator',style: TextStyle(fontSize: 15.0,fontStyle:FontStyle.italic),),
                  textColor:Colors.white ,
                ),
                FlatButton(onPressed:(){},
                  child:Text('Exchange Rate',style: TextStyle(fontSize: 15.0,fontStyle:FontStyle.italic),),
                  textColor:Colors.white ,
                ),
                FlatButton(onPressed:(){},
                  child:Text('Unit converter',style: TextStyle(fontSize: 15.0,fontStyle:FontStyle.italic),),
                  textColor:Colors.white ,
                ),
              ],
            ),
            SizedBox(
              height: 70,
            ),
            Row(
              children: [
                Expanded(child: Text(
                  text,
                  style: TextStyle(color: Colors.white,fontSize: 50,),
                  maxLines: 1,
                  textAlign: TextAlign.right,
                ),)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(padding: EdgeInsets.only(left:20 ),
              child:  Row(
                children:[
                  Icon(Icons.access_time,color: Colors.grey,),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(Icons.account_balance_wallet_outlined,color: Colors.grey,),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 430,
              color: Colors.white10,

              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      button('C',Colors.blue),
                      button('%',Colors.blue),
                      Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: FlatButton(
                          onPressed: (){

                          },
                          child: Icon(Icons.backspace,size: 30,color: Colors.blue,),
                          padding: EdgeInsets.all(10),
                        ),
                      ),

                      button('/',Colors.blue),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      button('7',Colors.white),
                      button('8',Colors.white),
                      button('9',Colors.white),
                      button('x',Colors.blue),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      button('4',Colors.white),
                      button('5',Colors.white),
                      button('6',Colors.white),
                      button('-',Colors.blue),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      button('1',Colors.white),
                      button('2',Colors.white),
                      button('3',Colors.white),
                      button('+',Colors.blue),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      button('00',Colors.white),
                      button('0',Colors.white),
                      button('.',Colors.white),
                      button('=',Colors.blue),
                    ],
                  ),

                ],
              ) ,


            ),
          ],

        ),
      ),
    );

  }
  Widget button(String btntxt,Color color){
    return  Container(
      padding: EdgeInsets.only(bottom: 10),
      child: FlatButton(
        onPressed: (){
          calculate(btntxt);
        },
        child: Text(btntxt,style: TextStyle(fontSize: 40,color:color ),
        ),

        padding: EdgeInsets.all(10),
      ),
    );
  }
  void calculate (txtBtn){
    if(txtBtn=='C'){
      text ='0';
      numOne= 0;
      numTwo=0;
      result='';
      finalResult='0';
      opr='';
    } else if (opr =='=' && txtBtn =='='){
      switch(preOpr){
        case '+':
          finalResult = add();
          break ;
        case '-':
          finalResult = sub();
          break ;
        case 'x':
          finalResult = mul();
          break ;
        case '/':
          finalResult = div();
          break ;
      }

    }
    else if (txtBtn=='+'|| txtBtn =='-'||txtBtn =='x'||txtBtn =='/'|| txtBtn == '='){
      if (numOne==0){
        numOne = double.parse(result);
      }else{
        numTwo =double.parse(result);
      }
      switch(opr){
        case '+':
          finalResult = add();
          break;
        case '-':
          finalResult = sub();
          break;
        case 'x':
          finalResult = mul();
          break;
        case '/':
          finalResult = div();
          break;

      }
      preOpr = opr;
      opr = txtBtn;
      result ='';
    }
    else{
      result = result +txtBtn;
      finalResult = result;
    }
    setState(() {
      text = finalResult;
    });
  }
  String add(){
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return result;
  }
  String sub(){
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return result;
  }
  String mul(){
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return result;
  }
  String div(){
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return result;
  }
}
