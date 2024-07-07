// import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_application_1/model/article_model.dart';
import 'package:flutter_application_1/model/category_model.dart';
import 'package:flutter_application_1/model/slider_model.dart';
import 'package:flutter_application_1/services/data.dart';
// import 'package:flutter_application_1/services/onlinenew.dart';
import 'package:flutter_application_1/services/slider_data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

List<CategoryModel> categories = [];
List<sliderModel> sliders = [];
// List<ArticleModel> articles = [];
// bool _loading = true;
int activeIndex=0;
void initState(){
  categories = getCategories();
  sliders = getSliders();
  // getNews();
  super.initState();
}

// getNews()async{
//   OnlineNews newsclass = OnlineNews();
//   await newsclass.getNews();
//   articles = newsclass.news;
//   setState(() {
//     _loading = false;
//   });
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("SHINE"),Text("News",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),],
      ),
      centerTitle: true,
      elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              height: 60,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,itemBuilder: (context, index){
              return CategoryTitle(image: categories[index].image,CategoryName: categories[index].CategoryName,);
            }),),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Breaking News!",style: TextStyle(
                    color: Colors.black,fontWeight: FontWeight.w500,fontSize: 25),),
                  Text("View All",style: TextStyle(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.w500),),
                ],
              ),
            ),
            SizedBox(height: 20,),
            CarouselSlider.builder(itemCount: sliders.length, itemBuilder: (context,index,realIndex){
              String? res = sliders[index].image;
              String? res1 = sliders[index].name;
              return buildImage(res!, index, res1!);
            }, options: CarouselOptions(
              height: 250,autoPlay: true,enlargeCenterPage: true,enlargeStrategy: CenterPageEnlargeStrategy.height,
              onPageChanged: (index,reason){
                setState(() {
                  activeIndex = index;
                });
              }
              )
              ),
              SizedBox(height: 30,),
              Center(child: buildIndicator()),
              //Trending News:
              SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Trending News!",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                  Text("View All",style: TextStyle(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.w500),),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child:ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset("assets/pic6.jpg",height: 150,width: 150,fit: BoxFit.cover,))
                  ),
                  SizedBox(width: 8,),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width/2,
                        child: Text("Google Joins AI Laptop Party With Chromebook Plus:",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w500),)),
                      Container(
                        width: MediaQuery.of(context).size.width/2,
                        child: Text("Google announced on Tuesday that it’s joining the AI laptop.",style: TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.w500),)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child:ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset("assets/pic5.jpg",height: 150,width: 150,fit: BoxFit.cover,))
                  ),
                  SizedBox(width: 8,),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width/2,
                        child: Text("Rethinking AI Priorities: Lessons From IBM Think and Intel’s Lunar Lake",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w500),)),
                      Container(
                        width: MediaQuery.of(context).size.width/2,
                        child: Text("I watched IBM Think last week.",style: TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.w500),)),
                    ],
                  ),
                ],
              ),
            ),
            // SizedBox(height: 10,),
            // Container(
            //   child: ListView.builder(
            //     shrinkWrap: true,
            //     physics: ClampingScrollPhysics(),
            //     itemCount: articles.length, itemBuilder: (context,index){
            //     return BlogTitle(decs: articles[index].description!, imageUrl: articles[index].urlToImage!, title: articles[index].title!);
            //   }),
            // )
          ],),
        ),
      ),
    );
  }
  Widget buildImage(String image,int index,String name)=>Container(
    margin: EdgeInsets.symmetric(horizontal: 5),
    child: Stack(
      children: [
        ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(image,height: 250, fit: BoxFit.cover,width: MediaQuery.of(context).size.width,)),
        Container(
          height: 250,
          padding: EdgeInsets.only(left: 10),
          margin: EdgeInsets.only(top: 170),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.black26,borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))),
          child: Text(name,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
        )
      ],
    ),
  );
  Widget buildIndicator()=> AnimatedSmoothIndicator(activeIndex: activeIndex, count: sliders.length,effect: const WormEffect(
                  dotHeight: 16,
                  dotWidth: 16,
                  type: WormType.thinUnderground,
                ),);
}

class CategoryTitle extends StatelessWidget {
  final image,CategoryName;

  const CategoryTitle({this.CategoryName,this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.asset(image,width: 120,height: 60,fit: BoxFit.cover,)),
          Container(
            width: 120,
            height: 70,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),color: Colors.black38,),
            child: Center(child: Text(CategoryName,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)),
          )
      ],),
    );
  } 
}
// ignore: must_be_immutable
// class BlogTitle extends StatelessWidget {
//   String imageUrl,title,decs;
//   BlogTitle({required this.decs,required this.imageUrl,required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return  InkWell(
//       child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       child:ClipRRect(
//                         borderRadius: BorderRadius.circular(20),
//                         child: CachedNetworkImage(imageUrl: imageUrl,height: 150,width: 150,fit: BoxFit.cover,))
//                     ),
//                     SizedBox(width: 8,),
//                     Column(
//                       children: [
//                         Container(
//                           width: MediaQuery.of(context).size.width/2,
//                           child: Text(title,style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w500),)),
//                         Container(
//                           width: MediaQuery.of(context).size.width/2,
//                           child: Text(decs,style: TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.w500),)),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//     );
//   }
// }