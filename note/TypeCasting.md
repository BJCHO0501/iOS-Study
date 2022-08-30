# 타입 캐스팅 ❄️



### 스위프트 타입 캐스팅

- 인스턴스의 타입을 확인 하는 용도
- 클래스의 인스턴스를 부모 혹인 자식 클래스의 타입으로 사용할 수 있는지 확인하는 용도
- **is, as**를 사용한다.
- 형변환은( ex: let someDouble = Double(4) ) 타입 캐스팅이 아니라 새로운 값을 생성하는 것이다.

### 예제 클래스

``` swift
class Person {
    var name: String = ""
    func jump() {
        print("뜁니다.")
    }
}

class Student: Person {
    var school: String = ""
    func goToSchool() {
        print("학교에 갑니다.")
    }
}

class UniversityStudent: Student {
    var major: String = ""
    func goToMT() {
        print("MT를 갑니다.")
    }
}

//인스턴스 생성
var cho: Person = Person()
var kim: Student = Student()
var sam: UniversityStudent = UniversityStudent()
```



### 타입확인

- is를 사용하여 타입을 확인한다.

``` swift
var result: Bool

result = cho is Person //true
result = cho is Student //false
result = cho is UniversityStudent //flase

result = kim is Person //true
result = kim is Student //true
result = kim is UniversityStudent //false

result = sam is Person //true
result = sam is Student //true
result = sam is UniversityStudent //true

switch cho {
case is Person:
    print("사람")
case is Student:
    print("학생")
case is UniversityStudent:
    print("대학생")
default:
    print("넌 뭐냐..?")
} //사람
```

### 업 캐스팅 (Up Casting)

- **as**를 사용하여 부모클래스의 인스턴스로 사용할 수 있도록 컴파일러에서 타입 정보를 전환해준다.
- **Any** 혹은 **Anyobject**로도 타입정보를 변환할 수 있다.
- 임시적으로 처리되므로 꼭 필요한 경우가 아니면 생략해도 무방하다.

``` swift 
// UniversityStudent 인스턴스를 생성하여 Person 행세를 할 수 있다록 업 캐스팅
var cookie: Person = UniversityStudent() as Person

// Person 인스턴스를 생성하여 Any 행세를 할 수 있도록 업 캐스팅
var park: Any = Person() //as Any 생략
```



### 다운 캐스팅 (Down Casting)

- **as?** 또는 **as!** 를 사용하여 자식 클래스의 인스턴스로 사용할 수 있도록 컴파일어에게 인스턴스릐 타입 정보를 전환해 준다.

##### A. 조건부 다운 캐스팅	

- **as?** 를 사용한다.
- 캐스팅에 실패하면, 즉 **캐스팅 하려는 타입에 부합하지 않는 인스턴스**라면 **nil**을 반환하기 때문에 결과의 타입은 옵셔널 타입이다.

``` swift
var optionalCasted: Student?

optionalCasted = cookie as? UniversityStudent
optionalCasted = park as? Student //nil
```



##### B. 강제 다운 캐스팅

- **as!** 를 사용한다.
- 캐스팅에 실패하면, 즉 **캐스팅 하려는 타입에 부합하지 않는 인스턴스**라면 **런타임 오류**가 발생한다.
- 캐스팅에 성공하면 옵셔널이 아닌 **일반 타입**을 반환한다.

``` swift
var optionalCasted: Student?

optionalCasted = cookie as? UniversityStudent
optionalCasted = park as? Student //런타임 오류
```



