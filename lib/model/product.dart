// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:slash/model/product_property_and_value.dart';
import 'package:slash/model/product_variation.dart';

class Product extends ChangeNotifier {
  int? id;
  int? currentVariationId; // to toggle between variations
  String? name;
  String? description;
  int? brandId;
  String? brandName;
  String? brandLogoUrl;
  double? rating;
  List<ProductVariation>? variations;
  List<ProductPropertyAndValue>?
      availableProperties; //What properties are offered //(multiple colors or non, multiple sizes or non, materials)

  List<String>? uniqueColors;
  List<String>? uniqueSizes;
  List<String>? uniqueMaterials;
  Map<int, String>? variationIdOfUniqueColor;
  Map<int, String>? variationIdOfUniqueSize;
  Map<int, String>? variationIdOfUniqueMaterial;

  int selectedColorIndex;
  int selectedSizeIndex;
  int selectedMaterialIndex;

  Product({
    this.id,
    this.currentVariationId,
    this.name,
    this.description,
    this.brandId,
    this.brandName,
    this.brandLogoUrl,
    this.rating,
    this.variations,
    this.availableProperties,
    this.uniqueColors,
    this.uniqueSizes,
    this.uniqueMaterials,
    this.variationIdOfUniqueColor,
    this.variationIdOfUniqueSize,
    this.variationIdOfUniqueMaterial,
    this.selectedColorIndex = 0,
    this.selectedSizeIndex = 0,
    this.selectedMaterialIndex = 0,
  });

  ProductVariation getCurrentVariation() {
    return variations!
        .firstWhere((element) => element.id == currentVariationID());
  }

  void addUniqueColors() {
    for (var i = 0; i < variations!.length; i++) {
      uniqueColors == null ? uniqueColors = [] : null;
      variations![i]
              .productPropertiesValues!
              .any((element) => element.property == "Color")
          ? uniqueColors!.contains(variations![i]
                  .productPropertiesValues!
                  .firstWhere((element) => element.property == "Color")
                  .value)
              ? null
              : uniqueColors!.add(variations![i]
                  .productPropertiesValues!
                  .firstWhere((element) => element.property == "Color")
                  .value)
          : null;
    }
  }

// a list of unique sizes to display in the product details screen

  void addUniqueSize() {
    for (var i = 0; i < variations!.length; i++) {
      uniqueSizes == null ? uniqueSizes = [] : null;

      variations![i]
              .productPropertiesValues!
              .any((element) => element.property == "Size")
          ? uniqueSizes!.contains(variations![i]
                  .productPropertiesValues!
                  .firstWhere((element) => element.property == "Size")
                  .value)
              ? null
              : uniqueSizes!.add(variations![i]
                  .productPropertiesValues!
                  .firstWhere((element) => element.property == "Size")
                  .value)
          : null;
    }
  }
// a list of unique materials to display in the product details screen

  void addUniqueMaterial() {
    uniqueMaterials == null ? uniqueMaterials = [] : null;
    for (var i = 0; i < variations!.length; i++) {
      variations![i]
              .productPropertiesValues!
              .any((element) => element.property == "Material")
          ? uniqueMaterials!.contains(variations![i]
                  .productPropertiesValues!
                  .firstWhere((element) => element.property == "Material")
                  .value)
              ? null
              : uniqueMaterials!.add(variations![i]
                  .productPropertiesValues!
                  .firstWhere((element) => element.property == "Material")
                  .value)
          : null;
    }
  }

  void addUniqeColorID() {
    variationIdOfUniqueColor == null ? variationIdOfUniqueColor = {} : null;
    for (var i = 0; i < variations!.length; i++) {
      variations![i]
              .productPropertiesValues!
              .any((element) => element.property == "Color")
          ? variationIdOfUniqueColor![variations![i].id!] = variations![i]
              .productPropertiesValues!
              .firstWhere((element) => element.property == "Color")
              .value
          : null;
    }
  }

  void addUniqeSizeID() {
    variationIdOfUniqueSize == null ? variationIdOfUniqueSize = {} : null;

    for (var i = 0; i < variations!.length; i++) {
      variations![i]
              .productPropertiesValues!
              .any((element) => element.property == "Size")
          ? variationIdOfUniqueSize![variations![i].id!] = variations![i]
              .productPropertiesValues!
              .firstWhere((element) => element.property == "Size")
              .value
          : null;
    }
  }

  void addUniqeMaterialID() {
    variationIdOfUniqueMaterial == null
        ? variationIdOfUniqueMaterial = {}
        : null;

    for (var i = 0; i < variations!.length; i++) {
      variations![i]
              .productPropertiesValues!
              .any((element) => element.property == "Material")
          ? variationIdOfUniqueMaterial![variations![i].id!] = variations![i]
              .productPropertiesValues!
              .firstWhere((element) => element.property == "Material")
              .value
          : null;
    }
  }

  List<int> listOfSelectedColorIDs(String selectedColor) {
    List<int> keys = [];
    variationIdOfUniqueColor!.forEach((key, value) {
      if (value == selectedColor) {
        keys.add(key);
      }
    });
    return keys;
  }

