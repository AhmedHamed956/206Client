// class ShopDetailsModel {
//   String? status;
//   ShopDetailsModelData? data;
//   String? message;

//   ShopDetailsModel({this.status, this.data, this.message});

//   ShopDetailsModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     data = json['data'] != null
//         ? new ShopDetailsModelData.fromJson(json['data'])
//         : null;
//     message = json['message'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data['message'] = this.message;
//     return data;
//   }
// }

// class ShopDetailsModelData {
//   String? id;
//   List<Translations>? translations;
//   String? phone;
//   String? orders;
//   String? image;
//   bool? isFavorite;
//   int? isSpecial;
//   int? shopId;
//   int? activated;
//   bool? isOpen;
//   String? closeTime;
//   List<Products>? products;
//   List<Offers>? offers;

//   ShopDetailsModelData(
//       {this.id,
//       this.translations,
//       this.phone,
//       this.orders,
//       this.image,
//       this.isFavorite,
//       this.isSpecial,
//       this.shopId,
//       this.activated,
//       this.isOpen,
//       this.closeTime,
//       this.products,
//       this.offers});

//   ShopDetailsModelData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     if (json['translations'] != null) {
//       translations = <Translations>[];
//       json['translations'].forEach((v) {
//         translations!.add(new Translations.fromJson(v));
//       });
//     }
//     phone = json['phone'];
//     orders = json['orders'];
//     image = json['image'];
//     isFavorite = json['is_favorite'];
//     isSpecial = json['isSpecial'];
//     shopId = json['shop_id'];
//     activated = json['activated'];
//     isOpen = json['is_open'];
//     closeTime = json['close_time'];
//     if (json['products'] != null) {
//       products = <Products>[];
//       json['products'].forEach((v) {
//         products!.add(new Products.fromJson(v));
//       });
//     }
//     if (json['offers'] != null) {
//       products = <Products>[];
//       json['products'].forEach((v) {
//         products!.add(new Products.fromJson(v));
//       });
//     }
//     if (json['offers'] != null) {
//       offers = <Offers>[];
//       json['offers'].forEach((v) {
//         offers!.add(new Offers.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     if (this.translations != null) {
//       data['translations'] = this.translations!.map((v) => v.toJson()).toList();
//     }
//     data['phone'] = this.phone;
//     data['orders'] = this.orders;
//     data['image'] = this.image;
//     data['is_favorite'] = this.isFavorite;
//     data['isSpecial'] = this.isSpecial;
//     data['shop_id'] = this.shopId;
//     data['activated'] = this.activated;
//     data['is_open'] = this.isOpen;
//     data['close_time'] = this.closeTime;
//     if (this.products != null) {
//       data['products'] = this.products!.map((v) => v.toJson()).toList();
//     }
//     if (this.offers != null) {
//       data['offers'] = this.offers!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Offers {
//   int? productID;
//   String? image;
//   List<Translations>? translations;

//   Offers({this.productID, this.image, this.translations});

//   Offers.fromJson(Map<String, dynamic> json) {
//     productID = json['productID'];
//     image = json['image'];
//     if (json['translations'] != null) {
//       translations = <Translations>[];
//       json['translations'].forEach((v) {
//         translations!.add(new Translations.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['productID'] = this.productID;
//     data['image'] = this.image;
//     if (this.translations != null) {
//       data['translations'] = this.translations!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Translations {
//   int? id;
//   int? branchId;
//   String? locale;
//   String? name;

//   Translations({this.id, this.branchId, this.locale, this.name});

//   Translations.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     branchId = json['branch_id'];
//     locale = json['locale'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['branch_id'] = this.branchId;
//     data['locale'] = this.locale;
//     data['name'] = this.name;
//     return data;
//   }
// }

// class Products {
//   int? productID;
//   String? image;
//   List<Translations>? translations;

//   Products({this.productID, this.image, this.translations});

//   Products.fromJson(Map<String, dynamic> json) {
//     productID = json['productID'];
//     image = json['image'];
//     if (json['translations'] != null) {
//       translations = <Translations>[];
//       json['translations'].forEach((v) {
//         translations!.add(new Translations.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['productID'] = this.productID;
//     data['image'] = this.image;
//     if (this.translations != null) {
//       data['translations'] = this.translations!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class ProductsTranslations {
//   int? id;
//   int? productId;
//   String? locale;
//   String? name;
//   String? description;

//   ProductsTranslations(
//       {this.id, this.productId, this.locale, this.name, this.description});

