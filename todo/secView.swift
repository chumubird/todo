//
//  secView.swift
//  todo
//
//  Created by t2023-m0081 on 2023/07/31.
//

import UIKit

class secView: UIViewController {
        
    
    @IBOutlet weak var tableView: UITableView!
    

    @IBOutlet weak var secImg: UIImageView!
    
    
    @IBAction func tooodooo(_ sender: UIButton) {
                
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secImg.image = UIImage(named: "happymeta.png")
        tableView.delegate = self
        tableView.dataSource = self
   
    }
}

extension secView /*여기 파일이 secView 이고 class secView라서*/: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }     //numberOfRowsInSection <---- 하나의 섹션에 몇개의 로우를 만들거야 ? 즉 태이블 뷰가 몇줄이 나오는지는 이 함수에서 정함
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myFirstCell", for: indexPath)//인덱스 패스
        if indexPath.row == 1 {
            cell.textLabel?.text = "111"
        }
        
       // indexPath.section // 인덱스 패스란몇번째 섹션에 몇번째 로우 라는 뜻을 갖음
      //  indexPath.row
        // 즉 바로 위 함수는 총섹션 곱하기 로우 만큼 호출 시킴 0번째 섹션에 0번째 로우 1=인덱스 0
        
        //아이덴티파이어가 등록됬단 가정하에 재사용해서 세을 그려준다
      //  cell.textLabel?.text = "hello chul"
        return cell
    } // cellForRowAt <--- 한줄에 어떤 셀을 넣을건지 ?  리턴에 UITableViewCell이 들어갈거다
    // 테이블 뷰에 셀을 넣어줘야해  그래서 특정 셀 "마이 퍼스트 셀'을 가져왔음
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            print("0입니다")
        } else {
            print(indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if indexPath.row == 0 {
        return .insert
        }else {
            return .delete
        }
    }
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration(actions: [UIContextualAction(style: .destructive, title: "delete", handler: {_,_,_ in })])    }

    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration(actions: [UIContextualAction(style: .normal, title: "edit", handler: {_,_, _ in })])
    }
}
