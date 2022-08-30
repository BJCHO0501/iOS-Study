# Info.plist(Information Property List Files)

### lnfo.plist❓

+ 프로젝트 설정을 담당하는 파일
+ root XML노드는 키, 밸류로 구성된 딕셔너리 형태이다.
+ 시스템은 이 키와 값을 사용하여 앱과 앱의 설정을 가져온다. 
+ 일반적으로 유니코드 UTF-8로 인코딩되며 내용은 XML을 사용한다.
  

### How to use 🤔

- 프로젝트를 생성하면 자동으로 info.plist파일이 생성된다.![](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FH7kd6%2FbtqROfxBez2%2FiAZxNO09k9cvDdAmHYp5B1%2Fimg.png)

+ 파일 최상단을 보면 Key, Type, Value를 확인할 수 있다.
+ 특정 키 값을 편집하려면 값을 더블클릭하여 선택한 다음 새 값을 입력한다.

  | **Key**                                    | **설명**                             |
  | ------------------------------------------ | ------------------------------------ |
  | Localization native development region     | 개발 지역, 언어                      |
  | Executable file                            | 실행 파일 이름                       |
  | Bundle identifier                          | 번들을 식별하는 값                   |
  | InfoDictionary version                     | Info.plist의 버전                    |
  | Bundle name                                | 16글자 미만의 번들 이름(앱 이름)     |
  | Bundle OS Type code                        | 번들 OS 종류 코드                    |
  | Bundle version string (short)              | 번들의 릴리즈 버전                   |
  | Bundle version                             | 번들의 빌드 버전                     |
  | Application requires iPhone environment    | iOS에서만 실행하는지 여부            |
  | Application Scene Manifest                 | 앱의 씬 기반 라이프 사이클 관련 정보 |
  | Application supports indirect input events | 간접 입력 지원 여부                  |
  | Launch screen interface file base name     | 런치스크린 파일 이름                 |
  | Main storyboard file base name             | 메인 스토리보드 파일 이름            |
  | Required device capabilities               | 지원 디바이스(요구 조건)             |
  | Supported interface orientations           | 지원하는 인터페이스 방향             |
  | Supported interface orientations (iPad)    | 지원하는 인터페이스 방향(iPad)       |

+ 위의 Key값들을 이용하여 설정 가능하다. 
+ 더 많은 Key들은 [여기에서](https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Introduction/Introduction.html#//apple_ref/doc/uid/TP40009248-SW1) 찾아볼 수 있다.
