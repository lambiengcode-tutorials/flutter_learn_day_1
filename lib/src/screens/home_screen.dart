import 'package:bai_1/src/controllers/home_controller.dart';
import 'package:bai_1/src/models/button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Button? _currentButton;
  HomeController homeController = HomeController();

  @override
  void initState() {
    super.initState();
    homeController.addData();
    _currentButton = Button(title: 'Flutter');
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: _currentButton!.color,
        leading: IconButton(
          onPressed: () => print('back'),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          _currentButton!.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => print('back'),
            icon: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        height: size.height,
        width: size.width,
        alignment: Alignment.center,
        child: StreamBuilder(
          stream: homeController.getButtons,
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Container();
            }

            var data = snapshot.data as List<Button>;

            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return _buildButton(
                  context,
                  data[index].title,
                  data[index].color,
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildButton(context, title, color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentButton = Button(title: title, color: color);
        });
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 4.0),
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: color,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
