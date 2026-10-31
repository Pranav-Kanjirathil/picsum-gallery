import 'package:flutter/foundation.dart';
import 'package:picsum/models/photo_model.dart';
import 'package:picsum/services/picsum_api.dart';

class GalleryProvider extends ChangeNotifier {
  final PicsumApi _api = PicsumApi();

  List<PhotoModel> photos = [];
  bool isLoading = false;
  String errorMessage = '';

  GalleryProvider() {
    fetchPhotos();
  }

  Future<void> fetchPhotos() async {
    isLoading = true;
    errorMessage = '';
    notifyListeners();

    try {
      photos = await _api.picsumApi();
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
