# Dictionary 📚



### 형식

- '키'와 값 의 쌍으로 이루어진 컬렉션 타입
- 값은 중복 가능하지만, 키는 중복하면 안 된다.

### 선언 

``` swift
var anyDictionary:<String,Any> = [String:Any]()
//Key가 String 타입이고 value가 Any타입인 빈 dictionary생성
```

- 빈 딕셔너리를 선언할때는 `var Dictionary = [:] `과 같은 타입 추론으로는 선언할 수 없다.

``` swift
var anyDictionary: Dictionary <String, Any> = Dictionary<String, Any>()
var anyDictionary: Dictionary <String, Any> = [:]
var anyDictionary: [String: Any] = Dictionary<String, Any>()
var anyDictionary: [String: Any] = [String: Any]()
var anyDictionary: [String: Any] = [:]
var anyDictionary = [String: Any]()
```

- 위 표현 모두 같은 포현이다.

### 값 수정

``` swift
//키에 해당하는 값 수정
var dic = ["ob1": "👎🏻", "ob2": "hello"]
dic["ob1"] = "👍🏻"
print(ob1) //["ob1": "👍🏻", "ob2": "hello"]

//키에 해장하는 값 제거 
dic.removeValue(forKey: "ob1")
dic["ob2"] = nil
print(dic) //암것도 안나옴
```

### 불변 딕셔너리

``` swift
let dic: [String:String] = [:]
let initalizedDic: [String:String] = ["name": "jin", "gender": "male"]
//값을 수정하려고 한다면 오류가난다.
```

