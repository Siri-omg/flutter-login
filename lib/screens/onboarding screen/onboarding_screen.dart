import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_something_new/screens/authentication/welcome%20screen/welcome.dart';

import 'swiper_pagination.dart';
class Onboarding_Screen extends StatefulWidget {
  const Onboarding_Screen({Key? key}) : super(key: key);

  @override
  _Onboarding_ScreenState createState() => _Onboarding_ScreenState();
}

class _Onboarding_ScreenState extends State<Onboarding_Screen> {
  final SwiperController _swiperController=SwiperController();
  final int _pageCount=3;
  int _currentIndex=0;
  final List <String> titles=[
    "Learn new painting styles and see others when they post. ",
    "Add photos create your memories ",
    "get updated when somebody looks at your post"
  ];
  final List <String> images=[
    "https://image.freepik.com/free-vector/making-art-concept-illustration_114360-2755.jpg",
    "https://image.freepik.com/free-vector/collage-concept-with-tree_23-2147885073.jpg",
    "https://image.freepik.com/free-vector/vector-illustration-mehndi-ornament-traditional-indian-style-ornamental-floral-elements-henna-tattoo-stickers-mehndi-yoga-design-cards-prints-abstract-floral-vector-illustration_1217-468.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            color: Color(0Xff03fff7),
            child: Image.network("https://www.colorhexa.com/03fff7.png"),
        ),
          Column(
            children: [
              Expanded(child: Swiper(
                index:_currentIndex,
                controller: _swiperController,
                itemCount: _pageCount,
                onIndexChanged: (index){
                  setState(() {
                    _currentIndex=index;
                  });
                },
                loop:false,
                itemBuilder: (context,index){
                  return _buildPage(title:titles[index],image:images[index]);
                },
                pagination: SwiperPagination(
                  builder: CustomPaginationBuilder(
                    activeSize:Size(10.0,20.0),
                    size:Size(10.0,15.0),
                    color:Colors.grey
                  )
                ),

              )),
              SizedBox(height:10.0),
              _buildButtons(),
            ],
          )
        ]

      ),
    );
  }
  Widget _buildButtons() {
    return Container(
        margin: const EdgeInsets.only(right: 16.0, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
        FlatButton(
        textColor: Colors.grey.shade700,
          child: Text("Skip"),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
          },
        ),
        IconButton(
          icon: Icon(
            _currentIndex < _pageCount - 1
                ? FontAwesomeIcons.arrowCircleRight
                : FontAwesomeIcons.checkCircle,
            size: 40,
          ),
          onPressed: () async {
            if (_currentIndex < _pageCount - 1)
              _swiperController.next();
            else {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
            }
          },
        )
          ],
        ),
    );
  }
  Widget _buildPage({required String title, required String image}) {
    final TextStyle titleStyle =
    TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0);
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.all(50.0),
    padding: const EdgeInsets.all(16.0),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0),
        image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
            colorFilter:
            ColorFilter.mode(Colors.black38, BlendMode.multiply)),
        boxShadow: [
          BoxShadow(
              blurRadius: 10.0,
              spreadRadius: 5.0,
              offset: Offset(5.0, 5.0),
              color: Colors.black26)
        ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            title,
            textAlign: TextAlign.center,
            style: titleStyle.copyWith(color: Colors.white),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
