# 프로퍼티 감시자 🕶



### 프로퍼티 감시자란?

- 프로퍼티 감시자를 사용하면 **프로퍼티의 값이 변경**될 때 원하는 동작을 수행할 수 있다.
- 값이 변경되기 직전에 `willSet`블럭이, 값이 변경된 직후에 `didSet`블럭이 호출된다.
- 둘 중 필요한 하나만 구현해 주어도 무관합니다.
- 변경되려는 값이 **기존 값과 똑같더라도** 프로퍼티 감시자는 항상 동작합니다.
- **`willSet`** 블럭에서는 암시적 매개변수 **`newValue`**를, **`didSet`** 블럭에서는 **`oldValue`**를 사용할 수 있다.
- 프로퍼티 감시자는 연산 프로퍼티에는 사용할 수 없다.
- 프로퍼티 감시자는 함수, 메서드, 클로저, 타입 등의 지역/전역 변수에 모두 사용 가능하다.

---

### 정의 & 사용

``` swift
struct myData {
    //프로퍼티 감시자 사용
    var name = "sam" {
        willSet(newName) {
            print("이름이 \(name)에서 \(newName)으로 바뀔 예정입니다.")
        }
        
        didSet(oldName) {
            print("이름이 \(oldName)에서 \(name)으로 변경되었습니다.")
        }
    }
    
    var age = 10 {
        //willSet의 암시적 매개변수 이름 newValue
        willSet {
            print("나이가 \(age)에서 \(newValue)로 변경될 예정입니다.")
        }
        
        //didSet의 암시적 매개변수 oldValue
        didSet {
            print("나이가 \(oldValue)에서 \(age)로 변경되었습니다.")
        }
    }
}

var me = myData()

//이름이 sam에서 won으로 바뀔 예정입니다.
me.name = "won"
//이름이 sam에서 won으로 바뀌었습니다.

//나이가 10에서 17로 변경될 예정입니다.
me.age = 17
//나이가 10에서 17로 변경되었습니다.

print("name: \(me.name)\nage: \(me.age)")
//name: won
//age: 17
```

