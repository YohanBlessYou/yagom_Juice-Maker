## ๐ ํ๋ก์ ํธ ์ ๋ณด

- Project: ์ฅฌ์ค๋ฉ์ด์ปค

- Date: [3์ฃผ] 2021-10-18 ~ 2021-11-05

- Contributors: ์ํ(@YohanBlessYou, ์๊ฑฐ(@Jager-yoo)

- Reviewer: ์๋ฆผ (@lina0322)

---

## ๐ Project Summary
### Basic
- Singleton ๊ตฌํ ::: `FruitStore.shared`

- commit ๋ฉ์์ง ๋ชฉ๋ก์ ๊ฐ๋์ฑ ๋์ผ ์ ์์๊น? ::: ํฐ ์ฃผ์ ๋ณ๋ก prefix ๋ถ์ด๊ธฐ

- `#selector()`์ ๋ค์ด๊ฐ ๋ฉ์๋๋ ์๋ฌ๋ฅผ ์ธ๋ถ๋ก ๋์ง๋ฉด(`throws`) ์๋๋ค

### Foundation ๊ด๋ จ
- Alert ๊ตฌํ ::: ๋์ ์ฑ๊ณต ์ฌ๋ถ๋ฅผ Alert๋ก ์๋ฆผ

- NotificationCenter ๊ตฌํ ::: ํน์  Modal์ dismiss๋ฅผ ๋ค๋ฅธ ๋ทฐ์ปจ๋ค์๊ฒ ์๋ฆฌ๊ธฐ ์ํจ

- App ์ข๋ฃ ๊ตฌํ ::: `exit()` (Linux Standard Exit status code)

- ์ฝ๋ ์์ฝํ๊ธฐ ๊ตฌํ(ํ์ด๋จธ์ ์ ์ฌ) ::: `DispatchQueue.main.asyncAfter(deadline: )`

- Device ํ ํ๋ฉด์ผ๋ก ์ด๋ ๊ตฌํ ::: `UIApplication.shared.perform(#selector(NSXPCConnection.suspend))`

- `sleep()`์ ํ์ด๋จธ๊ฐ ์๋๋ค ::: ์ปดํจํ ์์์ ๋์ ํ์ฌ sleep๋์ ์ด๋ ํ interaction๋ ๋ถ๊ฐ


### UI/UX ๊ด๋ จ
- Modal + Navigation bar ::: view์ ๋ค๋น ๋ฐ๋ฅผ ์ง์  ๋ฃ๊ฑฐ๋, ์ฐจ์์์ ๋ค๋น ์ปจํธ๋กค๋ฌ๋ฅผ ์ถ๊ฐ

- Alert ๋ฒํผ์ ํ๋ฉด์ ํ ::: ์คํ ๋ฆฌ๋ณด๋์ segue๋ฅผ ๋ง๋ค๊ณ  `performSegue(identifier)` ํธ์ถ

- ์๋ Font size ๋ณ๊ฒฝ ::: `label.adjustsFontSizeToFitWidth`

- ๋ฒํผ์ padding ์ฃผ๊ธฐ ::: title-insets

- Alert์ Action sheet ์ฉ๋ ์ฐจ์ด ::: [H.I.G](https://developer.apple.com/design/human-interface-guidelines/ios/views/alerts/) ์ฐธ๊ณ  / ๋ฒํผ์ด 3๊ฐ ์ด์์ด๋ฉด Action sheet ๊ณ ๋ ค

- Stepper๋ +/- ๋ฒํผ์ ๊ตฌ๋ถํ์ง ๋ชปํ๋ค ::: value change๋ก๋ง ๊ฐ๋ฅ. ๋ฐ๋ผ์ 'value ์ด๊ธฐํ' ํ์

- ์ง๋ ๊ตฌํ ::: `UIFeedbackGenerator`. ์ง๋ ํจํด์ ๋ฐ๋ผ 3์ข๋ฅ๊ฐ ์๋ค. H.I.G์ฐธ๊ณ 

- ์ ์ ๊ฐ ํ๋ฉด์ ๋ณผ ์ ์๋ ์์ ์ `viewWillAppear`์ `viewDidAppear` ์ฌ์ด๋ค

---

## UML
![image](https://user-images.githubusercontent.com/39155090/140614274-64ff2701-3288-44a2-bbdb-4603d60db4cf.png)

![image](https://user-images.githubusercontent.com/39155090/140614912-16c59b50-90d3-4ef7-89f2-f2099c054b4d.png)

## ๐ค ํค์๋ Detail
<br>

### ํ์ ์ค๊ณ

**1. ๊ณผ์ผ ์ฌ๊ณ ๋ฅผ ๊ด๋ฆฌํ๋ ๋ณ์ ํ์์ `Dictionary` ์ `Array with tuples` ์ค์ ๊ณ ๋ฏผํ์ต๋๋ค.**
- ๊ฐ ๊ณผ์ผ์ ์ด๋ฆ๊ณผ ์ฌ๊ณ ๋ฅผ pair ๋ก ๊ด๋ฆฌํ๊ณ  ์ถ์์ต๋๋ค.

- ํํ์ ๋ฐฐ์ด ์์ ๋ด์ ์ฐ๋ ๋ฐฉ๋ฒ์ ๊ณ ๋ฏผํ์ผ๋, ๊ณผ์ผ ์ด๋ฆ ์ค๋ณต๋ ํผํ๊ณ  ์์(index) ๋ํ ๊ณ ๋ คํ  ํ์๊ฐ ์์ผ๋, ๋์๋๋ฆฌ๊ฐ ์ ํฉํ  ๊ฒ์ด๋ผ ์๊ฐํ์ต๋๋ค.

    ```swift
    private var inventory: [Fruit: Int] = [:]
    ```
    


**2. ์ด๊ธฐํํ  ๋ `CaseIterable` ํ๋กํ ์ฝ์ ์ฑํํ์ต๋๋ค.**

- `FruitStore` ์ธ์คํด์ค๋ฅผ ์์ฑํ  ๋ 5๊ฐ์ง ๊ณผ์ผ ๋ชจ๋ 10๊ฐ์ฉ ์ฑ์์ฃผ๋ ๊ณผ์ ์ด ํ์ํ์ต๋๋ค.

- `Fruit` ์ด๊ฑฐํ์ `CaseIterable`ํ๋กํ ์ฝ์ ์ฑํํ์ฌ `for๋ฌธ`์ผ๋ก ์ด๊ธฐํํ์ต๋๋ค.

    ```swift
    enum Fruit: CaseIterable {
        case strawberry
        case banana
        case pineapple
        case kiwi
        case mango
    }

    // FruitStore ํด๋์ค ๋ด์ init() ๊ตฌ๋ฌธ ์์์ for๋ฌธ ์ฌ์ฉ
    for fruit in Fruit.allCases {
        self.inventory[fruit] = FruitStore.defaultFruitAmount
    }
    ```
  


**3. ๋ฉ์๋ ๋ค์ด๋ฐ์ ํ๋ผ๋ฏธํฐ์ ํจ๊ป ์์ฐ์ค๋ฝ๊ฒ ์ฝํ๋๋ก ์ค๊ณ**

```swift
// ๊ณผ์ผ์ ์ฌ๊ณ ๊ฐ ์ถฉ๋ถํ์ง ํ์ธํ๋ ์ธ์คํด์ค ๋ฉ์๋
fruitStore.has(.strawberry, amount: 10)

// ๊ณผ์ผ์ ๊ฐ์๋ฅผ ์ฆ๊ฐ์ํค๋ ์ธ์คํด์ค ๋ฉ์๋
fruitStore.increase(.kiwi, amount: 10)

// ์ฅฌ์ค๋ฅผ ๋ง๋๋ ์ธ์คํด์ค ๋ฉ์๋
juiceMaker.make(.bananaJuice)
```

<br>

### Nested Type vs ํ์ผ ๋ถ๋ฆฌ


- ์ด๊ฑฐํ์ ์ธ๋ถ ํ์ผ๋ก ๋ถ๋ฆฌํ  ๊ฒ์ธ๊ฐ, ๋๋ ํ์ ์์ Nested Type ์ผ๋ก ๋ฃ์ ๊ฒ์ธ๊ฐ๋ฅผ ๊ณ ๋ฏผํ์ต๋๋ค.

- `Fruit` ์ด๊ฑฐํ๊ณผ `Error` ์ด๊ฑฐํ์ ์ธ๋ถ ํ์ผ๋ก ๋ถ๋ฆฌํ์ต๋๋ค. STEP์ด ์งํ๋๋ฉด์ ํ๋ก์ ํธ ๋ด์ ๋ค๋ฅธ ํ์ผ์์๋ ์ฌ์ฉ๋  ๊ฐ๋ฅ์ฑ์ด ์๋ค๊ณ  ํ๋จํ์ต๋๋ค.

- `Juice` ์ด๊ฑฐํ์ `JuiceMaker` ํ์์ Nested Type ์ผ๋ก ๋ฃ์์ต๋๋ค.

- `Juice` ์ด๊ฑฐํ ์์ ์๋ `recipe` ํ๋กํผํฐ๋ `fileprivate` ์ ๊ทผ์ ์ด์๋ฅผ ์ ์ฉํ์ต๋๋ค.

- ์ธ๋ถ ํ์ผ์์๋ ์ฅฌ์ค์ ์ข๋ฅ(cases)๋ฅผ ๋ณผ ์๋ ์์ง๋ง, `recipe` ๋ ๋ณผ ์ ์๋๋ก ๋ง๋ค์์ต๋๋ค.

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
