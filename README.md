# simple_popup
简单易用的flutter底部弹窗


## Screenshot
![Screenshot](./screen_shot.gif)


## Usage

	simple_popup: 1.0.0
	
	import 'package:simple_popup/simple_popup.dart';
	
	Popup.show(context: context, 
					child: Container(
            height: 400,
            color: Colors.red,
            child: Center(
            child: FlatButton(child: Text('Hide'), color: Colors.lightGreen, onPressed: (){
                Popup.dismiss();
              },),
            ),
          ));
