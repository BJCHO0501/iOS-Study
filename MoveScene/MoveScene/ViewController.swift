//
//  ViewController.swift
//  MoveScene
//
//  Created by 조병진 on 2022/05/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func moveModalView(_ button: UIButton) {
        let modalVC = self.storyboard?.instantiateViewController(withIdentifier: "modalView")
        modalVC?.modalPresentationStyle = .fullScreen
        self.present(modalVC!, animated: true)
    }
    
    @IBAction func navigationView(_ button: UIButton) {
        let navigationVC = self.storyboard?.instantiateViewController(withIdentifier: "navigationVC")
        self.navigationController?.pushViewController(navigationVC!, animated: true)
    }

}

