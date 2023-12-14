import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:prova/model/url_launcher_service.dart';
import 'package:prova/ui/home/home_store.dart';
import 'package:prova/utils/dialog_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _userController = TextEditingController();
  final HomeStore _homeStore = HomeStore();

  void _openPrivacyPolicy() {
    UrlLauncherService.openUrl('https://www.google.com/');
  }

  @override
  void initState() {
    super.initState();
    _homeStore.loadData();
  }

  void _editItem(int index) async {
    TextEditingController editingController = TextEditingController();
    editingController.text = _homeStore.itemList[index];
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Editar Item'),
          content: TextFormField(
            controller: editingController,
            decoration: const InputDecoration(labelText: 'Novo Valor'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                String editedValue = editingController.text;
                _homeStore.editItem(index, editedValue);
                setState(() {
                  _homeStore.loadData();
                });
                Navigator.of(context).pop();
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  void _deleteItem(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmação'),
          content: const Text('Deseja realmente excluir este item?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                _homeStore.deleteItem(index);
                setState(() {
                  _homeStore.loadData();
                });
                Navigator.of(context).pop();
              },
              child: const Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 2, 105, 112),
              Color.fromARGB(255, 186, 244, 248),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: size.height * 0.05),
                  child: Card(
                    child: Observer(
                      builder: (_) {
                        return ListView.builder(
                          itemCount: _homeStore.itemList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(_homeStore.itemList[index]),
                              //  onTap: () {
                              //  _editItem(index);
                              // },
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.edit),
                                    onPressed: () {
                                      _editItem(index);
                                      setState(() {
                                        _homeStore.loadData();
                                      });
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      _deleteItem(index);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                child: TextFormField(
                  controller: _userController,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (value) {
                    if (value.trim().isNotEmpty) {
                      _homeStore.addItem(value);
                      _userController.clear();
                      setState(() {
                        _homeStore.loadData();
                      });
                    } else {
                      DialogUtils.showAlertDialog(context, 'Alerta', 'O campo não pode ser vazio.');
                    }
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 248, 248, 248),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 13.5, vertical: 13.5),
                    hintText: 'Digite seu texto',
                  ),
                  cursorColor: Colors.black,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: _openPrivacyPolicy,
                child: const Text(
                  "Política de privacidade",
                  style: TextStyle(
                    color: Color.fromARGB(255, 3, 3, 3),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
