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
        // Do any additional setup after loading the view.
        
        imgView.image = UIImage(named: "meta.jpeg")

                              
        
        
        
    }
}
