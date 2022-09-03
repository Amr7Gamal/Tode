import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/datebase/taskData.dart';

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
}
