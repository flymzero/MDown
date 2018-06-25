import QtQuick 2.7			//ApplicationWindow
import QtQuick.Controls 2.1	//Dialog
import QtQuick.Window 2.2	//Window

ApplicationWindow {
	id: window
    
	visible: true
	width: 960
	height: 640
	//使窗体透明
	color: "#00000000"
	//去标题栏
	flags: Qt.CustomizeWindowHint 

	//圆角矩形覆盖
	Rectangle {        
		anchors.fill: parent       
		color: "#1E1E1E"        
		border.color: "#1E1E1E"       
		border.width: 2 
		radius : 8 
		clip: true    
	}

	//标题栏
	Rectangle {
        id: mainTitle                       //创建标题栏
        anchors.top: parent.top             //对标题栏定位
        anchors.left: parent.left
        anchors.right: parent.right
        height: 22                          //设置标题栏高度
        color: "#00000000"                    //设置标题栏背景颜色
		//鼠标响应
        MouseArea {
			anchors.fill: parent
			property int mx: 0
			property int my: 0
			onPressed: {
				mx=mouseX
				my=mouseY
			}
			onPositionChanged: {
				window.x+=mouseX-mx
				window.y+=mouseY-my
			}
		}

		//
		Button {   //关闭按钮
            id: closeButtonDialog;
            width: 20;
            height: 20;
            anchors.right: parent.right;
            anchors.verticalCenter: parent.verticalCenter;
            anchors.rightMargin: 2;

             normalPath: "qrc:/602.png";
             enterPath: "qrc:/602.png";
             pressPath: "qrc:/602.png";

            //onButtonClick: usrMngWnd.destroy();
        }
    }  

    
		

    

	Column {
		anchors.centerIn: parent

		TextField {
			id: input
	
			anchors.horizontalCenter: parent.horizontalCenter
			placeholderText: "Write something ..."
		}

		Button {
			anchors.horizontalCenter: parent.horizontalCenter
			text: "and click me!"
			onClicked: dialog.open()
		}
	}

	Dialog {
		id: dialog
		x: (window.width - width) * 0.5
		y: (window.height - height) * 0.5

		contentWidth: window.width * 0.5
		contentHeight: window.height * 0.25
		standardButtons: Dialog.Ok

		contentItem: Label {
			text: input.text
		}
	}
}