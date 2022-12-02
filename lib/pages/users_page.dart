import 'package:flutter/material.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
   final List<int> _numbers = [];
  
  @override
  void initState() {
    super.initState();
    _numbers.addAll(List.generate(100, (index) => index)); //* nos va generar 100 numeros 0 al 99
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuarios'),
        backgroundColor: Colors.deepPurple),
      body: SafeArea(
        child: ReorderableListView.builder(
          onReorder: (oldIndex, newIndex) {
            print('oldIndex: $oldIndex');
            print('newIndex: $newIndex');

            if( oldIndex < newIndex ) {
              //* Quiere decir que no estamos moviendo hacia abajo
              //* Ejemplo: movemos 0 al 1, ahora el 1 debe ser el primer elemento y 0 el segundo
              newIndex = newIndex - 1;
            }
            //* remover y trasladarlo a su nuevo posición
            final item = _numbers.removeAt(oldIndex); //* remueve el elemento de una lista pero ademas nos retorna el elemento eliminado
            //* Al elemento eliminado debemos insertarlo en su nueva posición
            _numbers.insert(newIndex, item);
          },
          itemBuilder: (context, index) {
            final value = _numbers[index];
            return ListTile(
              key: ValueKey<int>(value),
              title: Text(
                '$value',
                style: const TextStyle(fontSize: 30)
                )
            );
          },
          itemCount: _numbers.length,
        )
      )
    );
  }
}