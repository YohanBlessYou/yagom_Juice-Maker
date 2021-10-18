enum FruitType {
    case 딸기
    case 바나나
    case 사과
}

enum Juice {
    case 딸바
    case 바딸

    //Dictionary vs Tuple 
    func returnRecipe() -> [ .Fruit: Int ] {
        switch self {
            return [ .딸기: 3, .바나나: 1 ]
        }
    }
}

struct Fruit {
    let type = FruitType()
    let 재고: Int

    재고업()
    재고다운()
}

class FruitStore {
    var fruits = [Fruit: Int] 
    
    수량변경(n개) {
        += n
        -= n
    }
}

struct JuiceMaker {
    let fruitStore = FruitStore()

    제조() {
        if 재고확인(recipe) == true {
            과일쥬스생성(param: .Juice)
        } else {
            print제조불가()
        }
    }

    재고확인() -> Bool {
        
    }
    
    과일쥬스생성(param: .Juice) {
        let recipe = param.getRecipe()

        for (fruit, number) in recipe {

            fruitStore.[fruit] -= number

            수량변경()
        }

        과일쥬스 += 1
    }
}