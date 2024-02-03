import 'package:demo_riverpod/shyari_page/all_provider_fun.dart';
import 'package:demo_riverpod/shyari_page/data_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

void main()
{
      runApp(ProviderScope(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
            home: four_page()),
      ));
}
class four_page extends ConsumerStatefulWidget
{
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => four_pageState();
}
class four_pageState extends ConsumerState<four_page>
{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_permission();
  }

    get_permission()
    async {
      var status = await Permission.storage.status;
      if(status.isDenied)
      {
        Map<Permission, PermissionStatus> statuses = await [
          Permission.location,
          Permission.storage,
        ].request();
        print(statuses[Permission.location]);
      }
    }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final c = ref.watch(next);
    // WidgetsToImageController control = WidgetsToImageController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("SHAYARI"),
          backgroundColor: Colors.green,
        ),
        body: Column(children: [
          Expanded(flex: 8,
            child: WidgetsToImage(
              controller: c.control,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                // (color_status==true)?Colors.red:ar[pos5],
                decoration: BoxDecoration(
                  color: (c.color_status==false)?Colors.red.shade400:data_class.color_index[c.back_color],
                  gradient: (c.color_status1==true)?LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [data_class.color_index[c.pos2],data_class.color_index[c.pos3]],):LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    // colors: [Colors.red,Colors.red],
                    colors: [data_class.color_index[c.back_color],data_class.color_index[c.back_color]],
                  ),
                ),
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(30, 20, 30, 50),
                child: (c.emoji_style==false)?SingleChildScrollView(
                  child: Text("${data_class.emoji[c.emoji_index]}\n${data_class.shayari[c.index]}\n${data_class.emoji[c.emoji_index]}",style: TextStyle(
                      fontSize: (c.font_size==false)?15:c.text_size,
                      color: (c.text_status==false)?Colors.white:data_class.color_index[c.text_color],
                      fontFamily: (c.font_status==false)?"one":data_class.font[c.font_family],
                      // fontFamily: "one",
                  )),
                ):SingleChildScrollView(
                  child: Text("${data_class.shayari[c.index]}",style: TextStyle(
                    fontSize: (c.font_size==false)?15:c.text_size,
                    color: (c.text_status==false)?Colors.white:data_class.color_index[c.text_color],
                    fontFamily: (c.font_status==false)?"one":data_class.font[c.font_family],
                    // fontFamily: "one",
                  )),
                ),
              ),
            ),
          ),
          // Spacer(flex:,)
          Expanded(
              flex: 2,
              child: Container(
                height: 200,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                  InkWell(onTap: () {
                    c.fun_previous();
                  },
                    child: Container(
                      width: 50,height: 50,
                      color: Colors.orange,
                      child: Icon(Icons.skip_previous,size: 40),
                    ),
                  ),
                  InkWell(onTap: () {
                      c.fun_next();
                  },
                    child: Container(
                      width: 50,height: 50,
                      color: Colors.orange,
                      child: Icon(Icons.skip_next,size: 40),
                    ),
                  )
                ],)
              ),
          ),
          Expanded(flex: 3,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black,
              child: Column(children: [
                SizedBox(height: 5,),
                Center(
                  child: Container(
                    width: 130,
                    height: 50,
                    color: Colors.white,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            c.setContext(context);
                            c.colorpage();
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                // color: Colors.red,
                              image: DecorationImage(image: AssetImage("img/img_1.png")),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            c.setContext(context);
                            c.gradientpage();
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              // color: Colors.red,
                              image: DecorationImage(image: AssetImage("img/img.png")),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Expanded(
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                    InkWell(
                      onTap: (){
                          c.setContext(context);
                          c.fun_background();
                      },
                      child: Container(
                        width: 120,
                        height: 40,
                        color: Colors.red.shade900,
                        alignment: Alignment.center,
                        child: Text("Background",style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        c.setContext(context);
                        c.fun_text_color();
                      },
                      child: Container(
                        width: 120,
                        height: 40,
                        color: Colors.red.shade900,
                        alignment: Alignment.center,
                        child: Text("Text color",style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        c.setContext(context);
                        c.fun_share();
                      },
                      child: Container(
                        width: 120,
                        height: 40,
                        color: Colors.red.shade900,
                        alignment: Alignment.center,
                        child: Text("Share",style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],),
                ),
                SizedBox(height: 5,),
                Expanded(
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                    InkWell(
                      onTap: () {
                        c.setContext(context);
                        c.fun_font();
                      },
                      child: Container(
                        width: 120,
                        height: 40,
                        color: Colors.red.shade900,
                        alignment: Alignment.center,
                        child: Text("Font",style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        c.setContext(context);
                        c.fun_emoji();
                      },
                      child: Container(
                        width: 120,
                        height: 40,
                        color: Colors.red.shade900,
                        alignment: Alignment.center,
                        child: Text("Emoji",style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        c.setContext(context);
                        c.fun_text_size();
                      },
                      child: Container(
                        width: 120,
                        height: 40,
                        color: Colors.red.shade900,
                        alignment: Alignment.center,
                        child: Text("Text Size",style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],),
                ),
                SizedBox(height: 5,),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}