  List<int> listOfSelectedSizeIDs(String selectedSize) {
    List<int> keys = [];
    variationIdOfUniqueSize!.forEach((key, value) {
      if (value == selectedSize) {
        keys.add(key);
      }
    });
    return keys;
  }

  List<int> listOfSelectedMaterialIDs(String selectedMaterial) {
    List<int> keys = [];
    variationIdOfUniqueMaterial!.forEach((key, value) {
      if (value == selectedMaterial) {
        keys.add(key);
      }
    });
    return keys;
  }

  List listOfColorIDs() {
    List<int> keys = [];
    variationIdOfUniqueColor!.forEach((key, value) {
      keys.add(key);
    });
    return keys;
  }

  List listOfSizeIDs() {
    List<int> keys = [];
    variationIdOfUniqueSize!.forEach((key, value) {
      keys.add(key);
    });
    return keys;
  }

  List listOfMaterialIDs() {
    List<int> keys = [];
    variationIdOfUniqueMaterial!.forEach((key, value) {
      keys.add(key);
    });
    return keys;
  }

//finding intersectionof 2 lists
  List<int> findIntersection<int>(List<int> list1, List<int> list2) {
    Set<int> set1 = Set<int>.from(list1);
    Set<int> set2 = Set<int>.from(list2);

    Set<int> intersection = set1.intersection(set2);

    return intersection.toList();
  }

//current variation id getter
  int currentVariationID() {
    List<int> idList = [];
    //if there is a color
    if (uniqueColors!.isNotEmpty) {
      // if the selected color has a size
      if (findIntersection(
              listOfSelectedColorIDs(uniqueColors![selectedColorIndex]),
              listOfSizeIDs())
          .isNotEmpty) {
//add the intersection of lists to my id list
        idList = findIntersection(
            listOfSelectedColorIDs(uniqueColors![selectedColorIndex]),
            listOfSelectedSizeIDs(uniqueSizes![selectedSizeIndex]));
        //if selected size and color has a material
        if (findIntersection(
                findIntersection(
                    listOfSelectedColorIDs(uniqueColors![selectedColorIndex]),
                    listOfSelectedSizeIDs(uniqueSizes![selectedSizeIndex])),
                listOfMaterialIDs())
            .isNotEmpty) {
          idList = findIntersection(
              listOfSelectedMaterialIDs(
                  uniqueMaterials![selectedMaterialIndex]),
              findIntersection(
                  listOfSelectedColorIDs(uniqueColors![selectedColorIndex]),
                  listOfSelectedSizeIDs(uniqueSizes![selectedSizeIndex])));
        }
      }
      //if selected color has no size
      else {
        //if selected color has material but no size
        if (findIntersection(
                listOfSelectedColorIDs(uniqueColors![selectedColorIndex]),
                listOfMaterialIDs())
            .isNotEmpty) {
          idList = findIntersection(
              listOfSelectedColorIDs(uniqueColors![selectedColorIndex]),
              listOfSelectedMaterialIDs(
                  uniqueMaterials![selectedMaterialIndex]));
        } else {
          //if selected color has no material and no size
          idList = listOfSelectedColorIDs(uniqueColors![selectedColorIndex]);
        }
      }
    }

    //if there is no color
    else {
      //if there is a size property and no color
      if (uniqueSizes!.isNotEmpty) {
        // if the size has a material
        if (findIntersection(
                listOfSelectedSizeIDs(uniqueSizes![selectedSizeIndex]),
                listOfMaterialIDs())
            .isNotEmpty) {
          idList = findIntersection(
              listOfSelectedSizeIDs(uniqueSizes![selectedSizeIndex]),
              listOfSelectedMaterialIDs(
                  uniqueMaterials![selectedMaterialIndex]));
        } else {
//if the size has no material
          idList = listOfSelectedSizeIDs(uniqueSizes![selectedSizeIndex]);
        }

        //if there is no color and no size
      } else {
        //if there is no color and no size but there is a material

        if (uniqueMaterials!.isNotEmpty) {
          idList = listOfSelectedMaterialIDs(
              uniqueMaterials![selectedMaterialIndex]);
        }
        //if there is no color and no size and no material

        else {
          idList.add(variations![0].id!);
        }
      }
    }
    return idList.first;
  }

  bool verifyMaterial(int index) {
    bool output = false;
//if there is a color
    if (uniqueColors!.isNotEmpty) {
      print(111111);
      //if there is a color and size
      if (uniqueSizes!.isNotEmpty &&
          //and there is a variation that contains the selected color and size
          !intersectColorSize(selectedSizeIndex)) {
        output = intersectColorSizeMaterial(index);
      } else {
        //if there is a color and no size
        print(10000000000000);

        output = intersectColorMaterial(index);
      }

      //
    } else {
      //if there is no color
      if (uniqueSizes!.isNotEmpty) {
        //if there is no color but there is size
        output = intersectSizeMaterial(index);
      } else {
        //if there is no color and no size
        if (uniqueMaterials!.isNotEmpty) {
          //if there is only material
          output = true;
        } else {
          //if there is no material
          output = false;
        }
      }
    }
    return output;
  }

