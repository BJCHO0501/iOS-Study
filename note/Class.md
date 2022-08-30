# class 🎈

### 클레스란?

- 클래스는 참조타입 이다.
- 타입 이름은 대문자 카멜케이스를 사용하여 정의한다.
- 다중 상속이 되지 않는다.
- 구조체와 비슷하다

### 정의

``` swift
class 이름 {
  구현부
}
```



### 프로퍼티 및 매서드 구현

``` swift
class Sample {
    // 가변 프로퍼티
    var mutableProperty: Int = 100 

    // 불변 프로퍼티
    let immutableProperty: Int = 100 
    
    // 타입 프로퍼티
    static var typeProperty: Int = 100 
    
    // 인스턴스 메서드
    func instanceMethod() {
        print("instance method")
    }
    
    // 타입 메서드
    // 상속시 재정의 불가 타입 메서드 - static
    static func typeMethod() {
        print("type method - static")
    }
    
    // 상속시 재정의 가능 타입 메서드 - class
    class func classMethod() {
        print("type method - class")
    }
}
```

- 대부분 구조체와 비슷하나 class를 사용하여 상속시 재정 가능 타입 메서드를 만들 수 있다.

``` 	swift
// 인스턴스 생성 - 참조정보 수정 불가
let immutableReference: Sample = Sample()

// 클래스의 인스턴스는 참조 타입이므로 let으로 선언되었더라도 인스턴스 프로퍼티의 값 변경이 가능
immutableReference.mutableProperty = 200
```



