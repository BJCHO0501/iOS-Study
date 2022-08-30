# GCD(Grand Central Dispatch) 🤖



### GCD란? 

> 💡Dispatch, also known as Grand Central Dispatch (GCD), contains language features, runtime libraries, and system enhancements that provide systemic, comprehensive improvements to the support for concurrent code execution on multicore hardware in macOS, iOS, watchOS, and tvOS.

- 공식문서는 GCD를 멀티코어 시스템에서 동시성 실행을 제공하는 프로그래밍 언어 요소, 런타임 라이브러리 등이라고 한다. 
- 여기서 이 GCD와 Dispatch Queue가 같다라고 생각할 수 있는데, 이 둘은 동치가 아닌 GCD의 개념으로 동시성 프로그래밍을 지원하는 스위프트 API가 Dispatch Queue라고 할 수 있다.

### Dispatch Queue

- Dispatch Queue는 작업항목의 실행을 관리하는 클래스이다. 대기열(큐-Queue)에 추가된 작업항목은 시스템이 관리하는 스레드에서 처리하고 작업을 완료하면 스레드를 알아서 해체한다.

  ![](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FATo1W%2FbtriGj2xQIi%2Fm6O6ncklksokgXf4oP2fX0%2Fimg.png)



### 사용하기

``` swift
DispatchQueue.{큐종류}(qos 옵션).{sync/async} {
  //Task
}
```

- 위와같이 큐의 종유, qos 우선순위, sync, async를 설정해서 사용하게 할 수 있다.



### serial, Concurrent

큐의 종류는 2가지가 있다

- ` Serial Queue`: 등록된 작업을 한번에 하나씩 차례대로 처리하는 직렬의 Queue.

  ![](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbMSxuS%2FbtqOH9mTr07%2FEzYjCOsoQGq6I1KaCOb3EK%2Fimg.png)

  

- `Concurrent Queue`: 등록된 작업을 하나씩 처리 하지 않고 여러 작업들을 동시에 작업하는 병렬의 Queue.

![](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcjdhM9%2FbtqOveJ2POb%2FbV2RaLPUyol1hACL9UTN61%2Fimg.png)



### Sync, Async

각 Queue는 **Sync**와 **Aync** 두가지로 나눌 수 있다.

- `Sync(동기)`: 큐에 추가된 작업이 종료될때 까지 다른 작업을 하지 않고 기다리는것

- `Async(비동기)`: 큐에 작업을 등록하면 작업의 완료 여부와 상관없이 계속 코드를 실행시키는것

- serial, Concurrent과 조합하여 4가지의 종류를 만들 수 있다.

  

### Qos 우선 순위

1. `userInteractive`
2. `userInitiated`
3. `default`
4. `utility`
5. `background`
6. `unspecified`



  
