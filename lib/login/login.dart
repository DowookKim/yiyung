
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/login/randomcode.dart';
import 'dart:math';
import 'package:login/login/login.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({super.key});

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  final _authentication = FirebaseAuth.instance;
  bool isSignupScreen = true;
  final _formKey = GlobalKey<FormState>();
  String userName = '';
  String userEmail = '';
  String userPassword = '';

  void _tryValidation(){
    final isValid=_formKey.currentState!.validate();

    if(isValid){ //onSaved랑 세트
      _formKey.currentState!.save();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:Color(0xffFFFCF6),
      body:  GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
          //MediaQuery.of(context).size.height-180;
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          
            Container(
              
              height: 720,
              width: 600,
              child: Stack(
                children: [
                  
                 AnimatedPositioned(
              
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                    top:100,
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                      padding:EdgeInsets.all(20.0),
                      height: isSignupScreen ? 280.0 : 250.0,
                      width: MediaQuery.of(context).size.width-40,
                      margin:EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                        color: Color(0xffBFA883),
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 15,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child:SingleChildScrollView(
                        
                        padding: EdgeInsets.only(bottom:20,),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment:MainAxisAlignment.spaceAround,
                              children:
                            [
                              GestureDetector(
                                onTap:(){
                                  setState(() {
                                    isSignupScreen = false;
                                  });
                                } ,
                                child: Column(
                                  children: [
                                    Text(
                                      'LOGIN',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color:!isSignupScreen ?  Colors.white :Colors.black,
                                
                                      ),
                                      ),
                        
                                      if(!isSignupScreen)
                                      Container(
                                        margin:EdgeInsets.only(top:3) ,
                                        height:2,
                                        width: 55,
                                        color:Colors.orange,
                                      ),
                           
                                  ],),
                              ),
                        
                               GestureDetector(
                                onTap:(){
                                  setState(() {
                                    isSignupScreen = true;
                                  });
                                } ,
                                 child: Column(
                                  children: [
                                    Text(
                                      'SIGNUP',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color:!isSignupScreen ?  Colors.black :Colors.white,
                                 
                                      ),
                                      ),
                        
                                      if(isSignupScreen)
                                      Container(
                                        margin:EdgeInsets.only(top:3),
                                        height:2,
                                        width: 55,
                                        color:Colors.orange,
                                      ),

              
                                  
                                  ],),
                               )
                            ],),
                            if(isSignupScreen)
                            Container(
                              margin:EdgeInsets.only(top:20),
                              child: Form(
                                key: _formKey,
                                child:Column(
                                  children: [
                                    TextFormField(
                                      
                                      key:ValueKey(1),
                                      validator: (value){
                                        if(value!.isEmpty || value.length <4){
                                          return 'Please enter at least 4 characters.';
                                        }
                                        return null;
                                      },
                                      onSaved: (value){
                                        userName = value!;
                                      },
              
                                      onChanged:(value){
                                        userName = value ;
                                      } ,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.account_circle,
                                        color: Colors.white,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:  BorderSide(
                                            color: Colors.white,
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                        ),
                                        focusedBorder:OutlineInputBorder(
                                          borderSide:  BorderSide(
                                            color: Colors.white,
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                        ),
                        
                                        hintText: 'User name',
                                        hintStyle: TextStyle(
                                          fontSize: 14,
                                          color:  Colors.white,
                                        ),
                                        contentPadding: EdgeInsets.all(10),                       ),
                                    ),
                        
                                    SizedBox(
                                      height: 8
                                    ),
                        
                                    TextFormField(
                                      keyboardType:TextInputType.emailAddress ,
                                      key:ValueKey(2),
                                      validator: (value) {
                                        if(value!.isEmpty || !value.contains('@')){
                                          return 'Please enter a valid email address';
                                        }
                                        return null;
                                      },
                                      onSaved: (value){
                                        userEmail = value!;
                                      },
              
                                      onChanged:(value){
                                        userEmail = value ;
                                      } ,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.account_circle,
                                        color: Colors.white,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:  BorderSide(
                                            color:Colors.white,
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                        ),
                                        focusedBorder:OutlineInputBorder(
                                          borderSide:  BorderSide(
                                            color:Colors.white,
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                        ),
                        
                                        hintText: 'User name',
                                        hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                        contentPadding: EdgeInsets.all(10),                       ),
                                    ),
                        
                                    SizedBox(
                                      height: 8
                                    ),
                        
                                    TextFormField(
                                      obscureText: true,
                                      key:ValueKey(3),
                                      validator: (value) {
                                        if(value!.isEmpty || value.length <6){
                                          return 'Password must be at least 7 characters long.';
                                        }
                                        return null;
                                      },
                                      onSaved: (value){
                                        userPassword = value!;
                                      },
              
                                      onChanged:(value){
                                        userPassword = value ;
                                      } ,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.account_circle,
                                        color:Colors.white,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:  BorderSide(
                                            color:Colors.white,
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                        ),
                                        focusedBorder:OutlineInputBorder(
                                          borderSide:  BorderSide(
                                            color:Colors.white,
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                        ),
                        
                                        hintText: 'User name',
                                        hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                        contentPadding: EdgeInsets.all(10),                       ),
                                    ),
                               
                        
                                  ],
                                  ),
                              )
                            ),
                            if(!isSignupScreen)
                            Container(
                              margin:EdgeInsets.only(top:20),
                              child:Form(
                                key: _formKey,
                                child:Column(
                                  children: [
                                    TextFormField(
                                      
                                      key:ValueKey(4),
                                      validator: (value){
                                        if(value!.isEmpty || value.length <4){
                                          return 'Please enter at least 4 characters.';
                                        }
                                        return null;
                                      },
                                      onSaved: (value){
                                        userEmail = value!;
                                      },
              
                                      onChanged: (value){
                                        userEmail=value;
                                      },
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.account_circle,
                                        color: Colors.white,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:  BorderSide(
                                            color:Colors.white,
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                        ),
                                        focusedBorder:OutlineInputBorder(
                                          borderSide:  BorderSide(
                                            color:Colors.white,
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                        ),
                        
                                        hintText: 'User name',
                                        hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                        contentPadding: EdgeInsets.all(10),                       ),
                                    ),
                                    SizedBox(
                                      height: 8.0
                                    ),
                                    TextFormField(
                                      key:ValueKey(5),//State를 엉키게 하는 것을 막아줌
                                       validator: (value){
                                        if(value!.isEmpty || value.length <4){
                                          return 'Please enter at least 4 characters.';
                                        }
                                        return null;
                                      },
                                      onSaved: (value){
                                        userPassword = value!;
                                      },
              
                                       onChanged: (value){
                                        userPassword=value;
                                      },
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.account_circle,
                                        color: Colors.white,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:  BorderSide(
                                            color:Colors.white,
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                        ),
                                        focusedBorder:OutlineInputBorder(
                                          borderSide:  BorderSide(
                                            color:Colors.white,
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                        ),
                        
                                        hintText: 'User name',
                                        hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                        contentPadding: EdgeInsets.all(10),                       ),
                                    ),
                                  ],
                                )
                              )
                            ),
                          ],
                        ),
                      )
                    ),
                  ),
                //텍스트 폼 빌드
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 500),
                    curve:Curves.easeIn,
                    top: isSignupScreen ? 350 : 320,
                    right: 0,
                    left: 0,
                    child: Center(
                      child: Container(
                        padding:EdgeInsets.all(10),
                        height:70,
                        width:90,
                        decoration: BoxDecoration(
                          color:Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: GestureDetector(
                          onTap: ()async{
                            if(isSignupScreen){
                              _tryValidation();
              
                              try{
                                final newUser = await _authentication.createUserWithEmailAndPassword(
                                email: userEmail, 
                                password: userPassword
                                );
              
                                if (newUser.user != null) {
                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => RandomRoomScreen(userEmail: userEmail)),
                                  );
                                }
                              }catch(e){
                                print(e);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:Text('Please check your email and password'),
                                    backgroundColor: Colors.blue,
                                    ),
                                );
                              }
                    
                              
                            }
              
                             if(!isSignupScreen){
                                _tryValidation();
              
                                try{
              
                                final newUser = await _authentication.signInWithEmailAndPassword(
                                  email: userEmail,
                                  password: userPassword,
                                  );
                                if (newUser.user != null) {
                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => RandomRoomScreen(userEmail: userEmail)),
                                  );
                                }
                                }catch(e){
                                  print(e);
                                }
                              }
                            
              
                           
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors:[
                                  Colors.orange,
                                  Colors.brown,
                                
                                ],
                                begin: Alignment.topLeft,
                                end:Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color:Colors.black.withOpacity(0.3),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(0, 1),
                                ),
                              ]
                            ),
                            child: Icon(Icons.arrow_forward,
                            color: Colors.white),
                          ),
                        )
                      ),
                    )
                  ),
                //전송버튼
                  
                //구글 로그인 버튼
                ],
              ),
            ),
           
             Container(
              padding:EdgeInsets.only(bottom:100),
               child: Text(
                           'ㅇ',
                           style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                         ),
             ), 
          ],
          
        ),
      ),
    );

 
  }
}




//-------------------------------------------------------------------------------------//


