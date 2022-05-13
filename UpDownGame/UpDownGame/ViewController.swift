import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var upDownLabel: UILabel!
    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var inputTextfield: UITextField!
    @IBOutlet weak var pushButton: UIButton!

    var randomNum: Int = 0
    var count: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        startGame()
    }
    
    @IBAction func pushButtonDidTap(_ button: UIButton) {
        guard let inputNumtext = self.inputTextfield.text,
              inputNumtext.isEmpty == false else {
            print("입력된 값이 없다.")
            return
        }
        guard let inputNumber: Int = Int(inputNumtext) else {
            print("잘못된 값을 입력하였습니다.")
            return
        }
        count += 1
        numLabel.text = "\(count)"
        if randomNum > inputNumber {
            upDownLabel.text = "UP"
        }
        else if randomNum < inputNumber {
            upDownLabel.text = "Down"
        }
        else{
            upDownLabel.text = "축"
        }
    }
    
    @IBAction func restartButtonDidTap(_ button: UIButton ) {
        startGame()
    }
    
    func startGame() {
        randomNum = Int(arc4random_uniform(100))
        count = 0
        upDownLabel.text = "Game Start"
        numLabel.text = "0"
        inputTextfield.text = nil
    }
}

