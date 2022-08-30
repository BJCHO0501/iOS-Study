# 프로퍼티 🪣



### 프로퍼티의 정의

- 프로퍼티는 구조체. 클래스, 열거형 내부에 구현할 수 있다.
- 다만 열거형 내부에는 연산 프로퍼티만 구현할 수 있다.
- 연산 프로퍼티는 var로만 선언할 수 있다.
- 연산프로퍼타를 읽기 전용으로 구현할 수 있지만, 쓰기 전용으로는 구현할 수 없다.
- 읽기전용으로 구현하려면 get 블럭만 작성해주면 된다. 읽기 전용은 get블럭을 생략할 수 있다. 
- 읽기, 쓰기 모두 가능하게 하려면 get블럭과 set블럭을 모두 구현해주면 된다
- set블럭에서 암시적 매개변수 newValue를 사용할 수 있다.

---

### 프로퍼티의 종류

- 인스턴스 저장 프로퍼티
- 타입 저장 프로퍼티
- 인스턴스 연산 프로버티
- 타입 연산 프로퍼티
- 지연 저장 프로퍼티



## 사용

---

``` swift
struct Student {
  // 인스턴트 저장 프로퍼티
  var name: String = ""
  var `class`: String = "swift"
  var koreanAge: Int = 0
  
  // 인스턴트 연산 프로퍼티
  var westernAge: Int {
    get {
      return koreanAge - 1
    }
    
    set(inputValue) {
      koreanAge = inputValue + 1
    }
  }
  
  // 타입 저장 프로퍼티
 	static var tyoeDescripion: String = "학생"
   
  
    /*
    // 인스턴스 메서드
    func selfIntroduce() {
        print("저는 \(self.class)반 \(name)입니다")
    }
     */
  
  // 읽기전용 인스턴스 연산 프로퍼티
  // 위의 메서드를 대체할 수 있다
  var selfIntroduction: String {
    get {
      return "저는 \(self.class)반 \(name)입니다"
    }
  }
  
  // 읽기전용 타입 연산 프로퍼티
  //읽기전용에서는 get을 생략할 수 있다
  static var selfIntroduction: String {
    return "학생타입 입니다"
  }
}
```