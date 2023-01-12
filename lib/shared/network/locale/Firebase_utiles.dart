import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/modales/tasks.dart';

CollectionReference<Task> getTaskCollection() {
  return FirebaseFirestore.instance.collection("Task").withConverter<Task>(
    fromFirestore: (snapshot, options) {
      return Task.fromJson(snapshot.data()!);
    },
    toFirestore: (task, options) {
      return task.toJson();
    },
  );
}

Future<void> addTasktofirestore(Task task) async {
  var collection = getTaskCollection();
  var docRef = collection.doc();
  task.id = docRef.id;
  return docRef.set(task);
}

Stream<QuerySnapshot<Task>> getdatafromfirebase(DateTime date) {
  return getTaskCollection()
      .where("date", isEqualTo: DateUtils.dateOnly(date).millisecondsSinceEpoch)
      .snapshots();
}

Future<void> DeleteTaskfromfireatore(Task task) {
  return getTaskCollection().doc(task.id).delete();
}

Future<void> getUserInfor(Task task, String title, String des, int date) async {
  return getTaskCollection()
      .doc(task.id)
      .update({"title": title, "description": des, "date": date});
}

Stream<QuerySnapshot<Task>> getdatafromIsdone(Task task) {
  return getTaskCollection().where("IsDone").snapshots();
}

Future<void> updateBool(String taskid, bool done) async {
  return getTaskCollection().doc(taskid).update({"isDone": done});
}
