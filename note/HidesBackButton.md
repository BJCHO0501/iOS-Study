# HidesBackButton 🚫

- NavigationController을 사용하고 화면 푸쉬를 하게되면 다음 화면위에 **< Back**이라는 버튼이 자동생성 된다.
- 이런 버튼을 지워야할때 쓰는 코드가 **hidesBackButton**이다

```swift
override func viewWillAppear(_ animated: Bool) {
    self.navigationItem.hidesBackButton = true
}
```

- 위 코드를 해석해보자면 **viewWillAppear**즉 뷰가 나타났을때 실행하는 함수로 **self.navigationItem.hidesBackButton**을 true로 해준다면 버튼이 사라지고 false로 해준다면 버튼이 생긴다.