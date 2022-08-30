# 옵셔널 체이닝과 nil 병합 연산자 🔑



### 옵셔널 체이닝

- 옵셔널 체이닝은 옵셔널의 내부의 내부의 내부로 옵셔널이 연결되어 있을 때 유용하게 활용할 수 있다.
- 매번 nil을 확인을 하지 않고 최종적으로 원하는 값이 있는지 없는지 확인할 수 있다.

``` swift
class Person {
    var name: String
    var jop: String?
    var home: Apartment?
    
    init(name: String) {
        self.name = name
    }
}

class Apartment {
    var buildingNumber: String
    var roomNumber: String
    var `guard`: Person?
    var owner: Person?
    
    init(dong: String, ho: String) {
        buildingNumber = dong
        roomNumber = ho
    }
}

let cho: Person? = Person(name: "cho")
let apart: Apartment? = Apartment(dong: "101", ho: "150")
let kim: Person? = Person(name: "kim")

//옵셔널 체이닝을 사용하지 않는다면
func guardJop(owner: Person?) {
    if let owner = owner {
        if let home = owner.home {
            if let `guard` = home.guard {
                if let guardJop = `guard`.jop {
                    print("우리집 경비원의 직업은 \(guardJop)입니다.")
                } else {
                    print("우리집 경비원의 직업은 없어요.")
                }
            }
        }
    }
}

guardJop(owner: cho) //우리집 경비원의 직업은 없어요.

//옵셔널 체이닝을 사용한다면
func guardJopOptionalChaining(owner: Person?) {
    if let guardJop = owner?.home?.guard?.jop {
        print("우리집 경비원의 직업은 \(guardJop)입니다.")
    } else {
        print("우리집 경비원의 직업은 없어요.")
    }
}

guardJopOptionalChaining(owner: kim) //우리집 경비원의 직업은 없어요.
```



### nil 병합 연산자

- 중위 연산자 이다. **??**
- Optional ?? Value
- 옵셔널 값이 **nil**일 경우, 우측의 값으로 반환한다.
- 띄어쓰기에 주의해야 한다.

``` swift
class Person {
    var name: String
    var jop: String?
    
    init(name: String) {
        self.name = name
    }
    
    convenience init(name: String, jop: String) {
        self.init(name: name)
        self.jop = jop
    }
}

var obj1 = Person(name: "cho")
var obj2 = Person(name: "kim", jop: "경찰")

// obj1은 아무 직업이 없으므로 obj1Jop의 값에 "백수"가 들어간다.
var obj1Jop: String = obj1.jop ?? "백수"
print(obj1Jop) //백수

var obj2Jop: String = obj2.jop ?? "백수"
print(obj2Jop) //경찰
```

