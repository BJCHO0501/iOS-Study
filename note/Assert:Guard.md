# assert / guard 💡



### Assertions

- **assert(_: _: file: line: )** 함수를 사용한다.
- assert 함수는 디버깅 모드에서만 작동한다.
- 배포하는 애플리케이션에서는 제외된다.
- 예상했던 조건의 검증을 위해서 사용한다.

``` swift
var someInt: Int = 0

//검증 조건과 실패시 나타날 문구를 작성해 준다.
//검증 조건에 부합하므로 지나간다.
assert(someInt == 0, "someInt != 0")

someInt = 1

assert(someInt == 0) // 동작 중지, 검즘 실패
assert(someInt == 0, "someInt != 0") // 동작 중지, 검증 실패 
// Assertion failed: someInt != 0
```

```swift
func functionWithAssert(age: Int?) {
  assert(age != nil, "age == nil")
  
  assert((age! >= 0)&&(age! <= 130), "나이값 입력이 잘못되었습니다.")
  print("당신의 나이는 \(arg!)세 입니다.")
}

functionWithAssert(age: 50)

functionWithAssert(age: -1) //동작중지, 검증 실패 
functionWithAssert(age: nil) // 동작 중지, 검증 실패
```

\+ **assert(_: _: file: line: )**와 감은 역할을 하지만 실제 배포 환경에서도 동작하는 **precondition(_: _: file: line: )** 함수도 있다.

> func precondition(    _ condition: @autoclosure () -> [`Bool`](https://developer.apple.com/documentation/swift/bool),    _ message: @autoclosure () -> [`String`](https://developer.apple.com/documentation/swift/string) = String(),    file: [`StaticString`](https://developer.apple.com/documentation/swift/staticstring) = #file,    line: [`UInt`](https://developer.apple.com/documentation/swift/uint) = #line )



### guard( 빠른동료 - Early Exit )

- **guard**를 사용하여 잘못된 값의 전달 시 특정 실행구문을 빠르게 종료한다.
- 디버깅 모드 뿐만 아니라 어떤 조건에서도 동작한다.
- **guard**의 **else** 블럭 내부에는 특정 코드블럭을 종료하는 지시어(**return**, **break** 등)가 꼭 있어야 합니다. 
- <u>타입 캐스팅</u>, <u>옵셔널</u>과도 자주 사용된다.
- 그 외에도 단순 조건 판단 후 빠르게 종료할 때도 용이하다.

``` swift
//옵셔널
func functionWithGuard(age: Int?) {
    guard let unwappingAge = age,
          unwappingAge < 130,
          unwappingAge >= 0 else {
        print("나이값이 잘못 입력되었습니다.")
        return
    }
    
    print("당신의 나이는 \(unwappingAge)입니다")
}

functionWithGuard(age: 10) //당신의 나이는 10입니다.
functionWithGuard(age: -1) //나이값이 잘못 입력되었습니다.
```

```swift
//반복문
var count = 1

while true {
    guard count < 3 else {
        break
    }
    
    print(count)
    count += 1
}

//1
//2
```

``` swift
//딕셔너리
func someFunction(info: [String: Any]) {
    guard let name = info["name"] as? String else { return }
    guard let age = info["age"] as? Int else { return }
    
    print("이름: \(name) \n나이: \(age)")
}

someFunction(info: ["name": "cho"]) //return
someFunction(info: ["name": "cho", "age": 17])
//이름: cho
//나이: 17
```



### + if let / guard를 이용한 옵셔널 바인딩 비교

#### A. if let

- if 구문 외부에서는 unwapping 변수 사용 불가능 (지역변수)

``` swift
if let unwapping: Int = someValue {
  unwapping = 3
}

unwapping = 5 // 오류
```

#### B. guard

- guard 구문 이후에도 unwapping 변수 사용가능 (전역변수)

``` swift
guard let unwapping: Int = someValue else {
  return
}

unwapping = 3 //사용 가능
```

