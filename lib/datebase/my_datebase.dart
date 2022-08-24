import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/datebase/taskData.dart';
import 'package:todo/tasks/taskItem.dart';

class MyDateBase {
  static CollectionReference<TaskData> getTask() {
    return FirebaseFirestore.instance.collection(TaskData.nameKey)
        .withConverter<TaskData>(
        fromFirestore: (snapshot, options) =>
            TaskData.fromFirestore(snapshot.data()!),
        toFirestore: (TaskData, _) => TaskData.toFirestore());
  }

  void insertTask(TaskData task) {
    getTask().a
  }

}
