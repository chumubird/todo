//
//  doneSecView.swift
//  todo
//
//  Created by t2023-m0081 on 2023/08/07.
//

import UIKit


class doneSecView: UIViewController  /*, SendingData*/ {
    
 
    var deletedTodo: [String] = []
    

    
    
    @IBAction func deleteDoneList(_ sender: UIBarButtonItem) {
        
        print("지금 던 리스트 목록 \(deletedTodo) -> 모든 던 리스트를 삭제하겠습니다!")
        deletedTodo.removeAll()
        listFromSecViewTable.reloadData()
        saveDeletedTodo()
        print("던 리스트 목록이 완전히 비워졌습니다.")
        print("삭제된 후 , 던 리스트 현황 - >\(deletedTodo)")
    }
    
    
    @IBOutlet weak var listFromSecViewTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.backgroundColor = .red // 연동됬는지 확인용
        
        
        print("던 투두 리스트 페이지 현황\(deletedTodo)")
        
        listFromSecViewTable.delegate = self
        listFromSecViewTable.dataSource = self
        listFromSecViewTable.reloadData()
       
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        saveDeletedTodo()
    }

    func saveDeletedTodo() {
        UserDefaults.standard.set(deletedTodo, forKey: "deletedTodo")
    }
    func loadDeletedTodo() {
        if let savedDeletedTodo = UserDefaults.standard.array(forKey: "deletedTodo") as? [String] {
            deletedTodo = savedDeletedTodo
//            listFromSecViewTable.reloadData()
            
        }
    }

}
extension doneSecView : UITableViewDelegate, UITableViewDataSource {
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return deletedTodo.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "getCellData", for: indexPath)
        // cell에 필요한 데이터를 설정해주세요
        cell.textLabel?.text = deletedTodo[indexPath.row]
        
        return cell
    }
}




