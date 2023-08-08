//
//  secView.swift
//  todo
//
//  Created by t2023-m0081 on 2023/07/31.
//

import UIKit




class secView: UIViewController {
    
    var names : [String] = []  //<-model
    //  var editTextField : [String] = []
    //MVC view model controller
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBAction func goToDoneButton(_ sender: UIBarButtonItem) {
    }
    ///텍스트필드에 작성후 버튼을 눌르면 테이블뷰 셀에 적용됨
    @IBAction func didTabButton(_ sender: UIButton) {
        func showImageForAWhile() {
            // 데이터를 names 배열에 추가하고 delegate를 통해 데이터 전달
            if let data = nameTextField.text, !data.isEmpty {
                names.append(data)
                
            }
            if self.secImg.isHidden == false {
                self.secImg.isHidden = true
                self .hiddenImg.image = UIImage(named: "angry.jpg")
                if self .hiddenImg.isHidden == false {
                    
                }
            }
        }
        secImg.image = UIImage(named: "angry.jpg")
        names.append(nameTextField.text ?? "empty")//업데이트됬어
        print(names)
        tableView.reloadData()//업데이트됫으니까 화면에 보여줘봐
        nameTextField.text = ""//<--이렇게해주면 버튼누르고 나서 텍스트필드 내용을 클리어 해줌
        saveNames() // <----이 버튼을 눌렀을때 names배열에 텍스트필드 입력값이 들어가고 저장이 되어야 어플에서 저장이 반영됨
        //secImg.image = UIImage(named: "angry.jpg")
    }
    
    @IBOutlet weak var secImg: UIImageView!
    
    
    @IBOutlet weak var hiddenImg: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        secImg.image = UIImage(named: "happymeta.png")
        hiddenImg.isHidden = true
        tableView.delegate = self
        tableView.dataSource = self
        loadNames() // <----화면이 표시될 때마다 names 배열을 불러옴
    }
    
    
    func saveNames() {
        UserDefaults.standard.set(names, forKey: "names") //<-- 유저디폴트 = 데이터저장소중에 하나 영구적 저장이 가능하며 간단한 데이터값들을 저장하기에 좋은 방법
    }
    
    func loadNames() {
        if let savedNames = UserDefaults.standard.array(forKey: "names") as? [String] {
            names = savedNames // 불러온 배열이 nil이 아니라면 (데이터가 존재한다면)
            tableView.reloadData() // names 배열에 불러온 배열을 대입하고 테이블 뷰를 다시 로드하여 데이터를 반영
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
        
        
        // indexPath.section // 인덱스 패스란몇번째 섹션에 몇번째 로우 라는 뜻을 갖음
        //  indexPath.row
        // 즉 바로 위 함수는 총섹션 곱하기 로우 만큼 호출 시킴 0번째 섹션에 0번째 로우 1=인덱스 0
        //아이덴티파이어가 등록됬단 가정하에 재사용해서 셀을 그려준다
        //  cell.textLabel?.text = "hello chul"
        
        return cell
    } // cellForRowAt <--- 한줄에 어떤 셀을 넣을건지 ?  (리턴에 UITableViewCell를 상수 let cell) 선언한것 이 들어갈거다
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
    //    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
    //        if indexPath.row == 0 {
    //            return .insert
    //        }else {
    //            return .delete
    //        }
    //    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "delete") { (action, sourceView, completionHandler) in
            self.names.remove(at: indexPath.row) // 데이터 배열에서 해당 인덱스의 데이터를 삭제
            tableView.reloadData() // 테이블 뷰를 리로드하여 삭제된 데이터를 반영해주기
            self.saveNames()
            completionHandler(true) // 삭제기능
        }
        deleteAction.backgroundColor = .red //배경색 넣어주기 스와이프 길이 조절해주려면 해야한다고함 이유는 솔직히 모름 뭔가 공식같은거같아서 그냥 공식같은거같은듯 ?
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])// 약간 공식같은듯
        swipeConfiguration.performsFirstActionWithFullSwipe = false // 폴스로 해야됨
        return  swipeConfiguration
        //  return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let editAction = UIContextualAction(style: .normal, title: "edit") { (action, sourceView, completionHandler) in
            let alertForEdit = UIAlertController(title: "수정", message: "수정할 것을 적으세요", preferredStyle: .alert)
            
            //알럿창에 텍스트필드 만들어보기
            alertForEdit.addTextField {
                textField in textField.text = self.names[indexPath.row]
                
                //알럿창에 오케이버튼 기능
                let alertOk = UIAlertAction(title: "OK", style: .default) { (textField) in
                    if let textField = alertForEdit.textFields?.first {
                        if let editTextField = textField.text {
                            //  입력한 내용을 가져와서 처리하는 로직을 추가해야함
                            print("입력한 내용: (editTextField)")
                            
                            // 배열에 입력한 내용 추가
                            self.names[indexPath.row] = editTextField
                            
                            // 테이블 뷰 새로 리로드 하기
                            tableView.reloadData()
                            self.saveNames()
                            print("수정됨")
                        }
                    }
                }
                alertForEdit.addAction(alertOk)
                
                // 4. 취소 버튼 추가
                let alertCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                alertForEdit.addAction(alertCancel)
            }
            
            self.present(alertForEdit, animated: true, completion: nil)
        }
        editAction.backgroundColor = .systemBlue
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [editAction])
        swipeConfiguration.performsFirstActionWithFullSwipe = false
        return        swipeConfiguration
        //  return UISwipeActionsConfiguration(actions: [editAction])
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dataGet" {
            if let cell = sender as? UITableViewCell,
               let indexPath = tableView.indexPath(for: cell) {
                let selectedData = names[indexPath.row]
                
                if let destinationVC = segue.destination as? doneSecView {
                    destinationVC.doneName = [selectedData] // 선택한 데이터를 doneName에 추가
                }
                
                names.remove(at: indexPath.row) // secView에서 선택한 데이터 삭제
                tableView.reloadData() // 테이블 뷰 리로드하여 변경된 데이터 반영
                saveNames() // 변경된 데이터 저장
                
            }
        }
    }
}


