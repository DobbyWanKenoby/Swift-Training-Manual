# SwiftUI

## Содержимое

- Описание
- UI-элементы
	- Стеки
		- `VStack` - вертикальный стек
		- `HStack` - горизонтальный стек
		- `ZStack` - стек в глубину
		- Модификаторы стеков
	- Текст
		- `Text` - текстовая надпись
		- Модификаторы текстовых `View`
	- Изображения и SF Symbols
		- `Image` - изображение
		- Модификаторы изображений и символов
	- Фигуры
		- `Circle` - фигура "круг"
		- `Ellipse` - фигура "эллипс"
		- `Capsule` - фигура "капсула"
		- `Rectangle` - фигура "прямоугольник"
		- `RoundedRectangle` - фигура "прямоугольник со скругелнными углами"
		- Модификаторы фигур
- Общие модификаторы UI-элементов
	- Размеры
	- Наложения и подложки
	- Отступы
	- Углы
	- Цвета и градиенты
	- Тень

## Описание

SwiftUI - это фреймворк, предоставляющий функции декларативного создания интерфейса приложений. В данной статье рассмотрены основные UI-элементы и модификаторы, доступные в SwiftUI.

## UI-элементы

### Стек

#### `VStack` - вертикальный стек

Группирует элементы в вертикальный стек.

```swift
VStack {
    Rectangle()
        .fill(.red)
        .frame(width: 120, height: 120)
    Rectangle()
        .fill(.green)
        .frame(width: 110, height: 110)
}
```

При создании стека можно указать выравнивание и расстояние между элементами.

```swift
VStack(alignment: .center, spacing: 50) {
    Rectangle()
        .fill(.red)
        .frame(width: 120, height: 120)
    Rectangle()
        .fill(.green)
        .frame(width: 110, height: 110)
    Rectangle()
        .fill(.orange)
        .frame(width: 100, height: 100)
}
```

#### `HStack` - горизонтальный стек

Группирует элементы в горизонтальный стек.

```swift
HStack {
    Rectangle()
        .fill(.red)
        .frame(width: 120, height: 120)
    Rectangle()
        .fill(.green)
        .frame(width: 110, height: 110)
}
```

При создании стека можно указать выравнивание и расстояние между элементами.

```swift
HStack(alignment: .center, spacing: 50) {
    Rectangle()
        .fill(.red)
        .frame(width: 120, height: 120)
    Rectangle()
        .fill(.green)
        .frame(width: 110, height: 110)
    Rectangle()
        .fill(.orange)
        .frame(width: 100, height: 100)
}
```

#### `ZStack` - стек в глубину

Группирует элементы в стек по оси Z (в глубину).

```swift
ZStack {
    Rectangle()
        .fill(.red)
        .frame(width: 120, height: 120)
    Rectangle()
        .fill(.green)
        .frame(width: 110, height: 110)
}
```

При создании стека можно указать выравнивание элементов.

> Для `ZStack` нельзя указать расстояние между элементами (параметр `spacing`)

```swift
ZStack(alignment: .center) {
    Rectangle()
        .fill(.red)
        .frame(width: 120, height: 120)
    Rectangle()
        .fill(.green)
        .frame(width: 110, height: 110)
    Rectangle()
        .fill(.orange)
        .frame(width: 100, height: 100)
}
```

#### Модификаторы стеков

### Текст

#### `Text` - текстовая надпись

Добавляет текстовую надпись.

```swift
Text("Hello, world!")
```

#### Модификаторы текстовых `View`

##### `font` - используемый шрифт

```swift
// Системный шрифт body
Text("Hello, world")
    .font(.body)
    
// Системный шрифт с измененным размером
Text("Hello, world")
    .font(.system(size: 25))
    
// Системный моноширный шрифт с размером 23 и уменьшенной насыщенной
Text("Hello, world")
    .font(.system(size: 23, weight: .light, design: .monospaced))
```

##### `fontWeight` - насыщенность текст

```swift
// Текущий шрифт с максимально насыщенностью 
Text("Hello, world")
    .fontWeight(.heavy)
```

##### `bold` - толстый текст

```swift
Text("Hello, world")
     .bold()
```

##### `underline` - подчеркнутый текст

```swift
// Подчеркнутые текст
Text("Hello, world")
     .underline()
     
// Подчеркивание красного цвета
Text("Hello, world")
	.underline(color: .red)
```

Первый аргумент функции `underline` называется `active`, по умолчанию имеет значение ``true и определяет активность подчеркивания.

```swift
// Подчеркивание не активно
Text("Hello, world")
	.underline(false, color: .red)
```

##### `italic` - курсивный текст

```swift
Text("Hello, world")
     .underline()
```

##### `strikethrough` - зачеркнутый текст

```swift
Text("Hello, world")
     . strikethrough()
     
// Зачеркивание зеленого цвета
Text("Hello, world")
	.strikethrough(color: .green)
```

Первый аргумент функции `strikethrough ` называется `active`, по умолчанию имеет значение ``true и определяет активность подчеркивания.

