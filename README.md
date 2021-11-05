## 📝 프로젝트 정보

- Project: 쥬스메이커

- Date: [3주] 2021-10-18 ~ 2021-11-05

- Contributors: 요한(@YohanBlessYou, 예거(@Jager-yoo)

- Reviewer: 엘림 (@lina0322)

---

## 🔑 Project Summary
### Basic
- Singleton 구현 ::: `FruitStore.shared`

- commit 메시지 목록의 가독성 높일 수 없을까? ::: 큰 주제별로 prefix 붙이기

- `#selector()`에 들어갈 메서드는 에러를 외부로 던지면(`throws`) 안된다

### Foundation 관련
- Alert 구현 ::: 동작 성공 여부를 Alert로 알림

- NotificationCenter 구현 ::: 특정 Modal의 dismiss를 다른 뷰컨들에게 알리기 위함

- App 종료 구현 ::: `exit()` (Linux Standard Exit status code)

- 코드 예약하기 구현(타이머와 유사) ::: `DispatchQueue.main.asyncAfter(deadline: )`

- Device 홈 화면으로 이동 구현 ::: `UIApplication.shared.perform(#selector(NSXPCConnection.suspend))`

- `sleep()`은 타이머가 아니다 ::: 컴퓨팅 자원을 독점하여 sleep동안 어떠한 interaction도 불가

- 유저가 화면을 볼 수 있는 시점은 `viewWillAppear`와 `viewDidAppear` 사이다

### UI/UX 관련
- Modal + Navigation bar ::: view에 네비 바를 직접 넣거나, 차상위에 네비 컨트롤러를 추가

- Alert 버튼에 화면전환 ::: 스토리보드에 segue를 만들고 `performSegue(identifier)` 호출

- 자동 Font size 변경 ::: `label.adjustsFontSizeToFitWidth`

- 버튼에 padding 주기 ::: title-insets

- Alert와 Action sheet 용도 차이 ::: [H.I.G](https://developer.apple.com/design/human-interface-guidelines/ios/views/alerts/) 참고 / 버튼이 3개 이상이면 Action sheet 고려

- Stepper는 +/- 버튼을 구분하지 못한다 ::: value change로만 가능. 따라서 'value 초기화' 필요

- 진동 구현 ::: `UIFeedbackGenerator`. 진동 패턴에 따라 3종류가 있다. H.I.G참고

---

## 🤔 키워드 Detail
<br>

### 타입 설계

**1. 과일 재고를 관리하는 변수 타입을 `Dictionary` 와 `Array with tuples` 중에 고민했습니다.**
- 각 과일의 이름과 재고를 pair 로 관리하고 싶었습니다.

- 튜플을 배열 안에 담아 쓰는 방법을 고민했으나, 과일 이름 중복도 피하고 순서(index) 또한 고려할 필요가 없으니, 딕셔너리가 적합할 것이라 생각했습니다.

    ```swift
    private var inventory: [Fruit: Int] = [:]
    ```
    


**2. 초기화할 때 `CaseIterable` 프로토콜을 채택했습니다.**

- `FruitStore` 인스턴스를 생성할 때 5가지 과일 모두 10개씩 채워주는 과정이 필요했습니다.

- `Fruit` 열거형에 `CaseIterable`프로토콜을 채택하여 `for문`으로 초기화했습니다.

    ```swift
    enum Fruit: CaseIterable {
        case strawberry
        case banana
        case pineapple
        case kiwi
        case mango
    }

    // FruitStore 클래스 내의 init() 구문 안에서 for문 사용
    for fruit in Fruit.allCases {
        self.inventory[fruit] = FruitStore.defaultFruitAmount
    }
    ```
  


**3. 메서드 네이밍은 파라미터와 함께 자연스럽게 읽히도록 설계**

```swift
// 과일의 재고가 충분한지 확인하는 인스턴스 메서드
fruitStore.has(.strawberry, amount: 10)

// 과일의 개수를 증가시키는 인스턴스 메서드
fruitStore.increase(.kiwi, amount: 10)

// 쥬스를 만드는 인스턴스 메서드
juiceMaker.make(.bananaJuice)
```

<br>

### Nested Type vs 파일 분리


- 열거형을 외부 파일로 분리할 것인가, 또는 타입 안에 Nested Type 으로 넣을 것인가를 고민했습니다.

- `Fruit` 열거형과 `Error` 열거형은 외부 파일로 분리했습니다. STEP이 진행되면서 프로젝트 내의 다른 파일에서도 사용될 가능성이 있다고 판단했습니다.

- `Juice` 열거형은 `JuiceMaker` 타입의 Nested Type 으로 넣었습니다.

- `Juice` 열거형 안에 있는 `recipe` 프로퍼티는 `fileprivate` 접근제어자를 적용했습니다.

- 외부 파일에서도 쥬스의 종류(cases)를 볼 수는 있지만, `recipe` 는 볼 수 없도록 만들었습니다.

    ```swift
    // JuiceMaker.swift
    struct JuiceMaker {
        enum Juice {
            case ...
            
            fileprivate var recipe: [(Fruit, Int)] {
                switch self {
                    ...
                }
            }
        }
    }
    ```
    
<br>
