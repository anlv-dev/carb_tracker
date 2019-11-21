import 'package:flutter/material.dart';
import 'search_food.dart';

class MainTab extends StatelessWidget {
  static String id = 'MainTab';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: BackButtonIcon(),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Trang chủ', icon: Icon(Icons.home)),
                Tab(text: 'Theo dõi', icon: Icon(Icons.add)),
                Tab(text: 'Thông báo', icon: Icon(Icons.notifications)),
              ],
            ),
            title: Text('TRACK YOUR CARBOHYDRATE'),
          ),
          body: TabBarView(
            children: [
              buildCardTest(context),
              myLayoutWidget(),
              buildNotifications(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInforCard(BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'THÔNG TIN CỦA BẠN',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    Text('Chỉ số BMI : 19.8 '),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    Text('Bạn ở ngưỡng bình thường'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    Text('Năng lượng tối thiểu để duy trì sự sống : 1465.7'),
                  ],
                ),
              ),

              //Thong tin tap luyen
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'MỤC TIÊU LUYỆN TẬP',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    Text('Bơi lội 60 Phút <=> 614 Calo'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    Text('Đi bộ 5KM <=> 120 Calo'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    Text('Chạy bộ 5KM <=> 219 Calo'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    Text('Đạp xe 20KM <=> 600 Calo'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    Text('Năng lượng tập luyện : 1553 Calo '),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'CHẾ ĐỘ : TĂNG CÂN',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'TỔNG NHU CẦU NĂNG LƯỢNG ',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '3312 CALO',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCardTest(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'THÔNG TIN CỦA BẠN',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Row(
                    children: <Widget>[
                      Text('Chỉ số BMI : 19.8 <=> Bình thường '),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Row(
                    children: <Widget>[
                      Text('Chế độ : Tăng cân'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                          'Năng lượng tối thiểu để duy trì sự sống : 1465.7 Calo'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'MỤC TIÊU LUYỆN TẬP',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Row(
                    children: <Widget>[
                      Text('Bơi lội 60 Phút <=> 614 Calo'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Row(
                    children: <Widget>[
                      Text('Đi bộ 5KM <=> 120 Calo'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Row(
                    children: <Widget>[
                      Text('Chạy bộ 5KM <=> 219 Calo'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Row(
                    children: <Widget>[
                      Text('Đạp xe 20KM <=> 600 Calo'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Row(
                    children: <Widget>[
                      Text('Năng lượng tập luyện : 1553 Calo '),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'TỔNG NĂNG LƯỢNG CẦN THIẾT',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 1.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '3312 CALO',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCardAddFood(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
                labelText: "Tìm kiếm",
                hintText: "Tìm kiếm",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)))),
          ),
        ),
      ],
    );
  }

  Widget buildNotifications(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(children: <Widget>[
          Expanded(
            child: Text(
              'Lượng carbs nạp vào gần đủ, nên chọn thức ăn ít Carbs nhé. Đề nghị ăn: các loại thịt, cá, rau, trái cây.',
              style: TextStyle(
                fontSize: 20,
                color: Colors.lightBlueAccent,
              ),
            ),
          )
        ]),
      )),
    ));
  }

  Widget myListView(BuildContext context) {
    return Expanded(
      child: Container(
          child: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Row $index'),
            onTap: () {
              //TO DO : something
            },
          );
        },
        itemCount: 3,
      )),
    );
  }

  Widget myFloatButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, SearchPage.id);
          },
        ),
      ),
    );
  }

  Widget myLayoutWidget() {
    // wrap everything in a purple container
    return Container(
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(),
        borderRadius: BorderRadius.all(Radius.circular(3.0)),
      ),

      // column of three rows
      child: Column(
        // this makes the column height hug its content
        mainAxisSize: MainAxisSize.min,
        children: [
          // first row
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.fastfood,
                  color: Colors.yellow,
                ),
              ),
              Text(
                'THEO DÕI LƯỢNG CABORHYDRATE CỦA BẠN',
                style: TextStyle(
                  color: Colors.yellowAccent,
                ),
              ),
            ],
          ),

          // second row (single item)
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 0,
            ),
            child: Text(
              'Vui lòng nhập đầy đủ lượng thực phẩm bạn đưa vào cơ thể để có thể theo dõi chính xác lượng Caborhydrate của bạn.',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),

          // third row
          Row(
            children: [
              Text(
                'EXPLORE BEAMS',
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.yellowAccent,
                ),
              ),
            ],
          ),
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
