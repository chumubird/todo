//
//  secView.swift
//  todo
//
//  Created by t2023-m0081 on 2023/07/31.
//

import UIKit

class secView: UIViewController {
        
    var names : [String] = []  //<-model
    //MVC view model controller
    
    
    @IBAction func alertButton(_ sender: UIButton) {
        // alert의 메인 타이틀
                let alertController = UIAlertController(title: "To Do List", message: "할 것을 적어보아요", preferredStyle: .alert)
                // placeHolder
                alertController.addTextField { (textField) in
                    textField.placeholder = "여기에 할 일을 적어주세요"
                }
                // alert의 저장 버튼
                let saveAction = UIAlertAction(title: "ADD", style: .default) { [unowned alertController] _ in
                    if let textField = alertController.textFields?.first, let text = textField.text {
                        // 텍스트 필드의 값이 비어 있지 않다면 UserDefaults에 저장합니다.
                        if !text.isEmpty {
                       
                            
                        }
                    }
                 
                }
                // alert의 취소 버튼
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                // 버튼 두 개를 alert창에 추가 ( addView와 비슷한 역할 )
                alertController.addAction(saveAction)
                alertController.addAction(cancelAction)
                // alert창을 보여주는 present 메서드 ( 이게 없으면 보이지 않는다 )
                present(alertController, animated: true, completion: nil)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    
    
    
    
    
    
    ///텍스트필드에 작성후 버튼을 눌르면 테이블뷰 셀에 적용됨
    @IBAction func didTabButton(_ sender: UIButton) {
        
        names.append(nameTextField.text ?? "empty")//업데이트됬어
        print(names)
        tableView.reloadData()//업데이트됫으니까 화면에 보여줘봐
        nameTextField.text = ""//<--이렇게해주면 버튼누르고 나서 텍스트필드 내용을 클리어 해줌
      
    }
    
    
    
    
    
    @IBOutlet weak var secImg: UIImageView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        secImg.image = UIImage(named: "happymeta.png")
        ///테이블뷰 초기화
        tableView.delegate = self
        tableView.dataSource = self
   
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSecViewSec" {
            ///새 화면을 그려주기위해서 segue를 썼음
            ///한화면에 다른 데이터를 뿌림 어떤 셀이 눌렷는지에 그 인덱스를 갖고 그려줌
            ///데스티네이션을 만들고 투두섬띵을 넣었는대
            ///화면이 secviewsec에 뷰딛로드 가 그려주기도 전에 접근해서 값을 넣어서
            ///todosomething라벨 떄문에 오류가 생겼지만
            ///꼼수아닌 꼼수로 일단을 빈 문자열을 넣게해서그림을 그리게하고
            ///그 밖에서 값을 바꿔 넣을수있게함
            
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPath(for: cell)
            let index = indexPath!.row ?? 0
            
            let secsecView = segue.destination as! secViewSec
            secsecView.setLable(with: names[index])
                
            
            //secsecView.toDoSomething.text = names[index]
            
            if names[index]  == "chul" {
                secsecView.view.backgroundColor = .blue
            } else {
                secsecView.view.backgroundColor = .yellow
            }

        }
    }
}

extension secView /*여기 파일이 secView 이고 class secView라서*/: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
        
    }     //numberOfRowsInSection <---- 하나의 섹션에 몇개의 로우를 만들거야 ? 즉 태이블 뷰가 몇줄이 나오는지는 이 함수에서 정함
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myFirstCell", for: indexPath)//인덱스 패스
        cell.textLabel?.text = names[indexPath.row]
      
        //
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
            tableView.deselectRow(at: indexPath, animated: true)
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
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration(actions: [UIContextualAction(style: .destructive, title: "delete", handler: {_,_,_ in })])    }

    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        return UISwipeActionsConfiguration(actions: [UIContextualAction(style: .normal, title: "edit", handler: {_,_, _ in })])
    }
}
