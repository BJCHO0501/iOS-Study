import UIKit
import SnapKit
import Then


class ViewController: UIViewController {
    //https://jsonplaceholder.typicode.com/todos/ 사용

    private let dataLabel = UILabel().then {
        $0.textColor = .black
        $0.numberOfLines = .max
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.addSubview(dataLabel)
        dataLabel.snp.makeConstraints {
            $0.left.right.top.bottom.equalToSuperview()
        }
    }
}

