import bb.cascades 1.0

Page {
    Container {
        topPadding: 20
        leftPadding: 20
        rightPadding: 20
        layout: StackLayout {
        }
        AnimatedValue {
            id: anim
            //from value (double)
            fromValue: 0
            //to value (double)
            toValue: 3.141592653589793
            //animation time in seconds (double)
            animTime: 3.5
        }
        Button {
            text: "Reset"
            onClicked: {
                //reset value to fromValue
                anim.reset();
            }
        }
        Button {
            text: "Stop"
            onClicked: {
                //stop running animation
                anim.stop();
            }
        }
        Button {
            text: "Start"
            onClicked: {
                //start animation
                anim.start();
            }
        }
        Button {
            text: "Start with Callback"
            onClicked: {
                //start animation with callback
                //message to show on toast at animation ended
                anim.endMessage = "This is π";
                anim.startWithCallback();
            }
        }
        Button {
            text: "Invert"
            onClicked: {
                //invert fromValue and toValue and start animation
                var aux = anim.fromValue;
                anim.fromValue = anim.toValue;
                anim.toValue = aux;
                anim.start();
            }
        }
    }
}
