# UserDefaults 🗂

+ 때로는 앱을 만들었을때 그 앱의 데이터가 앱을 종료했다가 다시 실행하여도 그대로 남아있게 해야할때가 있다.
+ 그럴때 쓰는것이 userDefalults이다.

### 문법

```swift
//저장할때
UserDefaults.standard.set(변수이름, forKey: "키이름")
UserDefaults.standard.synchronize()

//꺼내올때
UserDefaults.standard.타입(forKey: "키이름")
```

+ 여기서 이 **UserDefaults.standard.synchronize()** 를 왜 쓰는것인지 의문이 들것이다.

  > synchronize() 메소드는 UserDefaults 에 기록된 값을 파일에 쓰는 역할을 한다. 따라서 여러 값을 변경할 경우 매번 synchronize() 를 호출할 필요 없이 다 쓰고 난 다음에 마지막에 딱 한번만 synchronize() 를 호출하면 된다.

  라고 검색했더니 나왔다.

  + 요약하자면 synchronize()를 써야 파일에 저장을 한다는 것이다. 단 수정할 때마다 쓸 필요는 없고 마지막에만 써주면 된다.
  
    

### 활용 예시

```swift
func setData(_ sender: String) {
  let data = sender
  UserDefaults.standard.set(data, forKey: "hello")
  UserDefaults.standard.synchronize()
}

func getData() {
  guard let data = UserDefalts.standard.object(forKey: "hello") as? String else {
    return
  }
  return data
}

func printFunction() {
  print(getData())
}

func endApplication() {
  setData("안녕!")
}
```

+ 위 코드에서 **endApplication**함수는 앱이 종료됬을때 실행되는 함수라 생각하고, **printFunction**은 앱을 시작했을때 출력하는 함수라고 생각해보자

+ 앱이 실행되면 getData함수가 실행되고 getData안 data변수에 키가 "hello"인 값을 String형태로 저장한다. 

+ 하지만 아직 값은 없으므로 아무것도 출력되지 않는다.

+ 앱을 종료하면  setData함수가 실행되고 setData안 data변수는 "안녕!"이 되고 "hello"라는 키로 저장이 된다. 

+ 앱을 실행한다면 이번에는 "hello"라는 키의 값이 있으므로 "안녕!"이 출력된다.

  `TMI: 여기서 UserDefalts.standard.object(forKey: "hello") as? String은 UserDefalts.standard.String(forKey: "hello")과 같은 역할을 한다.`

  





