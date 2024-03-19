import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_project/data/model/SourcesResponse.dart';

class OfflineDataSource {
  Future<SourcesResponse?> getSource(String categoryID) async {
    CollectionReference tabsCollection =
        FirebaseFirestore.instance.collection("tabs");
    DocumentReference documentReference = tabsCollection.doc(categoryID);
    DocumentSnapshot documentSnapshot = await documentReference.get();
    if(documentSnapshot.data() == null) return null;
    return SourcesResponse.fromJson(documentSnapshot.data());
  }

  saveSources(SourcesResponse sourcesResponse, String categoryID) {
    CollectionReference tabsCollection =
        FirebaseFirestore.instance.collection("tabs");
    DocumentReference documentReference = tabsCollection.doc(categoryID);
    documentReference.set(sourcesResponse.toJson());
  }
}
