# extension ⛑



### 익스텐션이란?

- **익스텐션(Extension)**은 스위프트의 강력한 기능중 하나이다.
- 익스텐션은 **구조체, 클래스, 열거형, 프로토콜 타입에 새로운 기능을 추가** 할 수 있는 기능이다.
- 기능을 추가하려는 타입의 구현된 소스 코드를 알지 못하거나 볼 수 없다 해도, **타입**만 알고 있다면 그 타입의 기능을 확장할 수도 있다.



### 추가 가능한 기능들

- 연산 타입 프로퍼티 / 연산 인스턴스 프로퍼티
- 타입 메서드 / 인스턴스 메서드
- 이니셜라이저
- 서브스크립트
- 중첩 타입
- 특정 프로토콜을 준수할 수 있도록 기능 추가

⚠️ 익스텐션은 타입에 새로운 기능을 추가할 수는 있지만, 기존에 존재하는 기능을 재정의 할수는 없다.



### 클래스의 상속과 익스텐션 비교

|            |    상속     |                   익스텐션                    |
| ---------- | :---------: | :-------------------------------------------: |
| **확장**   |  수직 확장  |                   수평 확장                   |
| **사용**   | 클래스 타입 | 클래스, 구조체, 프로토콜, 제네릭 등 모든 타입 |
| **재정의** |    가능     |                    불가능                     |



### 정의

- **extension** 키워드를 사용하여 정의한다.

``` swift
extension 확장할 타입 이름 {
  //타입에 추가될 새로운 기능 구현
}
```

- 익스텐션은 기존에 존재하는 타입이 추가적으로 다른 프로토콜을 채택할 수 있도록 확장할 수도 있다. 이런 경우에는 클래스나 구조체에서 사용하던 것과  똑같은 방법으로 프로토콜 이름을 나열해준다.

``` swift
extension 확장할 타입 이름: 프로토콜1, 프로토콜2... {
  //프로토콜 요구사항 구현
}
```



### 구현

[ 연산 프로퍼티 추가 ]

- 아래 익스텐션은 Int 타입에 두개의 연산 프로퍼티를 추가한 것이다.
- Int 타입의 인스턴스가 홀수인지 짝수인지 판별하여 Bool 타입으로 알려주는 연산 프로퍼티 이다.
- 익스텐션으로 Int 타입에 추가해준 연산 프로퍼티는 Int 타입의 어떤 인스턴스에도 사용이 가능하다.
- 인스턴스 연산 프로퍼티를 추가할 수도 있으며, static 키워드를 사용해 타입 연산 프로퍼티도 추가할 수 있다.

```swift
extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
    var isOdd: Bool {
        return self % 2 == 1
    }
}

print(1.isEven) // false
print(2.isEven) // true
print(1.isOdd)  // true
print(2.isOdd)  // false

var number: Int = 3
print(number.isEven) // false
print(number.isOdd) // true

number = 2
print(number.isEven) // true
print(number.isOdd) // false
```



[ 매서드 추가 ]

- 메서드 익스텐션을 통해 Int 타입에 인스턴스 메서드인 multiply(by: ) 메서드를 추가했다.
- 여러 기능을 여러 인스텐션 블록으로 나눠서 구현해도 전혀 문제가 없다.
- 관련 기능별로 하나의 익스텐션 블록에 묶어주는 것도 좋다.

```swift
extension Int {
    func multiply(by: Int) -> Int {
        return self * by
    }
}

print(1.multiply(by: 5)) //5
print(3.multiply(by: 3)) //9

var number = 5
print(number.multiply(by: 2)) //20
print(number.multiply(by: 2)) //10
```



[ 이니셜라이저 추가 ]

- 인스턴스를 초기화(이니셜라이즈)할 때 인스턴스 초기화에 필요한 다양한 데이터를 전달받을 수 있도록 여러 종류의 이니셜라이저를 만들 수 있다. 타입에 정의부에 이니셜라이저를 추가하지 않더라도 익스텐션을 통해 이니셜라이저를 추가할 수 있다.
- 익스텐션으로 클래스 타입에 편의 이니셜라이저는 추가할 수 있지만, 지정 이니셜라이저는 추가할 수 없다. 지정 이니셜라이저와 디이니셜라이저는 반드시 클래스 타입의 구현부에 위치해야 한다. (값 타입은 상관 없다.)

``` swift
extension String {
    init(int: Int) {
        self = "\(int)"
    }
    
    init(double: Double) {
        self = "\(double)"
    }
}

let stringFromInt: String = String(int: 100) 
// "100"

let stringFromDouble: String = String(double: 100.0)    
// "100.0"
```

 