# 열거형 📟



### 열거형이란?

- 유사한 종류의 여러 값을 한곳에 모아서 정의한 것이다. ex) 요일, 월, 계절등
- enum자체가 하나의 데이터 타입으로, 카멜케이스를 사용하여 이름을 정의한다.
- 각 case는 소문자 카멜케이스로  정의한다.
- 각 case는 그 자체가 고유값이다. (각 case에 자동으로 정수값이 할당되지 않음)
- 각 case는 한줄에 개별로도, 한줄에 여러개도 정의할 수 있다.

### 정의

~~~swift
enum 이름 {
  case 이름1
  case 이름2
  case 이름3, 이름4, 이름5
  //...
}

//예제
enum Name {
  case 철수
  case 영희
  case 짱구, 이슬
}
~~~



### 사용

``` swift
enum Weekday {
    case mon
    case tue
    case wed
    case thu, fri, sat, sun
}

// 열거형 타입과 케이스를 모두 사용하여도 된다.
var day: Weekday = Weekday.mon

// 타입이 명확하다면 .케이스 처럼 표현해도 무방하다
day = .tue

print(day) //tue
```



### switch 문과 함께 사용

``` swift
enum Weekday {
    case mon
    case tue
    case wed
    case thu, fri, sat, sun
}

var day: Weekday = Weekday.mon

switch day {
case .mon, .tue, .wed, .thu:
    print("평일입니다")
case Weekday.fri:
    print("불금 파티!!")
case .sat, .sun:
    print("신나는 주말!!")
}
```

- switch의 비교값에 열거형 타입이 위치 할때 모든 열거형 케이스를 포함한다면 default를 작성할 필요가 없다.



### rawValue (원시값)

- c언어의 enum처럼 정수값을 가질 수 있다.
- rawValue는 case별로 각각 다른 값을 가져야한다.
- 자동으로 1이 증가된 값이 할당된다.
- rawValue를 반드시 지닐 필요가 없다면 굳아 만들지 않아도 된다.

``` swift
enum Fruit: Int {
    case apple = 0
    case grape = 1
    case peach
    
    // mango와 apple의 원시값이 같으므로 
    // mango 케이스의 원시값을 0으로 정의할 수 없다
//    case mango = 0 오류
}

print("Fruit.peach.rawValue == \(Fruit.peach.rawValue)")
// Fruit.peach.rawValue == 2
//peach의 값을 정해주지 않아도 2가 나온다
```



- 정수타입 뿐만 아니라, Hashable 프로토콜을 따르는 모든 타입을 원시값의 타입으로 지정할 수 있다.

``` swift
enum School: String {
    case elementary = "초등"
    case middle = "중등"
    case high = "고등"
    case university
}

print("School.middle.rawValue == \(School.middle.rawValue)")
// School.middle.rawValue == 중등

// 열거형의 원시값 타입이 String일 때, 원시값이 지정되지 않았다면
// case의 이름을 원시값으로 사용합니다
print("School.university.rawValue == \(School.university.rawValue)")
// School.middle.rawValue == university
```

- String타입에 경우 원시값이 설정되지 않았다면 case의 이름을 원시값으로 사용한다.



### 원시값을 통한 초기화

``` swift
// rawValue를 통해 초기화 한 열거형 값은 옵셔널 타입이므로 Fruit 타입이 아니다
//let apple: Fruit = Fruit(rawValue: 0)
let apple: Fruit? = Fruit(rawValue: 0)

// if let 구문을 사용하면 rawValue에 해당하는 케이스를 곧바로 사용할 수 있다.
if let orange: Fruit = Fruit(rawValue: 5) {
    print("rawValue 5에 해당하는 케이스는 \(orange)입니다")
} else {
    print("rawValue 5에 해당하는 케이스가 없습니다")
} // rawValue 5에 해당하는 케이스가 없습니다
```



### 메서드 

- swift의 열거형에는 메서드도 추가할 수 있다.

``` swift
enum Month {
    case dec, jan, feb
    case mar, apr, may
    case jun, jul, aug
    case sep, oct, nov
    
    func printMessage() {
        switch self {
        case .mar, .apr, .may:
            print("따스한 봄~")
        case .jun, .jul, .aug:
            print("여름 더워요~")
        case .sep, .oct, .nov:
            print("가을은 독서의 계절!")
        case .dec, .jan, .feb:
            print("추운 겨울입니다")
        }
    }
}

Month.mar.printMessage()
```