//   ProductsTranslations.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     productId = json['product_id'];
//     locale = json['locale'];
//     name = json['name'];
//     description = json['description'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['product_id'] = this.productId;
//     data['locale'] = this.locale;
//     data['name'] = this.name;
//     data['description'] = this.description;
//     return data;
//   }
// }

class ShopDetailsModel {
  String? status;
  ShopDetailsModelData? data;
  String? message;

  ShopDetailsModel({this.status, this.data, this.message});

  ShopDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null
        ? new ShopDetailsModelData.fromJson(json['data'])
        : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class ShopDetailsModelData {
  String? id;
  List<Translations>? translations;
  String? phone;
  String? orders;
  String? rate;
  String? numOffers;
  String? numProducts;
  String? image;
  bool? isFavorite;
  int? isSpecial;
  int? shopId;
  int? activated;
  bool? isOpen;
  String? closeTime;
  List<Products>? products;
  List<Offers>? offers;

  ShopDetailsModelData(
      {this.id,
      this.translations,
      this.phone,
      this.orders,
      this.rate,
      this.numOffers,
      this.numProducts,
      this.image,
      this.isFavorite,
      this.isSpecial,
      this.shopId,
      this.activated,
      this.isOpen,
      this.closeTime,
      this.products,
      this.offers});

  ShopDetailsModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['translations'] != null) {
      translations = <Translations>[];
      json['translations'].forEach((v) {
        translations!.add(new Translations.fromJson(v));
      });
    }
    phone = json['phone'];
    orders = json['orders'];
    rate = json['rate'];
    numOffers = json['num_offers'];
    numProducts = json['num_products'];
    image = json['image'];
    isFavorite = json['is_favorite'];
    isSpecial = json['isSpecial'];
    shopId = json['shop_id'];
    activated = json['activated'];
    isOpen = json['is_open'];
    closeTime = json['close_time'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    if (json['offers'] != null) {
      offers = <Offers>[];
      json['offers'].forEach((v) {
        offers!.add(new Offers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.translations != null) {
      data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    }
    data['phone'] = this.phone;
    data['orders'] = this.orders;
    data['rate'] = this.rate;
    data['num_offers'] = this.numOffers;
    data['num_products'] = this.numProducts;
    data['image'] = this.image;
    data['is_favorite'] = this.isFavorite;
    data['isSpecial'] = this.isSpecial;
    data['shop_id'] = this.shopId;
    data['activated'] = this.activated;
    data['is_open'] = this.isOpen;
    data['close_time'] = this.closeTime;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.offers != null) {
      data['offers'] = this.offers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Translations {
  int? id;
  int? branchId;
  String? locale;
  String? name;

  Translations({this.id, this.branchId, this.locale, this.name});

  Translations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    branchId = json['branch_id'];
    locale = json['locale'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['branch_id'] = this.branchId;
    data['locale'] = this.locale;
    data['name'] = this.name;
    return data;
  }
}

class Products {
  int? productID;
  String? image;
  List<ProductTranslations>? translations;

  Products({this.productID, this.image, this.translations});

  Products.fromJson(Map<String, dynamic> json) {
    productID = json['productID'];
    image = json['image'];
    if (json['translations'] != null) {
      translations = <ProductTranslations>[];
      json['translations'].forEach((v) {
        translations!.add(new ProductTranslations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productID'] = this.productID;
    data['image'] = this.image;
    if (this.translations != null) {
      data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductTranslations {
  int? id;
  int? productId;
  String? locale;
  String? name;
  String? description;

  ProductTranslations(
      {this.id, this.productId, this.locale, this.name, this.description});

  ProductTranslations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    locale = json['locale'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['locale'] = this.locale;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}

class Offers {
  int? offerID;
  String? image;
  List<OffersTranslations>? translations;

  Offers({this.offerID, this.image, this.translations});

  Offers.fromJson(Map<String, dynamic> json) {
    offerID = json['offerID'];
    image = json['image'];
    if (json['translations'] != null) {
      translations = <OffersTranslations>[];
      json['translations'].forEach((v) {
        translations!.add(new OffersTranslations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offerID'] = this.offerID;
    data['image'] = this.image;
    if (this.translations != null) {
      data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OffersTranslations {
  int? id;
  int? offerId;
  String? locale;
  String? name;
  String? description;

  OffersTranslations(
      {this.id, this.offerId, this.locale, this.name, this.description});

  OffersTranslations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    offerId = json['offer_id'];
    locale = json['locale'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['offer_id'] = this.offerId;
    data['locale'] = this.locale;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}
