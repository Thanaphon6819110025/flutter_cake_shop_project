// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_cake_shop_project/models/cake_shop.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CakeShopDetialUi extends StatefulWidget {
  // สร้างตัวเเปรมารับข้อมูลร้านที่ส่งมาจากอีกหน้านึง
  CakeShop? cakeShopShow;
  // นำตัวเเปรที่สร้างไว้เพื่อรับข้อมูลมาทำการรับข้อมูล
  CakeShopDetialUi({super.key, this.cakeShopShow});

  @override
  State<CakeShopDetialUi> createState() => _CakeShopDetialUiState();
}

class _CakeShopDetialUiState extends State<CakeShopDetialUi> {
  // เมธอดโทรออกได้
  Future<void> _makePhoneCall(String phoneNumber) async {
    final launchUri = Uri(scheme: 'tel', path: phoneNumber);
    await launchUrl(launchUri);
  }

  //เมธอดเปิดเว็บไซต์ เปิดเเอปภายนอก เช่น เฟสบุ๊ค googlemap
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ส่วนของappbar
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          widget.cakeShopShow!.name!,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),
      // ส่วนของbody
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 65.5,
            bottom: 50.0,
            left: 45.0,
            right: 45.0,
          ),
          child: Center(
            child: Column(
              children: [
                //รูปภาพที่ 1
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(10),
                  child: Image.asset(
                    widget.cakeShopShow!.image1!,
                    width: MediaQuery.of(context).size.width * 0.3,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                //รูปภาพที่ 2 เเละ3
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(10),
                      child: Image.asset(
                        widget.cakeShopShow!.image2!,
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(10),
                      child: Image.asset(
                        widget.cakeShopShow!.image3!,
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                //ชื่อร้าน
                Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text(
                    'ชื่อร้าน 🏪',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * 0.018,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text(
                    widget.cakeShopShow!.name!,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.018,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                // เวลาเปิดปิด
                Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text(
                    'เวลาเปิดปิด 🕒',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * 0.018,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text(
                    widget.cakeShopShow!.openCloseTime!,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.018,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                //รายละเอียดร้าน
                Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text(
                    'รายละเอียดร้าน 📝',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * 0.018,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text(
                    widget.cakeShopShow!.description!,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.018,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                // ที่อยู่ของร้าน
                Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text(
                    'ที่อยู่ของร้าน 📍',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * 0.018,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text(
                    widget.cakeShopShow!.address!,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.018,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                //เบอร์โทรร้าน
                ElevatedButton(
                  onPressed: () {
                    //กดเเล้วให้โทรออกได้
                    _makePhoneCall(
                      widget.cakeShopShow!.phone!,
                    );
                  },
                  child: Text(
                    //widget.cakeShopShow!.phone!,
                    '📞 ${widget.cakeShopShow!.phone!}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.018,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[800],
                    fixedSize: Size(
                      250,
                      55,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                // เว็บร้าน
                ListTile(
                  onTap: () {
                    _launchInBrowser(
                      Uri.parse(widget.cakeShopShow!.website!),
                    );
                  },
                  leading: FaIcon(
                    FontAwesomeIcons.globe,
                    color: Colors.amber,
                  ),
                  trailing: Icon(
                    Icons.link,
                  ),
                  title: Text(
                    widget.cakeShopShow!.website!,
                  ),
                ),
                //เฟสบุ๊ค
                ListTile(
                  onTap: () {
                    _launchInBrowser(
                      Uri.parse(widget.cakeShopShow!.facebook!),
                    );
                  },
                  leading: FaIcon(
                    FontAwesomeIcons.facebook,
                    color: const Color.fromARGB(255, 94, 41, 252),
                  ),
                  trailing: Icon(
                    Icons.link,
                  ),
                  title: Text(
                    widget.cakeShopShow!.facebook!,
                  ),
                ),
                //เเผนที่ร้าน
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: FlutterMap(
                    options: MapOptions(
                      // กำหนดพิกัดเริ่มต้น (ศูนย์กลางแผนที่) และระดับการซูม (Zoom)
                      initialCenter: LatLng(
                        double.parse(widget.cakeShopShow!.latitude!),
                        double.parse(widget.cakeShopShow!.longitude!),
                      ),
                      initialZoom: 13.0,
                    ),
                    children: [
                      // 1. เลเยอร์แสดงภาพแผนที่ (Tile Layer) จาก OpenStreetMap
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.flutter_map_demo',
                      ),
                      // 2. เลเยอร์สำหรับปักหมุดหรือแสดง Marker บนแผนที่
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: LatLng(
                              double.parse(widget.cakeShopShow!.latitude!),
                              double.parse(widget.cakeShopShow!.longitude!),
                            ),
                            width: 80.0,
                            height: 80.0,
                            child: GestureDetector(
                              onTap: (){
                                //เปิด google map
                                _launchInBrowser(
                                  Uri.parse('https://www.google.com/maps/@${widget.cakeShopShow!.latitude!},${widget.cakeShopShow!.longitude!},11.67z'),
                                );
                              },
                              child: Icon(
                                Icons.location_pin,
                                color: Colors.red,
                                size: 40.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
