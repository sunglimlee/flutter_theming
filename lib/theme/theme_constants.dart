import 'package:flutter/material.dart';

// 색깔 바꾸고자 할 때 Flutter Theme Theming,
// https://itnext.io/an-easy-way-to-switch-between-dark-and-light-theme-in-flutter-fb971155eefe

const COLOR_PRIMARY = Colors.deepOrangeAccent; // 여기서는 colorPrimary 를 상수로 정해놨다.
const COLOR_ACCENT = Colors.orange;

ThemeData lightTheme = ThemeData( // 여기서 일일이 다 지정해주었다. 근데 거의 통일시키는 걸로 했네.
    // 여기서는 colorSchemeSeed 를 안쓰고 brightness 와 primaryColor 를 사용하고 있다.
    brightness: Brightness.light,
    primaryColor: COLOR_PRIMARY,
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: COLOR_ACCENT),
    elevatedButtonTheme: ElevatedButtonThemeData(
        // 버턴을 이런식으로 통일시켜서 사용할 수 가 있구나.
        /*
      EdgeInsetsGeometry class is a class for EdgeInsets that allows for text-direction aware resolution.
      EdgeInsets class is an immutable set of offsets in each of the four cardinal directions.
      Check the article below for more explanation It really helps:
      https://medium.com/flutteropen/flutter-widgets-01-container-cc76a2bfef11
       */
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                // 글자에 관련된 공간 설정, 상속 관련이므로 뭘쓰든지 빼든지 상관없다.
                EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                // Type: MaterialStateProperty<OutlinedBorder> Function(OutlinedBorder) // 여기 OutLinedBorder 이 RoundRectangleBorder 이다.
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0))),
            backgroundColor: MaterialStateProperty.all<Color>(COLOR_ACCENT))),
    inputDecorationTheme: InputDecorationTheme( // 값을 입력하는 Theme inputDecorationTheme
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.1)));

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  // accentColor: Colors.white,
  switchTheme: SwitchThemeData( // 아! 그냥 스위치의 색깔을 정하는 부분이었어.. 난 또 무슨 대단한거라고... Switch
    trackColor: MaterialStateProperty.all<Color>(Colors.grey), // 안에 부분이고
    thumbColor: MaterialStateProperty.all<Color>(Colors.white), // 손잡이 부분이고
  ),
  inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none),
      filled: true,
      fillColor: Colors.grey.withOpacity(0.1)),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)), // 뭔말인지 알지? 값이 변경되면 부모가 포지션을 정해준다. 왜냐면 여기서 40을 60으로 바꿔서 부모가 가능한지 알아보고 키운거니깐.
          shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0))),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          overlayColor: MaterialStateProperty.all<Color>(Colors.black26))),
);
