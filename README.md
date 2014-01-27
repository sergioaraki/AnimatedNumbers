AnimatedNumbers
===============

Animated numbers in Cascades

This example is based in countUp.js (https://github.com/inorganik/countUp.js) that can be used to quickly create animations that display numerical data in a more interesting way.

You can import this example in Momentics and run to see the demo.

If you want to add this animation to your project, you need to copy the folder webview that is inside assets and AnimatedValue.qml

Then in your qml just use:

```js
AnimatedValue {
            id: anim
            //from value (double)
            fromValue: 0
            //to value (double)
            toValue: 3.141592653589793
            //animation time in seconds (double)
            animTime: 3.5
        }
```

And you can stop:

```js
	anim.stop();
```

reset:

```js
	anim.reset();
```

start:

```js
	anim.start();
```
start with callback:

```js
	anim.endMessage = "This is π";
	anim.startWithCallback();
```