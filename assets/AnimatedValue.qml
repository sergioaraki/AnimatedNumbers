import bb.cascades 1.0
import bb.system 1.0

Container {
    //default from value 0
    property double fromValue: 0
    //default to value 0
    property double toValue: 0
    //default animation time 2 seconds
    property double animTime: 2
    //default message on animation ended using callback
    property string endMessage: "Animation Ended"
    function start(){
        webview.postMessage('value;'+fromValue+';'+toValue+';'+animTime);
    }
    function startWithCallback(){
        webview.postMessage('value;'+fromValue+';'+toValue+';'+animTime+';callback');
    }
    function reset(){
        webview.postMessage('reset');
    }
    function stop(){
        webview.postMessage('stop');
    }
    WebView {
        id: webview
        settings.background: Color.Transparent
        url: "local:///assets/webview/animation.html"
        onMessageReceived: {
            if(message.data === "ready"){
                var style;
                switch(Application.themeSupport.theme.colorTheme.style) {
                    case VisualStyle.Bright:    style = 0;break;
                    case VisualStyle.Dark:      style = 1;break;
                }
                //setting style in html
                postMessage("style;"+style);
                //the following line could be commented and trigger the animation after
                postMessage('value;'+fromValue+';'+toValue+';'+animTime); 
            }
            else if (message.data === "animationEnded"){
                toast.body = endMessage;
                toast.show();
            }
        }
    }
    onToValueChanged: {
        //You can trigger animation when toValue is changed
        //webview.postMessage('value;'+fromValue+';'+toValue+';'+animTime);
    }
    onFromValueChanged: {
        //You can trigger animation when fromValue is changed
        //webview.postMessage('value;'+fromValue+';'+toValue+';'+animTime);
    }
    attachedObjects: [
        SystemToast {
            id: toast
        }
    ]
}
