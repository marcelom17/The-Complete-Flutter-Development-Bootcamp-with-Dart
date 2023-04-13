import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String t2Result = await task2();
  task3(t2Result);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2() async {
  final Duration timeLoading = Duration(seconds: 3);
  String result;
  await Future.delayed(timeLoading, (() {
    result = 'task 2 data';
    print('Task 2 complete');
  }));
  return result;
}

void task3(String task2Data) {
  String result = 'task 3 data';
  print('Task 3 complete with $task2Data');
}
