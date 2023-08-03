import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:toonflix/screen/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // route는 DetailScreen 같은 Widget을 애니메이션 효과로 감싸서 스크린처럼 보이게 함
        // builder는 route를 만들어줌
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DetailScreen(title: title, thumb: thumb, id: id),
            fullscreenDialog:
                true, // < 대신 X로 아이콘이 바뀜 (Card가 아니라 Screen처럼 보이게 하는 속성)
            // iOS는 화면이 밑에서부터 올라오게 함
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            // 애니메이션을 위한 위젯
            // tag 값으로 동일한 이미지를 연결시켜주면 화면을 전환할 때 이미지가 새로 만들어지는게 아니라 떠다니는 것처럼 보임
            tag: id,
            child: Container(
              width: 250,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 13,
                      offset: Offset(10, 10),
                      color: Colors.black.withOpacity(0.5),
                    )
                  ]),
              child: Image.network(thumb),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
