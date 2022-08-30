//
//  ModalViewController.swift
//  MoveScene
//
//  Created by 조병진 on 2022/05/24.
//

import UIKit

class ModalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissVc(_ button: UIButton) {
        self.dismiss(animated: true)
    }

}
