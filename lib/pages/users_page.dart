import 'package:apptaller/provider/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    // return Container();
    final getUsersProvider = Provider.of<UsersProvider>(context, listen: true);
    final users = getUsersProvider.usersResult;
    print(getUsersProvider.usersResult);
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
            final item = users.removeAt(oldIndex); //* remueve el elemento de una lista pero ademas nos retorna el elemento eliminado
            //* Al elemento eliminado debemos insertarlo en su nueva posición
            users.insert(newIndex, item);
          },
          itemBuilder: (context, index) {
            final value = users[index];
            return ListTile(
              key: ValueKey(value.id),
              onTap: () => Navigator.pushNamed(context, 'detailUsers', arguments: users[index]),
              leading: const Icon(Icons.person),
              title: Text(
                value.name,
                style: const TextStyle(fontSize: 22)
                ),
              trailing: const Icon(Icons.arrow_right),
            );
          },
          itemCount: users.length,
        )
      )
    );
  }
}

    // onTap: () => Navigator.pushNamed(context, 'detail', arguments: photo),