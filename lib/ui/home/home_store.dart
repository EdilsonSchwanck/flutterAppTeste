import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  


  @observable
  List<String> itemList = ObservableList<String>();

  @action
  Future<void> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    itemList = prefs.getStringList('items') ?? [];
  }



  @action
  Future<void> saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('items', itemList);
 
  }

  @action
  void addItem(String value) {
    itemList.add(value);
    saveData();
    // Salva os dados após adicionar um item
  }

  @action
  void deleteItem(int index) {
    itemList.removeAt(index);
    saveData(); 
    
  }

  @action
  void editItem(int index, String newValue) {
    itemList[index] = newValue;
    saveData(); 

  }
}


 