## State
- __Stateless Widget__ : build 메소드를 통해 UI를 출력함 -> 변경되지 않을 데이터만을 보여줌
- __Stateful Widget__ : 위젯에 데이터를 저장하고, 실시간으로 데이터의 변화를 보고 싶을 때 사용
  - 위젯의 state는 위젯에 들어갈 데이터와 UI를 넣는 곳
  - 데이터는 클래스 프로퍼티
  ```dart
  class App extends StatefulWidget {
    @override
    State<App> createState() => _AppState();
  }
  
  class _AppState extends State<App> {
    int counter = 0;
    
    void onClicked() {
      counter = counter + 1;
      }
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Click Count',
                style: TextStyle(fontsize: 30)
              ),
              Text('$counter',
                style: TextStyle(fontsize:30),
              ),
              IconButton(
                iconSize: 40,
                // 버튼을 누를 때마다 실행할 함수 전달
                onPressed: onClicked, 
                icon: const Icon(
                  Icons.add_box_rounded,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  ```
- 위와 같이 작성하면 UI는 아무런 변화도 일어나지 않을 것임

</br>

## setState
- State 클래스에게 데이터가 변경되었다고 알리는 함수
  - 위의 onClicked 함수를 다음과 같이 수정
  ```dart
  void onCLicked() {
    setState(() {
      counter = counter + 1;
    });
  }
  ```
- setState를 호출하지 않으면 build 메소드는 다시 실행되지 않음
- 데이터를 변경한 뒤 setState를 호출해도 같은 결과가 나옴
  - 권장되는 것은 setState 안에 데이터 변경 코드를 넣는 방법
  ```dart
  void onCLicked() {
    counter = counter + 1;
    setState(() {});
  }
  ```
  