import 'package:flutter/material.dart';
import 'package:flutter_theming/theme/theme_constants.dart';
import 'package:flutter_theming/theme/theme_manager.dart';
import 'package:flutter_theming/utils/helper_widgets.dart';

/*
So boys, let’s get serious, dart has something called NotifyListeners,
this Voodoo stuff will register listeners on objects and
will notify everyone whenever the object changes and
that’s actually interesting stuff… We gotta make some use of it in our situation.
 */


/*
1. 원하는 클래스의 다중 상속을 한다. ( with ChangeNotifier )
2. 변경하고자 하는 메서드에서 상속받은 notifyChange() 를 넣어준다.
3. 1번의 클래스의 인스턴스를 만들고 사용준비를 한후 initState()와 dispose() 함수를 통해서 1번클래스 다중부모에게서 상속받은 클래스의 메서드인 removeListener 과 addListener 을 통해 리스너를 등록한다.
4. 리스너 함수에서는 마운트 (mounted) 확인한후 setState() 를 실행한다.
5. 이제 마지막으로 스위치에서 1번 클래스의 멤버 함수를 토글한다. 그러면 2번의 notifyChange() 가 실행된다.
 */
void main() {
  runApp(MyApp());
}

ThemeManager _themeManager = ThemeManager(); // ThemeManager() 사용하기 위한 인스턴스 생성

class MyApp extends StatefulWidget { // 역시 예상대로 StateFulWidget 을 사용
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void dispose() { // tree 에서 완전히 없어질 때 불려진다.
    _themeManager.removeListener(themeListener); // 리스너 해제
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener); // 리스너 등록
    super.initState();
  }

  themeListener(){
    if(mounted){ // tree 에 있으면
      setState(() { // 두개의 StatefulWidget 인데 부모꺼를 어떻게 실행시키는지 보자

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme, // 각각 라이트띰
      darkTheme: darkTheme, // 다크띰을 적용
      themeMode: _themeManager.themeMode, // 초기 Theme mode 적용
      home: MyHomeScreen(),
    );
  }
}

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    bool isDark = Theme.of(context).brightness == Brightness.dark; // 초기에 다크값인지 확인하는 멤버변수 설정하고
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme App"),
        actions: [Switch(value: _themeManager.themeMode == ThemeMode.dark, onChanged: (newValue) {
          _themeManager.toggleTheme(newValue); // switch toggle 하는 방법이지. 여기에 값을 변경시켜주기만 했는데, 그 toggleTheme 안에 notifyListener() 이 실행된다.
        })],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // 헷갈리지마라. 컬럼은 메인이 새로이지? 그래서 자식들을 세로 전체 공간에서 중간으로 잡는다.
            crossAxisAlignment: CrossAxisAlignment.center, // 컬럼이기 때문에 이게 내가 생각하는 중간이고.. 가로를 중간으로 하는거니 당연함
            children: [
              Image.asset(
                "assets/images/profile_pic.png",
                width: 200,
                height: 200,
              ),
              AddBoxSize(BoxSizeForSpace.height,size: 10.0),
              Text(
                "Your Name",
                style: _textTheme.headline4?.copyWith(
                    color:isDark?Colors.white: Colors.black,fontWeight: FontWeight.bold // 이제 전부 isDArt 를 기준으로 값을 정한다.
                ),
              ),
              AddBoxSize(BoxSizeForSpace.height,size: 10.0),
              Text(
                "@YourUserName",
                style: _textTheme.subtitle1, // 사실상 텍스트 색깔은 자동으로 변경되네
              ),
              AddBoxSize(BoxSizeForSpace.height,size: 10.0),
              Text(
                "This is a simple Status",
              ),
              AddBoxSize(BoxSizeForSpace.height,size: 20.0),
              TextField(),
              AddBoxSize(BoxSizeForSpace.height,size: 20.0),
              ElevatedButton(child: Text("Just Click"), onPressed: () {}),
              AddBoxSize(BoxSizeForSpace.height,size: 20.0),
              ElevatedButton(child: Text("Click Me"), onPressed: () {}),
            ],
          ),
        ),
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.blue), // For Test
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    );
  }
}
