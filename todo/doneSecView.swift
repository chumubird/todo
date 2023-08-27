//
//  doneSecView.swift
//  todo
//
//  Created by t2023-m0081 on 2023/08/07.
//

import UIKit


class doneSecView: UIViewController  /*, SendingData*/ {
    
    
//    func deletedNamesUpdated(_ names: [String]) {
//        deletedNames = names
//        print("\(deletedNames) 딜리트")
//        listFromSecViewTable.reloadData() // 삭제된 데이터를 테이블에 반영
//    }
    
    var deletedNames: [String] = []
    

    
    
    @IBAction func deleteDoneList(_ sender: UIBarButtonItem) {
        
        print("지금 던 리스트 목록 \(deletedNames) -> 모든 던 리스트를 삭제하겠습니다!")
        deletedNames.removeAll()
        listFromSecViewTable.reloadData()
        saveDeletedNames()
        print("던 리스트 목록이 완전히 비워졌습니다.")
        print("삭제된 후 , 던 리스트 현황 - >\(deletedNames)")
    }
    
    
    @IBOutlet weak var listFromSecViewTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.backgroundColor = .red // 연동됬는지 확인용
        
        
        print("던 투두 리스트 페이지 현황\(deletedNames)")
        listFromSecViewTable.delegate = self
        listFromSecViewTable.dataSource = self
        listFromSecViewTable.reloadData()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        listFromSecViewTable.reloadData()
        }
    
    
    
    func saveDeletedNames() {
        UserDefaults.standard.set(deletedNames, forKey: "deletedNames")
    }
    func loadDeletedNames() {
        if let savedDeletedNames = UserDefaults.standard.array(forKey: "deletedNames") as? [String] {
            deletedNames = savedDeletedNames
            listFromSecViewTable.reloadData()
            
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        //loadDeletedNames()
        listFromSecViewTable.reloadData()
    }
}
extension doneSecView : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return deletedNames.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "getCellData", for: indexPath)
        // cell에 필요한 데이터를 설정해주세요
        cell.textLabel?.text = deletedNames[indexPath.row]
        
        return cell
    }
}




