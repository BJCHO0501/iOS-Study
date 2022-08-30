# Struct 📒



### 구조체란❓

- 타입이 다른 데이터를 하나로 묶는 것이다.
- 데이터들을 하나로 묶어 관리가 쉬워진다.

### 형식

~~~ swift
struct 이름 {
  구현부
}
~~~

### 프로퍼티 및 메서드

~~~ swift
struct Sample {
  var varProperty: Int = 100 // 가변 프로퍼티
  let letProperty: Int = 100 // 불변 프로퍼티
  
  static var typeProperty: Int = 100 // 타입 프로퍼티
  
  // 인스턴스 메서드
  func instanceMethod() {
    print("instance method")
  }
  
  // 타입 메서드
  static func typeMethod() {
    print("type method")
  }
}
~~~

- 프로퍼티 - 구조체 안에 있는 변수
- 메서드 - 구조체 안에 있는 함수
- 가변 프로퍼티 - 수정 가능한 프로퍼티
- 불변 프로퍼티 - 수정 불가능한 프로퍼티
- 타입 프로퍼티 - 인스턴트를 생성 안해도 사용 가능한 변수 생성
- 타입 메서드- 인스턴트를 생성 안해도 사용 가능한 메서드 생성

### 구조체 사용

~~~ swift
var varStruct: Sample = Sample() // 가변 인스펀스
let letStruct: Sample = Sample() // 불변 인스턴스
~~~

##### 인스턴트 프로퍼티 및 메서드

~~~ swift
varStruct.varProperty = 200
varStruct.letProperty = 100 // 오류

//오류
letStruct.varProperty = 300 
letStruct.letProperty = 200
~~~

- 인스턴스 메서드 혹은 프로퍼티는 인스턴스를 선언해야 사용 가능하다.
- 가변 인스턴스로 선언하면 변경 가능한 프로퍼티들은 수정 가능하나 불변은 다 수정 불가하다.

##### 타입 프로퍼티 및 메서드

~~~ swift
Sample.typeProperty = 200
Sample.typeMethod() // type method
~~~

- 타입 프로퍼티와 메서드는 인스턴스가 없어도 호출할 수 있다.
- Sample 타입 자체에서 사용할수 있는 메서트나 프로퍼티만 호출





