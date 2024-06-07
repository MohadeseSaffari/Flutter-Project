import 'package:flutter_application_1/model/slider_model.dart';

List<sliderModel> getSliders(){

  List<sliderModel> slider=[];
  sliderModel categoryModel = new sliderModel();

 categoryModel.image="assets/business.jpg";
 categoryModel.name="Business Buismess";
 slider.add(categoryModel);
 categoryModel = new sliderModel();

categoryModel.image="assets/sports.jpg";
 categoryModel.name="Business Buismess";
 slider.add(categoryModel);
 categoryModel = new sliderModel();

 categoryModel.image="assets/health.jpg";
 categoryModel.name="Business Buismess";
 slider.add(categoryModel);
 categoryModel = new sliderModel();

  return slider;
}