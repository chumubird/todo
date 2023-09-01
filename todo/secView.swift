//
//  secView.swift
//  todo
//
//  Created by t2023-m0081 on 2023/07/31.
//

import UIKit


class secView: UIViewController {
    
    
    
    
    var todoForAlone : [String] = []  //<-model
    var todoForTogether : [String] = []
    var deletedTodo : [String] = []
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBOutlet weak var showPicker: UITextField!
    
    var pickerList : [String] = ["-------" ,"혼자 할 일" , "같이 할 일"]
    @objc func action() {
           showPicker.resignFirstResponder() // 피커뷰 닫기
       }
    
    @IBAction func goToDoneButton(_ sender: Any) {performSegue(withIdentifier: "showDeleted", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDeleted", let destinationVC = segue.destination as? doneSecView {
            destinationVC.deletedTodo = deletedTodo
            print("던 투두 리스트 페이지로 가볼까 !")
        }
    }
    
    
    
   
    @IBAction func didTabButton(_ sender: UIButton) {
        
        
        
        
        if showPicker.text == "혼자 할 일" {
                    todoForAlone.append(nameTextField.text ?? "empty")
            secImg.image = UIImage(named: "pikachu.jpg")
            func showImageForAWhile() {
                if self.secImg.isHidden == false {
                    self.secImg.isHidden = true
                    self .hiddenImg.image = UIImage(named: "pikachu.jpg")
                    if self .hiddenImg.isHidden == false {
                    }
                }
            }
                }
        else if showPicker.text == "같이 할 일" {
            todoForTogether.append(nameTextField.text ?? "empty")
            secImg.image = UIImage(named: "realswift.jpg")

            func showImageForAWhile() {
                if self.secImg.isHidden == false {
                    self.secImg.isHidden = true
                    self .hiddenImg.image = UIImage(named: "realswift.jpg")
                    if self .hiddenImg.isHidden == false {
                    }
                }
            }
                }
        
        tableView.reloadData()
        nameTextField.text = ""//<--이렇게해주면 버튼누르고 나서 텍스트필드 내용을 클리어 해줌
        saveTodoForAlone()
        saveTodoForTogether()
        
    }
    
    @IBOutlet weak var secImg: UIImageView!
    @IBOutlet weak var hiddenImg: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        secImg.image = UIImage(named: "happymeta.png")
        hiddenImg.isHidden = true
        tableView.delegate = self
        tableView.dataSource = self
        loadTodoForAlone() // <----화면이 표시될 때마다 names 배열을 불러옴
        loadTodoForTogether()
        loadDeletedTodo()
        print("던 투두 목록 : \(deletedTodo)")

        createPickerView(tagNo: 1)
        dismissPickerView()
    }

    override func viewWillAppear(_ animated: Bool) {
        loadDeletedTodo()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("던 투두 목록 : \(deletedTodo)")
        loadDeletedTodo()
    }

    
    
    
    
    
//    func ssackDaGulGirlWa () {
//        let defaults = UserDefaults.standard
//        let allKeys = defaults.dictionaryRepresentation().keys
//
//        for key in allKeys {
//            if let value = defaults.value(forKey: key) {
//                print("Key: \(key), Value: \(value)")
//            }
//        }
//    }
    
    
    
    func saveTodoForAlone() {
        UserDefaults.standard.set(todoForAlone, forKey: "todoForAlone") //<-- 유저디폴트 = 데이터저장소중에 하나 영구적 저장이 가능하며 간단한 데이터값들을 저장하기에 좋은 방법
    }
    
    func loadTodoForAlone() {
        if let savedTodoForAlone = UserDefaults.standard.array(forKey: "todoForAlone") as? [String] {
            todoForAlone = savedTodoForAlone // 불러온 배열이 nil이 아니라면 (데이터가 존재한다면)
            //Thread.sleep(forTimeInterval: 2)
            tableView.reloadData() // names 배열에 불러온 배열을 대입하고 테이블 뷰를 다시 로드하여 데이터를 반영
        }
    }
    
    func saveTodoForTogether() {
        UserDefaults.standard.set(todoForTogether, forKey: "todoForTogether")
    }
    func loadTodoForTogether() {
        if let savedTodoForTogether = UserDefaults.standard.array(forKey: "todoForTogether") as? [String] {
            todoForTogether = savedTodoForTogether
            //Thread.sleep(forTimeInterval: 2)
            tableView.reloadData()
        }
    }
    /*유저디폴트로 데이터 저장 통일을 위해서 이번에 새로 만듬*/
    func saveDeletedTodo() {
        UserDefaults.standard.set(deletedTodo, forKey: "deletedTodo")
    }
    func loadDeletedTodo() {
        if let saveDeletedTodo = UserDefaults.standard.array(forKey: "deletedTodo") as? [String] {
            deletedTodo = saveDeletedTodo
            
        }
    }
}

