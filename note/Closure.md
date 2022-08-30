# 클로저 🪝



### 클로저란

- 클로저는 실행가능한 코드 블럭이다.
- 함수와는 다르게 이름정의는 필요하지는 않지만, 매개변수 전달과 반환 값이 존재 할 수 있다는 점이 동일하다.
- **함수는 이름이 있는 클로저다.** 반댜로 말하면 클로저는 이름이 없는 함수다
- 일급객체로 전달인자, 변수, 상수 등에 저장 및 전달이 가능하다.

---

### 문법

``` swift
{ (매개변수 목록) -> 반환타입 in
 		실행코드
}
```

- 클로저는 중괄호 { }로 감싸져 있다
- 괄호를 이용해 파라미터를 정의한다
- -> 을 이용해 반환 타입을 명시한다
- "in" 키워드를 이용해 실행 코드를 분리한다

---

### 클로저 사용

``` swift
//sum이라는  상수에 클로저를 할당
let sum: (Int, Int) -> Int = { (a: Int, b: Int) in
	return a + b
}

let sumResult: Int = sum(1,2)
print(sumResult) //3
```

---

### 함수의 전달인자로서의 클로저

- 클로저는 주로 함수의 전달인자로 많이 사용된다
- 함수 내부에서 원하는 코드 블럭을 실핼 할 수 있다

``` swift
let add: (Int, Int) -> Int
add = { (a: Int, b: Int) in
	return a + b
}

let substract: (Int, Int) -> Int
substract = { (a: Int, b: Int) in
	return a - b 
}

let divide: (Int, Int) -> Int
divide = { (a: Int, b: Int) in
  return a / b
}

func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> Int{
  return method(a, b)
}

var calculated: Int

calculated = calculate(a: 50, b: 10, method: add)
print(calculated) //60

calculated = calculate(a: 50, b: 10, method: substract)
print(calculated) // 40

calculated = calculate(a: 50, b: 10, method: divide)
print(calculated) // 5

//따로 클로저를 상수/변수에 넣어 전달하지 않고, 
//함수를 호출할 때 클로저를 작성하여 전달할 수도 있다.

calculated = calculate(a: 50, b: 10, method: { (left: Int, right: Int) -> Int in
    return left * right
})

print(calculated) // 500
```



## 고급 

---

### 클로저의 다양한 모습

1. **후행 클로저** : 함수의 매개변수 마지막으로 전달되는 클로저는 `후행클로저(trailing closure)`로 함수 밖에 구현할 수 있습니다.
2. **반환타입 생략** : 컴파일러가 클로저의 타입을 유추할 수 있는 경우 매개변수, 반환 타입을 생략할 수 있다.
3. **단축 인자 이름** : 전달인자의 이름이 굳이 필요없고, 컴파일러가 타입을 유추할 수 있는 경우 축약된 전달인자 이름(`$0`, `$1`, `$2`...)을 사용 할 수 있다.
4. **암시적 반환 표현** : 반환 값이 있는 경우, 암시적으로 클로저의 맨 마지막 줄은 `return` 키워드를 생략하더라도 반환 값으로 취급한다.

---

### 후행 클로저

- 클로저가 함수의 마지막 전달인자일때, 마지막 매개변수 이름을 생략한 후 함수 소괄호 외부에 클로저를 구현할 수 있다.

``` swift
result = calculate(a: 10, b: 10) { (left: Int, right: Int) -> Int in
    return left + right
}

print(result) // 20
```

---

### 반환타입 생략

- calculate(a: b: method:)` 함수의 `method` 매개변수는 `Int` 타입을 반환할 것이라는 사실을 컴파일러도 알기 때문에 굳이 클로저에서 반환타입을 명시해 주지 않아도 된다. 대신 `in 키워드는 생략할 수 없다.

```swift
result = calculate(a: 10, b: 10, method: { (left: Int, right: Int) in
    return left + right
})
print(result) // 20

// 후행클로저와 함께 사용할 수도 있다
result = calculate(a: 10, b: 10) { (left: Int, right: Int) in
    return left + right
}
print(result) // 20
```

---

### 단축 인자이름

- 클로저의 매개변수 이름이 굳이 불필요하다면 단축 인자이름을 활용할 수 있습니다. 단축 인자이름은 클로저의 매개변수의 순서대로 `$0`, `$1`, `$2`... 처럼 표현한다.

``` swift
result = calculate(a: 10, b: 10, method: {
    return $0 + $1
})
print(result) // 20


// 당연히 후행 클로저와 함께 사용할 수 있다
result = calculate(a: 10, b: 10) {
    return $0 + $1
}
print(result) // 20
```

---

### 암시적 반환 표현

- 클로저가 반환하는 값이 있다면 클로저의 마지막 줄의 결과값은 암시적으로 반환값으로 취급합니다.

```swift
result = calculate(a: 10, b: 10) {
    $0 + $1
}

print(result) // 20

// 간결하게 한 줄로 표현해 줄 수도 있다
result = calculate(a: 10, b: 10) { $0 + $1 }

print(result) // 20
```







