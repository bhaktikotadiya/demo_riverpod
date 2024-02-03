
import 'dart:io';
import 'dart:math';

import 'package:demo_riverpod/shyari_page/data_class.dart';
import 'package:external_path/external_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class logic_page extends ChangeNotifier
{

    WidgetsToImageController control = WidgetsToImageController();
    late BuildContext context;
    int index = 0;
    bool color_status = false;  //color
    bool color_status1= false;  //gradiaent
    bool text_status=false;
    bool font_status=false;
    bool font_size=false;
    bool emoji_style=false;
    bool pos8=false;
    double text_size=10;
    int emoji_index=0;
    int pos2=0,pos3=1,font_family=0,back_color=0;
    // Color text_color=Colors.white;
    int text_color=0;

    void setContext(BuildContext context) {
        this.context = context;
    }

    fun_next()
    {
        if(index<data_class.shayari.length-1)
        {
            index++;
        }
        notifyListeners();
    }

    fun_previous()
    {
        if(index>0)
        {
            index--;
        }
        notifyListeners();
    }


    fun_background()
    {
        showModalBottomSheet(
            barrierColor: Colors.transparent,
            isDismissible: false,
            isScrollControlled: false,
            context: context,
            builder: (context) {
                return Container(
                    height: 140,
                    // color: Colors.red,
                    child: Row(crossAxisAlignment: CrossAxisAlignment.start,children: [
                        Expanded(flex: 10,
                            child: Container(
                                height: 120,
                                margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                // color: Colors.green,
                                child: GridView.builder(
                                    itemCount: data_class.color_index.length,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 10,
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10,
                                    ),
                                    itemBuilder: (context, index) {
                                        return InkWell(
                                            onTap: () {
                                                back_color = index;
                                                print(back_color);
                                                if(color_status1==true)
                                                    {
                                                        color_status1=false;
                                                    }
                                                color_status = true;
                                                notifyListeners();
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: data_class.color_index[index],
                                              ),
                                          ),
                                        );
                                    },
                                ),
                            ),
                        ),
                        InkWell(onTap: () {
                            Navigator.pop(context);
                        },
                            child: Container(
                                height: 30,width: 30,
                                decoration: BoxDecoration(color: Colors.red,shape: BoxShape.circle),
                                margin: EdgeInsets.all(10),
                                child: Icon(Icons.close,color: Colors.white),
                            ),
                        ),
                    ]),
                );
            },);
        notifyListeners();
    }

    fun_text_color()
    {
        showModalBottomSheet(
            barrierColor: Colors.transparent,
            isDismissible: false,
            isScrollControlled: false,
            context: context,
            builder: (context) {
                return Container(
                    height: 140,
                    // color: Colors.red,
                    child: Row(crossAxisAlignment: CrossAxisAlignment.start,children: [
                        Expanded(flex: 10,
                            child: Container(
                                height: 120,
                                margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                // color: Colors.green,
                                child: GridView.builder(
                                    itemCount: data_class.color_index.length,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 10,
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10,
                                    ),
                                    itemBuilder: (context, index) {
                                        return InkWell(
                                            onTap: () {
                                                text_color = index;
                                                print(text_color);
                                                text_status = true;
                                                notifyListeners();
                                            },
                                            child: Container(
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color: data_class.color_index[index],
                                                ),
                                            ),
                                        );
                                    },
                                ),
                            ),
                        ),
                        InkWell(onTap: () {
                            Navigator.pop(context);
                        },
                            child: Container(
                                height: 30,width: 30,
                                decoration: BoxDecoration(color: Colors.red,shape: BoxShape.circle),
                                margin: EdgeInsets.all(10),
                                child: Icon(Icons.close,color: Colors.white),
                            ),
                        ),
                    ]),
                );
            },);
        notifyListeners();
    }

    fun_share()
    async {
        Uint8List? bytes;
        // Share.share("${widget.pos1[widget.index]}");
        bytes = await control.capture();
        var path = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS);
        print(path);
        Directory dir=Directory(path);
        if(!await dir.exists())
        {
           dir.create();
        }
        //create image
        String img_name="${Random().nextInt(1000)}myimg.jpg";
        File file=File("${dir.path}/${img_name}");
        file.writeAsBytes(bytes!);
        Share.shareFiles(['${file.path}'],text: 'Hi this is testing');
        notifyListeners();
    }

    fun_font()
    {
        showModalBottomSheet(
            isDismissible: false,
            isScrollControlled: false,
            barrierColor: Colors.transparent,context: context,
            builder: (context)
            {
                return Container(
                height: 140,
                child: Column(children: [
                    Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                        InkWell(onTap: () {
                            Navigator.pop(context);
                        },
                            child: Container(
                                // alignment: Alignment.topRight,
                                margin: EdgeInsets.only(top: 5),
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                ),
                                child: Icon(Icons.close,color: Colors.white),
                            ),
                        ),
                    ],),
                    Expanded(
                        child: Row(children: [
                            Expanded(
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: data_class.font.length,
                                    itemBuilder: (context, index)
                                    {
                                        return InkWell(onTap: ()
                                        {
                                            font_family=index;
                                            print(font_family);
                                            font_status=true;
                                            notifyListeners();
                                        },
                                            child: Container(
                                                margin: EdgeInsets.only(top: 10,bottom: 30,left: 10),
                                                height: 20,width: 60,
                                                alignment: Alignment.center,
                                                color: Colors.pink,
                                                child: Text("शायरी",style: TextStyle(color: Colors.white,fontFamily: data_class.font[index])),),
                                        );
                                    },
                                ),
                            ),
                        ],),
                    ),
                ],)
            );
            },);
        notifyListeners();
    }

    fun_emoji()
    {
        showModalBottomSheet(
            isDismissible: false,
            isScrollControlled: false,
            barrierColor: Colors.transparent,context: context,
            builder: (context)
            {
            return Container(
                height: 200,
                color: Colors.black,
                child: InkWell(
                    child: ListView.separated(
                        padding: EdgeInsets.all(20),
                        itemCount: data_class.emoji.length,
                        itemBuilder: (context, index)
                        {
                            return InkWell(onTap: ()
                            {
                                emoji_index=index;
                                if(index==23)
                                {
                                    emoji_style=true;
                                }
                                else
                                {
                                    emoji_style=false;
                                }
                                notifyListeners();
                                Navigator.pop(context);
                            },
                                child: Container(
                                    padding: EdgeInsets.all(20),
                                    child: Text("${data_class.emoji[index]}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),alignment: Alignment.center,));
                        },
                        separatorBuilder: (context, index) {
                            return Divider(
                                color: Colors.white,
                                thickness: 2,
                                height: 10,
                            );
                        },),
                ),
            );
        },);
        notifyListeners();
    }

    fun_text_size()
    {
        showModalBottomSheet(
            isDismissible: false,
            isScrollControlled: false,
            barrierColor: Colors.transparent,
            context: context,
            builder: (context)
            {
                return Container(
                    height: 120,
                    color: Colors.black54,
                    child: Column(children: [
                        Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                            InkWell(onTap: () {
                                Navigator.pop(context);
                            },
                                child: Container(
                                    // alignment: Alignment.topRight,
                                    margin: EdgeInsets.only(top: 5),
                                    height: 30,
                                    width: 30,
                                    child: Icon(Icons.close,color: Colors.white,size: 20),
                                ),
                            ),
                        ],),
                        Row(children: [
                            Expanded(
                                child:StatefulBuilder(builder: (context, setState1) {
                                    return Slider(min: 0,max: 100,value: text_size, onChanged: (value) {
                                        text_size=value;
                                        font_size=true;
                                        notifyListeners();
                                    },);
                                },)
                            ),
                        ],)
                    ],)
                );
            },);
        notifyListeners();
    }

    gradientpage()
    {
        double Screen_height=MediaQuery.of(context).size.height;
        double Status_height=MediaQuery.of(context).padding.top;
        double AppBar_height=kToolbarHeight;
        print("Screen_height : $Screen_height");
        print("Status_height : $Status_height");
        print("AppBar_height : $AppBar_height");


        showModalBottomSheet(isScrollControlled: true,barrierColor: Colors.transparent,context: context, builder: (context)
        {
            return Container(
                height: Screen_height-Status_height-AppBar_height-5,
                child: GridView.builder(
                    itemCount: data_class.color_index.length-1,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index)
                    {
                        return InkWell(onTap: () {
                            pos2=index;
                            pos3=index+1;
                            print(pos2);
                            print(pos3);
                            if(color_status1==false)
                                {
                                    color_status1=true;
                                }
                            color_status=true;
                            text_status=true;
                            notifyListeners();
                            Navigator.pop(context);
                        },
                            child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    // color: ar[index],
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [data_class.color_index[index],data_class.color_index[index+1]],
                                    ),
                                ),
                                child: Text("Shayari",style: TextStyle(fontSize: 10,color: Colors.white),),
                                // Text("${widget.pos1[widget.index]}",style: TextStyle(fontSize: 10,color: Colors.white),),
                            ),
                        );
                    },),
            );
        },);
        notifyListeners();
    }

    colorpage()
    {
        // ind=random.nextInt(17);
        // print(ind);
        data_class.color_index.shuffle();
        color_status1=true;
        // Navigator.pop(context);
        notifyListeners();
    }
}