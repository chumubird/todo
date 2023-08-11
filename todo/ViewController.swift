//
//  ViewController.swift
//  todo
//
//  Created by t2023-m0081 on 2023/07/31.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var imgView: UIImageView! //이미지뷰는 변수 처리
    
    @IBAction func button1(_ sender: UIButton) {
        print("가 즈 ㅇ ㅏ ")
    }
    
    @IBAction func button2(_ sender: UIButton) {
        print("포기하면 편 해")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = UIImage(named: "meta.jpeg")
       // loadNames() 여기서 정보를 로드할필요가 사실 없는거같아서 주석처리해봤는대 영향이없었다 딱히 필요없는듯
        
        
    }
//    func loadNames() {
//        if let savedNames = UserDefaults.standard.array(forKey: "names") as? [String] {
//            names = savedNames   // 이것도 마찬가지로 딱히 필요없는것
//        }
//    }
}
