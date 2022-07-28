import 'package:mobile_one/models/sepatu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WishlistProvider with ChangeNotifier {
  List<Sepatu> _wishlist = [];

  List<Sepatu> get wishlist => _wishlist;

  set wishlist(List<Sepatu> wishlist) {
    _wishlist = wishlist;
    notifyListeners();
  }

  setSepatu(Sepatu sepatu) {
    if (!isWishlist(sepatu)) {
      _wishlist.add(sepatu);
    } else {
      _wishlist.removeWhere((element) => element.id == sepatu.id);
    }

    notifyListeners();
  }

  isWishlist(Sepatu sepatu) {
    if (_wishlist.indexWhere((element) => element.id == sepatu.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