```swift
// Зачеркивание не активно
Text("Hello, world")
	. strikethrough(false, color: .red)
```

##### `foregroundColor` - цвет текста

```swift
// Текст красного цвета
Text("Hello, world")
    .foregroundColor(.red)
```

##### `baselineOffset ` - межстрочный интервал

```swift
Text("Hello, world")
    .baselineOffset(20)
```

##### `kerning ` - межбуквенный интервал

```swift
Text("Hello, world")
    .kerning(20)
```

##### `multilineTextAlignment` - выравнивание многострочного текстового содержимого

```swift
// Выравнивание по правому краю
Text("Hello, world")
    .multilineTextAlignment(.trailing)
```

### Изображения и символы

#### `Image` - изображение

Добавляет текстовую надпись.

```swift
// SF Symbol "закрашенное сердце" с увеличенным размером и цветом
Image(systemName: "heart.fill")
	.font(.title)
	.foregroundColor(.green)
	
// Символ увеливающий под размеры frame
Image(systemName: "heart.fill")
	.resizable()
	.frame(width: 300, height: 300)
```

#### Модификаторы изображений и символов

##### `renderingMode` - способ рендеринга изображения

Определяет логику заполнения изображения цветом. Используется как для SF Symbols, так и для png-изображений в прозрачным фоном. 

Позволяет указать один из следующий типов рендеринга:

- `original` - изображение рендерится в оригинальном виде. Для SF Symbol это значит, что некоторые закрашенные в конкретный цвет элементы символа не будут изменять свой цвет с помощью `foregroundColor`
- `template` - все непрозрачные участки изображения будут закрашены черным и у вас появляется возможность изменить этот цвет на любой требуемый.

```swift
// Возможность изменения цвета только определенной части символа
Image(systemName: "person.badge.plus")
	.renderingMode(.original)

// Возможность изменения цвета всего символа
Image(systemName: "person.badge.plus")
	.renderingMode(.template)
	.foregroundColor(.red)
	
// Заполнение всех непрозрачных пикселей изображения зеленым
Image("somePNGImage")
	.renderingMode(.template)
	.foregroundColor(.green)
```


### Фигуры

#### `Circle` - фигура "круг"

```swift
Circle()

// Круг с определенными размерами
Circle()
    .frame(width: 200, height: 100)
```

#### `Ellipse` - фигура "эллипс"

```swift
// Элипс на всю площадь View
Ellipse()

// Элипс определенных размеров
Ellipse()
    .frame(width: 200, height: 100)
```

#### `Capsule` - фигура "капсула"

Данная фигура является промежуточным вариантом между элипсом и прямоугольником со скругленными углами.

```swift
// Капсула на всю площадь View
Capsule()

// Капсула с определенным стилем скругелния углов и размером
Capsule(style: .continuous)
    .frame(width: 200, height: 100)
```

#### `Rectangle` - фигура "прямоугольник"

```swift
Rectangle()

// Прямоугольник с определенными размерами
 Rectangle()
    .frame(width: 200, height: 100)
```

#### `RoundedRectangle ` - фигура "прямоугольник"

```swift
// Прямоугольник с радиусом скругления углов 10
RoundedRectangle(cornerRadius: 10)

// Прямоугольник с различным скруглением по осям X и Y
RoundedRectangle(cornerSize: CGSize(width: 50, height: 30))

// Прямоугольник с радиусом скругления углов 50 и определенным стилем и размером
RoundedRectangle(cornerRadius: 50, style: .continuous)
	.frame(width: 200, height: 100)
```

#### Модификаторы фигур

##### `fill` - заливка фигуры определенным цветом

```swift
// Синий круг
Circle()
	.fill(.blue)
```

> Фигура так же может быть залита с помощью функции `foregroundColor`.

##### `stroke` - обводка фигуры

Данная функция возхвращает новую фигуру, которая вялется обведенной исходной фигурой. То есть новая фигура состоит только рамки (обводки).

```swift
Circle()
	.stroke()
	
// Фигура-обводка с толщиной линии 30
Circle()
    .stroke(lineWidth: 30)
    
// Фигура-обводка с настроенным стилем
Circle()
    .stroke(.orange, style: StrokeStyle(lineWidth: 20, lineCap: .butt, lineJoin: .round, miterLimit: 5, dash: [10], dashPhase: 5))
```

##### `trim` - обрезка фигуры

```swift
// Половина фигуры 
Circle()
	.trim(from: 0.5, to: 1)
```


## Общие модификаторы UI-элементов

### Порядок использования модификаторов

Обратите внимание, что порядок модификаторов важен, каждый следующий модификатор накладывается на предыдущий. Вот несколько примеров.

#### Пример 1

Данный вариант валиден и может быть использован:

```swift
Text("Hello World! Я рад изучать Swift вместе в этой прекрасной среде разработки Xcode")
	  // Корректно
    .baselineOffset(20)
    .multilineTextAlignment(.leading)
```

Но поменять модификаторы местами невозможно:

```swift
Text("Hello World! Я рад изучать Swift вместе в этой прекрасной среде разработки Xcode")
	  // Не корректно
    .multilineTextAlignment(.leading)
    .baselineOffset(20)
```

#### Пример 2

Совместное использование `padding` и `frame` дадут разный результат в зависимости от порядка.

```swift
// Итоговый размер View - 250
Text("Hello World!")
    .frame(width: 200, height: 100, alignment: .trailing)
    .padding(50)

// Итоговый размер View - 200
Text("Hello World!")
    .padding(20)
    .frame(width: 200, height: 100, alignment: .trailing)
```

### Работа с размерами

#### `frame` - размер элемента

```swift
// Текстовая надпись шириной 100 точек
Text("Hello, world")
    .frame(width: 100.0)
    
// Текстовая надпись шириной 100 точек и высотой 50 точек
Text("Hello, world")
	.frame(width: 100.0, height: 50.0)	
```

#### `resizable` - изменение размера изображения под размеры `frame`

```swift
// Символ увеливающий под размеры frame
Image(systemName: "heart.fill")
	.resizable()
	.frame(width: 300, height: 300)
```

#### `clipped` - обрезка `View` при выходе за `frame`

```swift
Image(systemName: "heart.fill")
	.resizable()
	.scaledToFill()
	.frame(width: 300, height: 400)
	.clipped()
```

#### `clipShape` - обрезка `View` при в соответствии с некоторой фигурой

```swift
Image("therock")
	.resizable()
	.scaledToFill()
	.frame(width: 200, height: 200)
	//.cornerRadius(20)
	.clipShape(Circle())
```

#### `aspectRatio` - логика заполнения доступного пространства

```swift
// Изображение не выходит за рамки frame
Image(systemName: "heart.fill")
	.resizable()
	.aspectRatio(contentMode: .fit)
	.frame(width: 300, height: 400)
```

> Вместо `aspectRatio` можно использовать функции `.scaledToFill()` и `.scaledToFit()`.

#### `minimumScaleFactor` - минимальный коэффициент изменения размера текста

Опреляет то, насколько может уменьшиться размер шрифта, чтобы попытаться вместиться в размер View.

```swift
// Размер текста может быть уменьшен на до 10% от первоначального
Text("Hello World! Я рад изучать Swift вместе в этой прекрасной среде разработки Xcode")
    .frame(width: 100, height: 100, alignment: .trailing)
    .minimumScaleFactor(0.1)
```

### Наложения и подложки

#### `overlay` - накладывает `View` сверху на текущее `View`

```swift
Circle()
	.fill(.red)
	.frame(width: 100, height: 100)
	.overlay(
	    Circle()
	        .fill(.blue)
	        .frame(width: 30, height: 30)
	)
```

Так же `overlay` может принимать значение `alignment` для выравнивания накладываемого элемента.

```swift
Circle()
	.fill(.red)
	.frame(width: 100, height: 100)
	.overlay(
	    Circle()
	        .fill(.blue)
	        .frame(width: 30, height: 30)
	     
		, alignment: .bottomTrailing
	)
```

#### `background` - подкладывает `View` под текущее `View`

```swift
Image(systemName: "heart.fill")
    .foregroundColor(.white)
    .font(.system(size: 40))
    .background(
        Circle()
    )
```

Так же `background ` может принимать значение `alignment` для выравнивания накладываемого элемента.

```swift
Rectangle()
    .frame(width: 100, height: 100)
    .background(
        Circle()
            .fill(.red)
            .frame(width: 150, height: 150)
        , alignment: .top
    )
```

### Отступы

#### `padding` - внутренние отступы

```swift
// Дефолтные отступы
Text("Hello, world!")
	.padding()

// Определенные одинаковые отступы со всех сторон
Text("Hello, world!")
	.padding(32)

// Определенные отступы для каждой из сторон
Text("Hello, world!")
	.padding(EdgeInsets(top: 20, leading: 10, bottom: 30, trailing: 2))
```


### Углы

#### `cornerRadius` - скругление углов

```swift
Image("someImage")
	.resizable()
	.scaledToFill()
	.frame(width: 200, height: 200)
	.cornerRadius(100)
```

### Цвета

#### `foregroundColor` - изменение основного цвета

```swift
// Синий круг
Circle()
	.foregroundColor(.blue)
	
// Зеленый текст
Text("Hello!")
	.foregroundColor(.green)
```

#### `background` - наложение фона

С помощью `background` в качестве фона может быть наложен не только `View`, но и некоторый цвет.

```swift
Text("Hello, World!")
	.background(.red)
```

### Тень

#### `shadow` - создание тени

```swift
// Текст с тенью
Text("Hello, world!")
	.shadow(color: .red, radius: 20, x: 0, y: 0)
	
// Фигура с тенью
RoundedRectangle(cornerRadius: 25)
    .frame(width: 300, height: 200)
    .shadow(color: .black, radius: 20, x: 0, y: 0)
```


```swift

```

```swift
Text("Hello, world!")
```