  bool intersectColorSizeMaterial(int index) {
    return uniqueColors!.isNotEmpty &&
            uniqueMaterials!.isNotEmpty &&
            uniqueSizes!.isNotEmpty
        ? findIntersection(
                listOfSelectedSizeIDs(uniqueSizes![selectedSizeIndex]),
                findIntersection(
                    listOfSelectedColorIDs(uniqueColors![selectedColorIndex]),
                    listOfSelectedMaterialIDs(uniqueMaterials![index])))
            .isEmpty
        : false;
  }

  bool intersectColorMaterial(int index) {
    return findIntersection(
            listOfSelectedColorIDs(uniqueColors![selectedColorIndex]),
            listOfSelectedMaterialIDs(uniqueMaterials![index]))
        .isEmpty;
  }

  bool intersectSizeMaterial(int index) {
    return findIntersection(
            listOfSelectedSizeIDs(uniqueSizes![selectedSizeIndex]),
            listOfSelectedMaterialIDs(uniqueMaterials![index]))
        .isEmpty;
  }

  bool verifySize(int index) {
    bool output = false;
//if there is a color
    if (uniqueColors!.isNotEmpty) {
      //if there is a color and size
      if (uniqueSizes!.isNotEmpty) {
        output = intersectColorSize(index);
        print(1);
      } else {
        print(0);

        output = false;
      }
    }
//if there is no color
    else {
      if (uniqueColors!.isNotEmpty) {
        output = true;
      }
    }
    return output;
  }

//

  bool intersectColorSize(int index) {
    return uniqueColors!.isNotEmpty
        ? findIntersection(
                listOfSelectedColorIDs(uniqueColors![selectedColorIndex]),
                listOfSelectedSizeIDs(uniqueSizes![index]))
            .isEmpty
        : false;
  }

  bool verifyColor(int index) {
    bool output = false;
    if (uniqueColors!.isNotEmpty) {
      output = true;
    } else {
      output = false;
    }
    return output;
  }
}

//sample date

Product product1 = Product(
    id: 1,
    currentVariationId: 100,
    name: "scarf",
    description: "a scarf",
    brandId: 1,
    brandName: "Honda Store",
    brandLogoUrl: "Assets/Images/profilePic.jpeg",
    rating: 3,
    variations: [variation1],
    availableProperties: variation1.productPropertiesValues);

Product product2 = Product(
    id: 2,
    currentVariationId: 200,
    name: "bag",
    description: "a bag",
    brandName: "Honda Store",
    brandLogoUrl: "Assets/Images/profilePic.jpeg",
    brandId: 1,
    rating: 4,
    variations: [variation2, variation1, variation3],
    availableProperties: []);

ProductVariation variation1 = ProductVariation(
    id: 100,
    productId: 1,
    price: 200,
    quantity: 20,
    inStock: true,
    productVarientImages: [
      "Assets/Images/hmgoepprod.jpeg"
    ],
    productPropertiesValues: [
      proAndVal2,
      proAndVal5,
    ]);

ProductVariation variation2 = ProductVariation(
    id: 200,
    productId: 2,
    price: 20,
    quantity: 2,
    inStock: false,
    productVarientImages: [
      "Assets/Images/bag.jpg",
      "Assets/Images/gettyimages-167759603-612x612.jpg"
    ],
    productPropertiesValues: [
      proAndVal1,
      proAndVal4,
      proAndVal6
    ]);
ProductVariation variation3 = ProductVariation(
  id: 300,
  productId: 2,
  price: 2000,
  quantity: 2,
  inStock: true,
  productVarientImages: [
    "Assets/Images/bag.jpg",
    "Assets/Images/gettyimages-167759603-612x612.jpg"
  ],
  productPropertiesValues: [proAndVal2, proAndVal4],
);

ProductPropertyAndValue proAndVal1 =
    ProductPropertyAndValue(property: "Color", value: "0xffffff00");
ProductPropertyAndValue proAndVal2 =
    ProductPropertyAndValue(property: "Color", value: "0xffffffff");
ProductPropertyAndValue proAndVal3 =
    ProductPropertyAndValue(property: "Size", value: "M");

ProductPropertyAndValue proAndVal4 =
    ProductPropertyAndValue(property: "Size", value: "XXL");
ProductPropertyAndValue proAndVal5 =
    ProductPropertyAndValue(property: "Size", value: "XL");
ProductPropertyAndValue proAndVal6 =
    ProductPropertyAndValue(property: "Material", value: "Cotton");
ProductPropertyAndValue proAndVal7 =
    ProductPropertyAndValue(property: "Material", value: "Wool");

List<ProductPropertyAndValue> productPropertiesValues = [
  proAndVal2,
  proAndVal3,
  proAndVal4,
  proAndVal5,
  proAndVal6,
  proAndVal7,
];
List<Product> products = [product1, product2];
