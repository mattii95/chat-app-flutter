import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:chat_app/models/users_model.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  final users = [
    UsersModel(
        online: true,
        email: 'test@test.com',
        nombre: 'Chris',
        uid: '1',
        photo:
            'https://img.freepik.com/foto-gratis/guapo-exitoso-hombre-negocios-sonriente_176420-19024.jpg?w=2000'),
    UsersModel(
      online: true,
      email: 'test2@test.com',
      nombre: 'Walter',
      uid: '2',
    ),
    UsersModel(
      online: false,
      email: 'test3@test.com',
      nombre: 'Marshall',
      uid: '3',
      photo:
          'https://static3.abc.es/media/summum/2021/10/01/maxi_iglesias-kXKH--620x349@abc.jpeg',
    ),
    UsersModel(
      online: true,
      email: 'test4@test.com',
      nombre: 'Scarlett',
      uid: '4',
      photo:
          'https://imagenes.20minutos.es/files/og_thumbnail/uploads/imagenes/2021/11/22/scarlett-johansson.jpeg',
    ),
    UsersModel(
      online: true,
      email: 'test5@test.com',
      nombre: 'Sebastian',
      uid: '5',
    ),
    UsersModel(
      online: false,
      email: 'test6@test.com',
      nombre: 'Ana',
      uid: '6',
      photo:
          'https://p2.trrsf.com/image/fget/cf/1200/1600/middle/images.terra.com/2022/01/22/1798086607-ana-de-armas.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ChatApp',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        elevation: 1,
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.exit_to_app)),
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: const Icon(Icons.check_circle),
          ),
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: _loadUsers,
        header: WaterDropHeader(
          complete: Icon(
            Icons.check,
            color: Colors.indigo[400],
          ),
          waterDropColor: Colors.indigo,
        ),
        child: _listViewUsers(),
      ),
    );
  }

  ListView _listViewUsers() {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, i) {
          return _userListTile(users[i]);
        },
        separatorBuilder: (_, i) {
          return const Divider();
        },
        itemCount: users.length);
  }

  ListTile _userListTile(UsersModel user) {
    return ListTile(
      title: Text(user.nombre),
      subtitle: Text(user.email),
      leading: user.photo != null
          ? CircleAvatar(
              backgroundImage: NetworkImage(user.photo!),
            )
          : CircleAvatar(
              foregroundColor: Colors.indigo,
              backgroundColor: Colors.indigo[100],
              child: Text(user.nombre.substring(0, 2)),
            ),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: user.online ? Colors.green[300] : Colors.red,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }

  _loadUsers() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }
}
