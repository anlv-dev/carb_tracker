import 'package:flutter/material.dart';

class HumanInfor extends StatefulWidget {
  static String id = 'HumanInfor';

  @override
  _HumanInforState createState() => _HumanInforState();
}

class _HumanInforState extends State<HumanInfor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          children: <Widget>[
            Text(
              'Chào mừng bạn đến với ứng dụng theo dõi sức khỏe. Vui lòng nhập thông tin của bạn bên dưới',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.teal,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              height: 10.0,
              width: 150.0,
              child: Divider(
                color: Colors.teal.shade500,
              ),
            ),
            new TextFormField(
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  icon: const Icon(
                    Icons.person,
                    color: Colors.lightBlueAccent,
                  ),
                  hintText: 'Năm sinh',
                  labelText: 'Năm sinh',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: Colors.teal,
                  )),
            ),
            SizedBox(
              height: 5.0,
            ),
            new TextFormField(
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  icon: const Icon(
                    Icons.accessibility,
                    color: Colors.lightBlueAccent,
                  ),
                  hintText: 'Chiều cao',
                  labelText: 'Chiều cao',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: Colors.teal,
                  )),
            ),
            SizedBox(
              height: 5.0,
            ),
            new TextFormField(
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  icon: const Icon(
                    Icons.launch,
                    color: Colors.lightBlueAccent,
                  ),
                  hintText: 'Cân nặng',
                  labelText: 'Cân nặng',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: Colors.teal,
                  )),
            ),
            SizedBox(
              height: 5.0,
            ),
            new TextFormField(
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  icon: const Icon(
                    Icons.assignment_ind,
                    color: Colors.lightBlueAccent,
                  ),
                  hintText: 'Giới tính',
                  labelText: 'Giới tính',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: Colors.teal,
                  )),
            ),
            Text(
              'Mục tiêu vận động của bạn',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.teal,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              height: 10.0,
              width: 150.0,
              child: Divider(
                color: Colors.teal.shade500,
              ),
            ),
            new TextFormField(
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  icon: const Icon(
                    Icons.directions_walk,
                    color: Colors.lightBlueAccent,
                  ),
                  hintText: 'Đi bộ (Km)',
                  labelText: 'Đi bộ (Km) ',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: Colors.teal,
                  )),
            ),
            SizedBox(
              height: 5.0,
            ),
            new TextFormField(
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  icon: const Icon(
                    Icons.directions_run,
                    color: Colors.lightBlueAccent,
                  ),
                  hintText: 'Chạy bộ (Km)',
                  labelText: 'Chạy bộ (Km)',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: Colors.teal,
                  )),
            ),
            SizedBox(
              height: 5.0,
            ),
            new TextFormField(
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  icon: const Icon(
                    Icons.directions_bike,
                    color: Colors.lightBlueAccent,
                  ),
                  hintText: 'Xe đạp (Km)',
                  labelText: 'Xe đạp (Km)',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: Colors.teal,
                  )),
            ),
            SizedBox(
              height: 5.0,
            ),
            new TextFormField(
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  icon: const Icon(
                    Icons.pool,
                    color: Colors.lightBlueAccent,
                  ),
                  hintText: 'Bơi lội (Phút)',
                  labelText: 'Bơi lội (Phút)',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: Colors.teal,
                  )),
            ),
            SizedBox(
              height: 5.0,
            ),
            MaterialButton(
              onPressed: () {
                //Implement login functionality.
              },
              minWidth: 200.0,
              height: 20.0,
              child: Text(
                'LƯU',
                style: TextStyle(
                  color: Colors.teal.shade500,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
