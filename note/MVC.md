# MVC 패턴 📐



### MVC 패턴

- **Model - View - Controller** 패턴의 줄임말로 여러가지 디자인 패턴들중 가장 기초적인 패턴이다. 
- 유지보수를 쉽개 하기 위해 사용한다.

### MVC

- **Model**: 데이터에 관한 로직 담당 (데이터 값 변경 및 관리)
- **View**: 사용자에게 보여지는 화면 담장 (UI)
- **Controller**: Model과 View 연결 (Model 값을 View에 보여줌)

### 주요부분

![img](https://blog.kakaocdn.net/dn/18LpC/btqFkna9DNO/6XlH5ou9HicTgEC2xQZml1/img.png)

![img](https://blog.kakaocdn.net/dn/DneMR/btqFkJyjHP5/86OAr4nVMr4YKkVRKpxZtK/img.png)

- Model은 Controller와 View에 의존하지 않아야 한다.
- View은 Model에만 의존하고, Controller에는 의존하면 안된다.
- View가 Model로 부터 데이터를 받을 때는, 사용자마다 다르게 보여주어야 하는 데이터에 대해서만 받아야 한다.
- Controller는 Model과 View에 의존해도 된다.
- View가 Model로 부터 데이터를 받을때, 반드시 Controllr에서 받아야 한다.

### 장점

- 역할을 분담하기 때문에 생산성이 높다.

### 단점

- 많을 코드들이 Controller에 집중되어 Controller가 커지게 된다.