import 'package:flutter_application_1/model/category_model.dart';
List<CategoryModel> getCategories(){

  List<CategoryModel> category=[];
  CategoryModel categoryModel = new CategoryModel();

  categoryModel.CategoryName="Business";
  categoryModel.image="assets/business.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();
  
  categoryModel.CategoryName="Sports";
  categoryModel.image="assets/sports.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();
  
  categoryModel.CategoryName="Health";
  categoryModel.image="assets/health.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  return category;
}