extension secView /*여기 파일이 secView 이고 class secView라서*/: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2       } // 섹션을 두개 만들어줌 : 혼자할일 / 같이할일 이렇게 두 카테고리로
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let headerName : [String] = ["혼자 할 일", "같이 할 일"]
        return headerName[section]
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0 // 원하는 섹션 높이로 수정해주세요
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return todoForAlone.count
        }
        else {
            return todoForTogether.count
        }
    }     //numberOfRowsInSection <---- 하나의 섹션에 몇개의 로우를 만들거야 ? 즉 태이블 뷰가 몇줄이 나오는지는 이 함수에서 정함
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myFirstCell", for: indexPath)//인덱스 패스
        if indexPath.section == 0 { // 첫 번째 섹션
                cell.textLabel?.text = todoForAlone[indexPath.row]
            } else if indexPath.section == 1 { // 두 번째 섹션
                cell.textLabel?.text = todoForTogether[indexPath.row]
            }
        print("\(todoForAlone) 혼자 할 일 리스트 현황")
        print("\(todoForTogether) 같이 할 일 리스트 현황")

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            tableView.deselectRow(at: indexPath, animated: true)
        } else {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
  
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let doneAction = UIContextualAction(style: .destructive, title: "DONE") { (action, sourceView, completionHandler) in
            if indexPath.section == 0 {
                self.deletedTodo.append(self.todoForAlone[indexPath.row])
                self.todoForAlone.remove(at: indexPath.row) // 데이터 배열에서 해당 인덱스의 데이터를 삭제
                tableView.reloadData() // 테이블 뷰를 리로드하여 삭제된 데이터를 반영해주기
                self.saveTodoForAlone()
                //유저디폴트로 데이터 저장 전달하려고 기존 방식주석처리
                //self.sendingData?.deletedNamesUpdated(self.deletedNames) // 델리게이트를 통해 삭제된 데이터 전달
                completionHandler(true) // 삭제기능
                print("\(self.deletedTodo) 던 투두 리스트 현황")
                //print("유저디폴트에 저장된 던 투두 목록 : \(self.saveDeletedNames())")
            }
            else if indexPath.section == 1 {
                self.deletedTodo.append(self.todoForTogether[indexPath.row])
                self.todoForTogether.remove(at: indexPath.row)
                tableView.reloadData()
                self.saveTodoForTogether()
                completionHandler(true)
                print("\(self.deletedTodo) 던 투두 리스트 현황")
            }
        }
        doneAction.backgroundColor = .systemMint //배경색 넣어주기 스와이프 길이 조절해주려면 해야한다고함 이유는 솔직히 모름 뭔가 공식같은거같아서 그냥 공식같은거같은듯 ?
      
        let deleteAction = UIContextualAction(style: .destructive, title: "DELETE") { (action, sourceView, completionHandler) in
            if indexPath.section == 0 {
                self.todoForAlone.remove(at: indexPath.row)
                tableView.reloadData()
                self.saveTodoForAlone()
                completionHandler(true)
                print("삭제후 남은 forAlone 리스트 목록:\(self.todoForAlone)") //<==== 오류가남;;
            }
            else if indexPath.section == 1 {
                self.todoForTogether.remove(at: indexPath.row)
                tableView.reloadData()
                self.saveTodoForTogether()
                completionHandler(true)
                print("삭제후 남은 forTogether 리스트 목록:\(self.todoForTogether)")
                
            }
        }
        deleteAction.backgroundColor = .systemRed
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction,doneAction])
        swipeConfiguration.performsFirstActionWithFullSwipe = false
        return  swipeConfiguration
    }
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let editAction = UIContextualAction(style: .normal, title: "edit") { (action, sourceView, completionHandler) in
            let alertForEdit = UIAlertController(title: "수정", message: "수정할 것을 적으세요", preferredStyle: .alert)
            
            //알럿창에 텍스트필드 만들어보기
            alertForEdit.addTextField {
                textField in textField.text = indexPath.section == 0 ? self.todoForAlone[indexPath.row] : self.todoForTogether[indexPath.row]
                
                //알럿창에 오케이버튼 기능
                let alertOk = UIAlertAction(title: "OK", style: .default) { (textField) in
                    if let textField = alertForEdit.textFields?.first {
                        if let editTextField = textField.text {
                            //  입력한 내용을 가져와서 처리하는 로직을 추가해야함
                            print("입력한 내용: (editTextField)")
                            if indexPath.section == 0 {
                                // 배열에 입력한 내용 추가
                                self.todoForAlone[indexPath.row] = editTextField
                            }
                            else if indexPath.section == 1 {
                                self.todoForTogether[indexPath.row] = editTextField
                            }
                            // 테이블 뷰 새로 리로드 하기
                            self.saveTodoForAlone()
                            self.saveTodoForTogether()
                            tableView.reloadData()
                            
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
    }
}


extension secView : UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerList.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerList[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        showPicker.text = pickerList[row]
    }
    func createPickerView(tagNo : Int) {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        showPicker.inputView = pickerView
    }
    func dismissPickerView() {
            let toolBar = UIToolbar()
            toolBar.sizeToFit()
            let button = UIBarButtonItem(title: "선택", style: .plain, target: self, action: #selector(self.action))
            toolBar.setItems([button], animated: true)
            toolBar.isUserInteractionEnabled = true
            showPicker.inputAccessoryView = toolBar
    }
}
