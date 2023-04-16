# ⚙️ VIPER (수정중)

- 바이퍼 패턴은 기존에 있는 Clasic MVC나 apple’s MVC의 View와 Controller의 책임을 나누기 어려워 만들어진 패턴이다.

![Viper Module](https://ckl-website-static.s3.amazonaws.com/wp-content/uploads/2016/04/Viper-Module.png.webp)

- 기본적으로 책임분리 원칙(SRP)을 기반으로 하는데, SPR은 작성된 클래스는 하나의 기능만 가지며 제공하는 모든 서비스는 하나의 책임(기능)을 수행하는 원칙이다.
- 이를 응집도는 높고 결합도는 낮은 것을 의미한다.
- 각 구성요소들만 봐보자.

## View

- View는 ViewController를 의미하며 UI와 관련된 처리만 한다.
- Presenter에 대한 의존성을 가지고 있으며, LifeCycle과 여러 이벤트 처리를 Present에 위임
- Presenter의 요청을 받아 UI를 UpDate 한다.

## Presenter

- Presenter는 View, Router, Interaction에 대한 의존성을 가지고 있다.

1. View에서 Event를 전달 받아 Interactor를 통해 처리하고
2. View에 data와 함께 UI Update요청을 보내거나
3. Router를 통한 화면 이동을 처리한다.

## Interator

- Business 로직 담당

1. API 통신 등의 Networking
2. Entity(Data)에 대한 처리를 하고 결과를 Presenter에 전달한다.

## Router(WireFrame)

- 화면 전환과 각 구성요소에 DI(의존성 주입)를 처리한다.

## Entity

- 속성들을 가지고 있는 Data Model을 의미한다.

## 흐름

1. 새롭게 View를 Router로 부터 가져온다. (Router에 의존성 주입하고 초기 View 을 세팅하는 코드를 넣음)
2. View는 새로운 데이터가 필요하다 presenter에 알림
3. Presenter은 Interactor에게 데이터를 요청
4. Interactior은 데이터를 Fetch하는 비지니스 로직을 실행하고 Entity를 패치해온다.
5. Interator은 Fetch한 Entity를 Presenter에게 전달한다.
6. Presenter은 Entity를 View에 전달한다.
7. View는 해당 Entity를 화면에 표시한다.
