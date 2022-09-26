import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _passwordController = TextEditingController();
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {

    final Shader linearGradient = const LinearGradient(
      colors: <Color>[
        Color.fromRGBO(195, 90, 226, 1),
        Color.fromRGBO(7, 180, 149, 1)
      ],
    ).createShader(const Rect.fromLTWH(100.0, 50.0, 200.0, 100.0));
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final Gradient button = LinearGradient(colors: [Color.fromRGBO(195, 90, 226, 1),
        Color.fromRGBO(7, 180, 149, 1)]);

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Stack(children: [
        //GDSC Logo
        Container(
          width: double.infinity,
          height: height * 0.5,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              image: DecorationImage(
                  image: AssetImage(
                    "Assets/bg.jpg",
                  ),
                  fit: BoxFit.cover)),
          // child:
        ),

        //GDSC Banner
        SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: height,
                minWidth: width,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              Center(
               child: CircleAvatar(backgroundImage: AssetImage("Assets/logo.jpg"),radius: 60,),
              ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child:
                          Image.asset("Assets/gdsc_djsce.jpg", width: width * 0.8)),
                  Container(
                    width: width * 0.8,
                    alignment: AlignmentDirectional.bottomCenter,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Login Now!",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              foreground: Paint()..shader = linearGradient,
                              letterSpacing: 1.5,
                              wordSpacing: 3),
                        ),
                        SizedBox(height: 30,),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _emailController,
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Email cannot be empty';
                                  }
                                  if(text.contains("@")){
                                    return null;
                                  }
                                  else{
                                    return "Email should contain @";
                                  }
                                },
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(color: Colors.purple)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(color: Colors.purple)
                                  ),
                                  labelText: 'Email',
                                  labelStyle: TextStyle(color: Colors.deepPurple)
                                ),
                              ),
                              SizedBox(height: 20,),
                              TextFormField(
                                obscureText: isVisible,
                                controller: _passwordController,
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Password cannot be empty';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  suffixIcon: InkWell(
                                    onTap: (){
                                      setState(() {
                                        print("Function Called");
                                        isVisible = !isVisible;
                                      });
                                    },
                                    child: isVisible ? Icon(Icons.visibility, color: Colors.black,) : Icon(Icons.visibility_off, color: Colors.black,),
                                  ),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(color: Colors.purple)
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(color: Colors.purple)
                                    ),
                                    labelText: 'Password',
                                    labelStyle: TextStyle(color: Colors.deepPurple)
                                ),
                              ),
                              SizedBox(height: 20,),
                              InkWell(
                                onTap: (){
                                  _formKey.currentState?.validate();
                                },
                                child: Container(
                                  padding: EdgeInsets.all(15),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    gradient: button,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text("Submit  ", style: TextStyle(color: Colors.white, fontSize: 20),),
                                      Icon(Icons.chevron_right, color: Colors.white,),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
