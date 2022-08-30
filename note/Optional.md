# Optional 📃

### 옵셔널이란❓

+ 옵셔널은 스위프트의 특징 중 하나인 안정성을 문법으로 담보하는 기능이다.
+ 옵셔널은 값이 있을 수도, 없을 수도(nil)를 나타내는 표현이다.

### 옵셔널 사용 📝

```swift
var 변수이름: 타입? = 변수값

var city: String? = "seoul"
print(city) //seoul

city = nil
print(city) //nil
```

+ 옵셔널로 선언된 곳에서만 `nil`을 할당할 수 있다. (일반 변수 또는 상수에 `nil`을 할당하면 컴파일 오류 발생)

+ 옵셔널 변수 또는 상수 등은 데이터 타입 뒤에 물음표를 붙여 표현해준다.

  

### 옵셔널 바인딩 

```swift
var myname: String? = "BJCHO"

if let name = myname {
  print("My name is \(name)")
} else {
  print("myname == nil")
}
// My name is BJCHO
```

+ 옵셔널 바인딩은 옵셔널에 값이 있는지 확인할 때 사용한다.

+ 옵셔널에 값이 있다면 옵셔널에서 추출한 값을 상수나 변수로 할당해서 사용할 수 있도 해준다.

+ 옵셔널 바인딩은 `if`또는`while`구문 등과 결합하여 사용할 수 있다.

+ 안전하게 언레핑(unwrapping) 할 수 있다는 장점이 있다

  

### 암시적 추출 옵셔널

```swift
var myphone: String! = "iPhone 12 mini"
print(myphone) //iPhone 12 mini

myphone = nil

if let phone = myphone {
  print("My phone is \(phone)")
} else {
  print("myphone == nil")
}
//myphone == nil

print("\(myphone)") //런타임 오류
```

+ 암시적 추출 옵셔은 `nil`을 할당해줄 수 있는 옵셔널이 아닌 변수나 상수를 사용할 때 사용한다.

+ 암시적 추출 옵셔널을 사용하여면 타입 뒤에 느낌표를 사용하면 된다.

+ 암시적 추출 옵셔널로 지정된 타입은 일반 값처럼 사용할 수 있으나, 옵셔널이기 때문에 `nil`도 할당할 수 있다

+ `nil`이 할당되어 있을 때 접근을 시도하면 런타임 오류가 발생한다.



