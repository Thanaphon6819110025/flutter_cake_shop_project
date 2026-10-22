import 'package:flutter/material.dart';
import 'package:flutter_cake_shop_project/views/cake_shop_list_ui.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {

  @override
  void initState() {
    // หน่วงเวลาหน้าจอ3วิเเล้วเปิดไปหน้าจอCakeshoplistย้อนกลับไม่ได้
    Future.delayed(
      // ระยะเวลาหน่วง
      Duration(
        seconds: 3,
      ),
      //คำสั่งเมื่อครบเวลาหน่วงเปิดไปหน้าจอกำหนด
      (){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => CakeShopListUi(),
          ),
        );
      }
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // ชั้นที่1เเสดงรูปพื้นหลัง
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/bg_welcome.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // ชั้นที่2 เเสดงชื่อเเอป เเสดง ProgressIndicator
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                Text(
                  'สายด่วนกินเค้ก',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: MediaQuery.of(context).size.height * 0.048,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'CAKE CALL FAST',
                  style: TextStyle(
                    color: const Color.fromARGB(174, 244, 67, 54),
                    fontSize: MediaQuery.of(context).size.height * 0.023,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                CircularProgressIndicator(
                  color: Colors.grey[700],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}