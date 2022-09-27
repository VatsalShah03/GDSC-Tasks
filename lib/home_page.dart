import 'package:flutter/material.dart';
import 'package:gdsc_tasks/signin_page.dart';

class IntroScreen extends StatelessWidget {
  final String email;
  const IntroScreen({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("Assets/bg-1.jpg"), fit: BoxFit.fill)),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(width: 20,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const SignInPage()));
                  },
                  child: const Text("Sign Out", style: TextStyle(color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold),),
                )
              ],
            ),
            Expanded(child: Center(
              child: Container(
                padding: const EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Welcome!", style: TextStyle(color: Colors.white, fontSize: 60, fontWeight: FontWeight.w900),),
                    Text(email, style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.w500),),

                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    ));
  }
}
