import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons, // FutureBuilder를 통해 webtoons를 기다려줄 수 있음
        builder: (context, snapshot) {
          // snapshot으로 Future의 상태를 알 수 있음 (데이터를 받았는지, 오류가 났는지)
          if (snapshot.hasData) {
            return Text("There is Data");
          }
          return Text("Loading...");
        },
      ),
    );
  }
}

  // Stateful Widget일 때의 방법 -> 이렇게 할 필요가 없다!
  // List<WebtoonModel> webtoons = [];
  // bool isLoading = true;

  // void waitForWebToons() async {
  //   webtoons = await ApiService.getTodaysToons();
  //   isLoading = false;
  //   setState(() {});
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   waitForWebToons();
  // }