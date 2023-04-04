import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference _dbMovies = FirebaseFirestore.instance.collection('movies');

  //stub function, will be changed once the imdb API is integrated
  void addMovieStub(String id){
    var movieStub = <String, dynamic>{
      "id": id,
    };
    _dbMovies.doc(id).set(movieStub).onError((error, stackTrace) => print("Couldn't add file. \n"));

    final movieDocRef = _dbMovies.doc("$id");
    print("$movieDocRef");
  }

  //stub function, will be changed once the imdb API is integrated
  void removeMovieStub(String id_){
    _dbMovies.doc(id_).delete().onError((error, stackTrace) => print("Couldn't delete document. \n"));
  }
}