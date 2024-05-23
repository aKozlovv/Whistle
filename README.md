# Whistle
## Declarative way to write Swift animations
![Frame 2](https://github.com/aKozlovv/Whistle/assets/154222268/96a35f50-4c32-48dd-bc1d-c088b251213e)

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

Lightweight package for working with UIView.animate. It helps to reduce nested callbacks and boilerplate code.
Example:

```sh
view.animate([
    .fadeIn(),
    .resize(to:CGSize(width: 200, height: 300))
])
```
or
```sh
animate([
    label.animate([
        .fadeIn()
    ]),
    container.animate([
        .resize(to: UIScreen.main.bounds.size)
    ]),
    button.animate([
        .fadeIn()
    ])
])
```

## Features

- Serial or parallel animations
- Global function for chaining
- Easy to extend

## Usage

Just install package via Swift Package Manager and you will able to call "animate" method on every view.
```sh
view.animate([
    .fadeIn(),
    .resize(to:CGSize(width: 200, height: 300))
])
```
For more pre-made animations you can just extend "Animation" class. Just like this:
```sh
public extension Animation {
    static func fadeIn(duration: TimeInterval = 0.3) -> Animation {
        Animation(duration: duration, closure: { $0.alpha = 1 })
    }
}

public extension Animation {
    static func resize(to size: CGSize, duration: TimeInterval = 0.3) -> Animation {
        Animation(duration: duration, closure: { $0.bounds.size = size })
    }
}
```
