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

  List listOfSelectedColorIDs(String selectedColor) {
    List<int> keys = [];
    variationIdOfUniqueColor!.forEach((key, value) {
      if (value == selectedColor) {
        keys.add(key);
      }
    });
    return keys;
  }

  List listOfSelectedSizeIDs(String selectedSize) {
    List<int> keys = [];
    variationIdOfUniqueSize!.forEach((key, value) {
      if (value == selectedSize) {
        keys.add(key);
      }
    });
    return keys;
  }

  List listOfSelectedMaterialIDs(String selectedMaterial) {
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

//   int getVariationId() {

//     if(){

// return 0;
//     }
//     return 0;

//     // findIntersection(
//     //         listOfSelectedMaterialIDs(uniqueMaterials![selectedMaterialIndex]),
//     //         findIntersection(
//     //             listOfSelectedColorIDs(uniqueColors![selectedColorIndex]),
//     //             listOfSelectedSizeIDs(uniqueSizes![selectedSizeIndex])))
//     //     .first;
//   }

  List<String> currentVariationProperties() {
    List<String> properties = [];
    //if there is a color in uniqueColors list it adds color property to properties
    if (uniqueColors != []) {
      properties.add("Color");
      // if the intersection of the selected color ID's variation contains a size property it adds size to the list
      if (findIntersection(
              listOfSelectedColorIDs(uniqueColors![selectedColorIndex]),
              listOfSizeIDs()) !=
          []) {
        properties.add("Size");

        //if there is an intersection between all properties, add material
        if (findIntersection(
                findIntersection(
                    listOfSelectedColorIDs(uniqueColors![selectedColorIndex]),
                    listOfSizeIDs()),
                listOfSelectedMaterialIDs(
                    uniqueMaterials![selectedMaterialIndex])) !=
            []) {
          properties.add("Material");
        }
        // els if the intersection of the selected color ID's variation does not contains a size property it checks if it has an intersection with the materials and adds it if found
      } else if (findIntersection(
              listOfSelectedColorIDs(uniqueColors![selectedColorIndex]),
              listOfMaterialIDs()) !=
          []) {
        properties.add("Material");
      } //else if there was no color and there was size
    } else if (uniqueSizes != []) {
      properties.add("Size");
      if (findIntersection(
              listOfSelectedSizeIDs(uniqueSizes![selectedSizeIndex]),
              listOfMaterialIDs()) !=
          []) {
        properties.add("Material");
      } else if (uniqueMaterials != []) {
        properties.add("material");
      }
    }
    return properties;
  }
}
