import 'package:hive/hive.dart';

class HiveHandler {
  isExists({required String boxName}) async {
    final openBox = await Hive.openBox(boxName);
    int length = openBox.length;
    return length != 0;
  }

  addBoxes<T>(List<T> items, String boxName) async {
    final openBox = await Hive.openBox(boxName);
    for (var item in items) {
      openBox.add(item);
    }
  }

  deleteBox(String boxName) async {
    final box = Hive.box(boxName);

    await box.clear();
    print(box.length);
  }

  onLogout() async {
    final box = Hive.box("UserProfile");
    await box.clear();
    final box1 = Hive.box("eventList");
    await box1.clear();
    final box2 = Hive.box("fav");
    await box2.clear();
    final box3 = await Hive.openBox("staylogin");
    await box3.clear();
  }

  addBox(item, String boxName) async {
    final openBox = await Hive.openBox(boxName);
    openBox.add(item);
  }

  addBoxAndDelete(item, String boxName) async {
    final openBox = await Hive.openBox(boxName);
    int length = openBox.length;
    if (length == 0) {
      openBox.add(item);
    } else {
      final box = Hive.box(boxName);
      await box.clear();
      openBox.add(item);
    }
  }

  Future<List<T>> getBoxes<T>(String boxName) async {
    List<T> boxList = <T>[];
    final openBox = await Hive.openBox(boxName);
    int length = openBox.length;
    for (int i = 0; i < length; i++) {
      boxList.add(openBox.getAt(i));
    }
    return boxList;
  }

  deleteItem(int index, String boxName) async {
    final box = await Hive.openBox(boxName);
    box.deleteAt(index);
  }

  editItem(int index, String boxName, dynamic model) async {
    final box = await Hive.openBox(boxName);
    box.putAt(index, model);
  }

  // deleteItemFromProduct(int id, String boxName) async {
  //   List<dynamic> boxList = [];
  //   final openBox = await Hive.openBox(boxName);
  //   int length = openBox.length;
  //   for (int i = 0; i < length; i++) {
  //     boxList.add(openBox.getAt(i));
  //   }
  //   List<dynamic> deleteFav = boxList;
  //   for (int i = 0; i < deleteFav.length; i++) {
  //     if (deleteFav[i].id == id) {
  //       return i;
  //     }
  //   }
  //   return 0;
  // }
}
