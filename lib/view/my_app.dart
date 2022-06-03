import 'package:consumo_api/controller/my_app_controller.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = MyAppController();

  _success() {
    return ListView.builder(
      itemCount: controller.todos.length,
      itemBuilder: (context, index) {
        var todo = controller.todos[index];
        return ListTile(
          title: Text(todo.title.toString()),
          leading: Text(todo.id.toString()),
          subtitle: Text(todo.completed.toString()),
          trailing: Text(todo.userId.toString()),
        );
      },
    );
  }

  _error() {
    return const Center(
      child: Text("Error"),
    );
  }

  _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  _start() {
    return Container();
  }

  stateManagement(HomeState state) {
    switch (state) {
      case HomeState.start:
        return _start();

      case HomeState.loading:
        return _loading();
      case HomeState.success:
        return _success();
      case HomeState.error:
        return _error();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home",
      home: Scaffold(
        appBar: AppBar(),
        body: AnimatedBuilder(
          animation: controller.state,
          builder: (context, child) {
            return stateManagement(controller.state.value);
          },
        ),
      ),
    );
  }
}
