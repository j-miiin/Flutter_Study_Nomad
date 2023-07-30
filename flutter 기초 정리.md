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

  </br>

## BuildContext
- __context__ : 이전에 있는 모든 상위 요소들에 대한 정보
  - context에는 위젯 트리에 대한 정보가 담겨있고, 먼 요소의 데이터를 가져올 수 있어 유용
  ```dart
  ...
  
  class _AppState extends State<App> {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        theme: ThemeData(
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
        home: Scaffold(
          backgroundColor: const Color(0xFFF4EDDB),
          body: Center(
            MyLargeTitle(),
          )
        ),
      );
    }
  }
   
  class MyLargeTitle extends StatelessWidget {
    const MyLargeTitle({
      Key? key,
    })  : super(key: key);
      
    @override
    Widget build(BuildContext context) {
      return Text(
        'My Large Title',
        style: TextStyle(
          fontsize: 30,
          color: Theme.of(context).textTheme.titleLarge?.color,
        ),
      );
    }
  }
  ```
- BuildContext는 위젯 트리에서 위젯의 위치를 제공하고, 상위 요소 데이터에 접근할 수 있게 함

</br>

## Widget Lifecycle
- __initState__ : 상태를 초기화하기 위한 메소드
  - 부모 요소에 의존하는 데이터를 초기화 할 때 사용
  - 항상 build 메소드보다 먼저 호출되어야 하며, 단 한 번만 호출됨
- __dispose__ : 위젯이 스크린에서 제거될 때 호출되는 메소드
  - API 업데이트나 이벤트 리스너로부터 구독을 취소하거나, form의 리스너로부터 벗어나고 싶을 때 사용 
  ```dart
  class MyLargeTitle extends StatefulWidget {
    const MyLargeTitle({
      Key? key,
    })  : super(key: key);
      
    @override
    State<MyLargeTitle> createState() => _MyLargeTitleState();
  }
   
  class _MyLargeTitle extends State<MyLargeTitle> {   
    @override
    void initState() {
      super.initState();
    }
      
    @override
    void dispose() {
      super.dispose();
    }
   
    @override
    Widget build(BuildContext context) {
      return Text(
        'My Large Title',
        style: TextStyle(
          fontsize: 30,
          color: Theme.of(context).textTheme.titleLarge?.color,
        ),
      );
    }
  }
  ```
  