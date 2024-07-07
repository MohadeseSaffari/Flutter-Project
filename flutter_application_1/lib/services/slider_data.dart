import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/slider_model.dart';

List<sliderModel> getSliders(){

  List<sliderModel> slider=[];
  sliderModel categoryModel = new sliderModel();

 categoryModel.image="assets/pic2.jpg";
 categoryModel.name="The Shahid Beheshti University basketball team will be sent to China.";
 slider.add(categoryModel);
 categoryModel = new sliderModel();

categoryModel.image="assets/pic1.jpg";
 categoryModel.name="Education Festival\nwith the aim of honoring the university's instructors...";
 slider.add(categoryModel);
 categoryModel = new sliderModel();

 categoryModel.image="assets/pic3.jpg";
 categoryModel.name="The first career fair of Beheshti University has started in both virtual and in-person sections.";
 slider.add(categoryModel);
 categoryModel = new sliderModel();

  return slider;
}