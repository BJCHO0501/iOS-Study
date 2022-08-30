# Reduce 📥

 

### 구현

- `reduce`함수는 컨테이너 내부의 **콘텐츠를 하나로 통합**한다.

```swift
// 통합하고자 하는 someNumbers
let someNumbers: [Int] = [2, 8, 15]
```

**[ 기존의 for 구문 사용 ]**

``` swift
var result: Int = 0

// someNumbers의 모든 요소를 더한다.
for number in someNumbers {
    result += number
}

print(result) // 25
```

**[ reduce 메서드 사용 ]**

```swift
// 초깃값이 0이고 someNumbers 내부의 모든 값을 더한다.
let sum: Int = someNumbers.reduce(0, { (first: Int, second: Int) -> Int in
    //print("\(first) + \(second)") 
    return first + second
})

print(sum)  // 25

// 초깃값이 0이고 someNumbers 내부의 모든 값을 뺀다.
var subtract: Int = someNumbers.reduce(0, { (first: Int, second: Int) -> Int in
    //print("\(first) - \(second)") 
    return first - second
})

print(subtract) // -25

// 초깃값이 3이고 someNumbers 내부의 모든 값을 더한다.
let sumFromThree = someNumbers.reduce(3) { $0 + $1 }

print(sumFromThree) // 28
```