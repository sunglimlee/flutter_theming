library config.globals; // 이 파일을 글로벌로 만들고, 이렇게 안해도 되는데.. 무시해라. 이렇게 할 필요없이 그냥 다르곳에서 import 하면 된다. 다른곳에서 as 사용하는 것도 기억하지?
import 'package:flutter/material.dart';

// https://blog.logrocket.com/statenotifier-improving-state-change-notifiers-flutter/#:~:text=ChangeNotifier%20is%20a%20class%20that,a%20change%20in%20that%20class // ChangeNotifier 에 대해
// https://stackoverflow.com/questions/57243896/with-keyword-in-flutter // with keyword 에 대해
// https://itnext.io/an-easy-way-to-switch-between-dark-and-light-theme-in-flutter-fb971155eefe // easy way to switch between dark and light theme in Flutter, // Hive 사용법도 나오네 쉽네 SharedPreference 안써도 되네

// 상태변화 이벤트를 받는 클래스이구나. 다중상속을 허용하지는 않지만 그래도 필요한 메서드를 상속받을 수 있도록 해주는구나 Mixins 이라고 하네.
class ThemeManager with ChangeNotifier{ // 상태관리를 해줄 클래스임을 표시, 이걸 사용하기 위해서 아마도 StatefulWidget 을 사용하지 않았을까?
//위에 봤지? 부모가 하나라서 그냥 extends 해도 된다. 얘 웃긴다. 어디서 배꼈나봐.

  ThemeMode _themeMode = ThemeMode.light;

  get themeMode => _themeMode; // 이제는 get 함수 구현하는것 어렵지 않지?

  //set themeMode(ThemeMode themeMode) { _themeMode = themeMode; }

  toggleTheme(bool isDark){
    _themeMode = isDark?ThemeMode.dark:ThemeMode.light;
    // ChangeNotifier 클래스에서 상속받은 메서드
    notifyListeners(); // 클래스에 있는 값이 변경되었으니 현재 값을 다시 반영하도록 해라... 즉 외부에서 등록한 리스터를 실행하라는 뜻,
  }

}