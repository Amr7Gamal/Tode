import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/datebase/taskData.dart';

import '../date.dart';

class MyDateBase {
  static CollectionReference<TaskData> getTask() {
    return FirebaseFirestore.instance
        .collection(TaskData.nameKey)
        .withConverter<TaskData>(
            fromFirestore: (snapshot, options) =>
                TaskData.fromFirestore(snapshot.data()!),
            toFirestore: (TaskData, _) => TaskData.toFirestore());
  }

  static Future<void> insertTask(TaskData task) {
    var tasksCollection = getTask();
    var doc = tasksCollection.doc();
    task.id = doc.id;
    return doc.set(task);
  }

  static Future<QuerySnapshot<TaskData>> getTasksQuery(
      DateTime dateTime) async {
    return await getTask()
        .where("dateTime", isEqualTo: dateOnly(dateTime).millisecondsSinceEpoch)
        .get();
  }

  static Stream<QuerySnapshot<TaskData>> listenForTasksRealTimeUpdetes(
      DateTime dateTime) {
    return getTask()
        .where("dateTime", isEqualTo: dateOnly(dateTime).millisecondsSinceEpoch)
        .snapshots();
  }

  static Future<void> deleteTask(TaskData task) {
    var doc = getTask().doc(task.id);
    return doc.delete();
  }
}
