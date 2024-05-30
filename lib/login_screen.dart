import 'package:flutter/material.dart';
// import 'package:projek_akhir/pages/colors.dart';
import 'package:projek_akhir/pages/main_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController alamatemail =
      TextEditingController(text: "fitrianiitsme203@gmail.com");
  TextEditingController _password = TextEditingController(text: "123456");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 206, 206), //primary,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("images/profile.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Form email
            SizedBox(height: 50),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.03),
                    spreadRadius: 10,
                    blurRadius: 3,
                  ),
                ],
              ),
              child: Padding(
                padding:
                    EdgeInsets.only(left: 20, top: 15, bottom: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Alamat Email",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Color(0xff67727d),
                      ),
                    ),
                    TextField(
                      controller: alamatemail,
                      cursorColor: Colors.black,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.email_outlined),
                        prefixIconColor: Colors.black,
                        hintText: "Email", // teks ketika form kosong
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Form password
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.03),
                    spreadRadius: 10,
                    blurRadius: 3,
                  ),
                ],
              ),
              child: Padding(
                padding:
                    EdgeInsets.only(left: 20, top: 15, bottom: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Password",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Color(0xff67727d),
                      ),
                    ),
                    TextField(
                      obscureText: true,
                      controller: _password, // Menggunakan controller _password
                      cursorColor: Colors.black,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.lock_outline),
                        prefixIconColor: Colors.black,
                        hintText: "Password", // teks ketika form kosong
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 60), //jarak antara password &login

            GestureDetector(
              onTap:(){
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context)=> HalamanMain(),
                  ));
              } ,

              //button login
              child: Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 241, 155, 210),
                  borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                        ),
                        ),
                        ),
                  ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Daftar",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        ),
                    ),
                    Text(
                      "Lupa Password?",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        ),
                    ),
                    ],
                    ),
              )
          ],
        ),
      ),
    );
  }
}
