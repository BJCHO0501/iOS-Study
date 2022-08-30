# error handling ☠️



### 오류 처리

- 스위프트에서 오류(Error)는 **Error**라는 프로토콜을 준수하는 타입의 값을 통해 표현된다.
- **Error** 프로토콜은 사실상 요구사항이 없는 **빈 프로토콜**일 뿐이지만, 오류를 표현하기 위한 타입(주로 열거형)은 이 프로토콜을 채택한다.
- 스위프트의 **열거형**은 오류의 졸유를 나타내기에 아주 적합한 기능이다.
- 연관 값을 통해 오류에 관한 부가 정보를 제공할 수도 있다.



 ### 오류 표현

- **Error** 프로토콜과 주로 열거형을 통해서 요류를 표현한다.
- 자판기 동작 오류의 종류를 표현한 VendingMachineError 열거형

``` swift
enum VendingMachineError {
  case invalidlnput
  case insufficientFunds(moneyNeeded: Int)
  case outOfStock
}
```



### 함수에서 발생한 오류 던지기

- 오류 발생의 여지가 있는 메서드는 **throws**를 사용하여 오류를 내포하는 함수임을 표시한다.

``` swift
class VendingMachine {
    let itemPrice: Int = 100
    var itemCount: Int = 5
    var deposited: Int = 0
    
    //돈 받기 메서드
    func receiveMoney(_ money: Int) throws {
        
        //입력한 돈이 0이하면 오류를 던짐
        guard money > 0 else {
            throw VendingMachineError.invalidlnput
        }
        
        //오류가 없으면 돈 받기
        self.deposited += money
        print("\(money)원 받음")
    }
    
    //물건 팔기 메서드
    func vend(numberOfItems numberOfItemsToVend: Int) throws -> String {
        
        //원하는 아이템의 수량이 잘못 입력되었으면 오류를 던짐
        guard numberOfItemsToVend > 0 else {
            throw VendingMachineError.invalidlnput
        }
        
        // 구매하여는 수량보다 미리 넣어둔 돈이 적으면 오류를 던짐
        guard numberOfItemsToVend * itemPrice <= deposited else {
            let moneyNeeded: Int
            moneyNeeded = numberOfItemsToVend * itemPrice - deposited
            
            throw VendingMachineError.insufficientFunds(moneyNeeded: moneyNeeded)
        }
        
        //구매하려는 수량보다 요구하는 수량이 많으면 오류를 던짐
        guard itemCount >= numberOfItemsToVend else {
            throw VendingMachineError.outOfStock
        }
        
        let totalPrice = numberOfItemsToVend * itemPrice
        
        self.deposited -= totalPrice
        self.itemCount -= numberOfItemsToVend
        
        return "\(numberOfItemsToVend)개 제공함"
    }
}

let machine: VendingMachine = VendingMachine()

//판매 결과를 전달받을 변수
var result: String?
```



### 오류 처리

- 오류를 던질 수도 있지만 오류가 던져지는 것에 대비하여 던져지는 오류를 처리하기 위한 코드도 작성해야 한다. 예를 들어 던저진 오루가 무엇인지 판단하여 다시 문제를 해결한다든지, 다른 방법으로 시도해 본다든지, 사용자에게 오류를 알리고 사용자에게 선택권을 넘겨주어 다음 어떤 동작을 하게 할 것인지 결정하도록 하는 증의 코드를 작성함.
- 오류발생의 여지가 있는 throws 함수(메서드)는 try를 사용하여 호출해야 한다. try와 do-catch, try?와 try! 등에 대해 알아보자.

**[ do-catch ]**

- 오류발생의 여지가 있는 throws 함수(메서드)는 do-catch 구문을 활용하여 오류발생애 대비한다.
- 가장 정석적인 방법으로 모든 오류 케이스에 대응한다.

``` swift
do {
    try machine.receiveMoney(0)
} catch VendingMachineError.invalidlnput {
    print("입력값이 잘못되었습니다.")
} catch VendingMachineError.insufficientFunds(let money) {
    print("\(money)원이 부족합니다.")
} catch VendingMachineError.outOfStock {
    print("수량이 부족합니다.")
} // 입력값이 잘못되었습니다.
```

- 하나의 catch 블럭에 switch 구문을 사용하여 오류를 분류할 수도 있다.
- 이때 **error**이라는 변수를 암시적으로 사용 가능하다.

``` swift
do {
    try machine.receiveMoney(300)
} catch /*(let error)*/ {
    switch error {
    case VendingMachineError.invalidInput:
        print("입력이 잘못되었습니다.")
    case VendingMachineError.insufficientFunds(let moneyNeeded):
        print("\(moneyNeeded)원이 부족합니다.")
    case VendingMachineError.outOfStock:
        print("수량이 부족합니다.")
    default:
        print("알수없는 오류 \(error)")
    }
} //300원 받음
```

- 케이스별 오류 처리할 필요가 없으면 catch 구문 내부를 간략화 할 수도 있다.

``` swift
do {
    result = try machine.vend(numberOfItems: 4)
} catch {
    print(error)
} //insufficientFunds(100)
```

- 오류처리 할 필요가 없으면 do구문만 써도 무방하다.

``` swift
do {
    result = try machine.vend(numberOfItems: 4)
}
```



**[ try? 와 try! ]**

##### 1. try?

- 별도의 오류처리 결과를 통보받지 않고 오류가 발생했으면 결과값을 nil로 돌려 받을 수 있다.
- 정상동작 후에는 옵셔널 타입으로 정상 반환값을 돌여 받는다.

``` swift
result = try? machine.vend(numberOfItems: 2)
result // Optional("2개 제공함")

result = try? machine.vend(numberOfItems: 2)
result // nil
```

##### 2. try!

- 오류가 발생하지 않을 것이라는 강력한 확신을 가질 때 try!를 사용하면 정상작동 후에 바로 결과값을 돌려받는다.
- 오류가 발생하면 런타임 오류가 발생하여 애플리케이션 동작이 중지된다.

``` swift
result = try! machine.vend(numberOfItems: 1)
result // 1개 제공함

//result = try! machine.vend(numberOfItems: 1)
// 런타임 오류 발생! 앱 종료
```

