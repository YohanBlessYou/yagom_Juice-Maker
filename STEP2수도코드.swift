class VeiwController {

    @IBOutlet 버튼7개, 레이블5개

    //action 7개 만들어야 하나? 방법 찾아보기
    @IBAction func 쥬스만들기(_ sender) {
        JuiceMaker.make()

        if 재고없음 {
            alert재고없음()
        } else {
            레이블업데이트 (from FuritStore)
            alert재고있음()
        }
    }

    func alert재고있음() {
        "재고있음 쥬스나왔습니다"
    }

    func alert재고없음() {
        alert("재고수정하시겠습니까?")

        addAction("재고수정한다", 화면전환)
        addAction("안한다")
    }
}

