
import 'package:test/expect.dart';

void main() async{
  print('line 1');
  await hamir();
  print('line 2');
  print('line 5');
}
Future<void> hamir()async{
  Future.delayed(Duration(seconds: 3),()=>print('lijubh 3'));
}

// Future delayedPrint(int seconds, String msg)
// {
//   final duration = Duration(seconds: seconds);
//   return Future.delayed(duration).then((value) => msg);
// }
//
// void main() async
// {
//   print('Life');
//   await delayedPrint(2, "Is").then((status)
//   {
//     print(status);
//   });
//   print('Good');
// }
