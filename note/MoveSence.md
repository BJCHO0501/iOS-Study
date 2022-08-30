# 화면 이동 📲



 ### Segue

- 버튼에 control 눌러서 원하는 뷰컨에 연결해주면 연결된다. 
- 간단해서 좋다.
- 스토리 보드에 변수값 옳기는게 어렵다.

### Modal

- 사용자가 원래 보고있는 화면에 다른 화면 띄우는 방식을 말한다.

- 화면을 완전히 전환하는 것이 아닌 화면을 다른 화면 위로 presenting하여 띄우는 방식이다.

- 사용자의 주의나 이목을 끌어야할 때 많이 사용되는 기법

  ```swift
  @IBAction func 함수이름(_ button: UIButton) {
    let 변수이름 = self.storyboard?.instantiateViewController(withIdentifier: "스토리보드ID")
    self.present(변수이름!, animated: #true or #false)
  }
  ```

  - 위 명령어로 나타나게 할 수 있다.

### Navigation

- last in first out의 규칙에 따른다.
- 각 스토리보드마다 변수값을 옳기는게 가능하다.

```swift
//네비게이션뷰 푸시
@IBAction func 함수이름(_ button: UIButton) {
  let 변수이름 = self.storyboard?.instantiateViewController(withIdentifier: "스토리보드ID")
  self.navigationController?.pushViewController(변수이름!, animated: #true or #false)
}

//네비게이션뷰 팝
@IBAction func 함수이름(_ button: UIButton) {
  let 변수이름 = self.storyboard?.instantiateViewController(withIdentifier: "스토리보드ID")
  self.navigationController?.pushViewController(변수이름!, animated: #true or #false)
}
```



