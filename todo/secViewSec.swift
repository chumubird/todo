//
//  secViewSec.swift
//  todo
//
//  Created by t2023-m0081 on 2023/08/02.
//

import UIKit

class secViewSec: UIViewController {
    
    

    @IBOutlet weak var toDoSomething: UILabel!
    var todosome = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //확인용 view.backgroundColor = .red
        toDoSomething.text = todosome
    }// 뷰가 다 로드가 될때 var todosome의 빈칸으로 되어있다가 밑에 함수에서 todosome이 바뀔때마다 다시 그려짐
    
    
    func setLable(with text: String) {
        todosome = text
    }
    
    
}
