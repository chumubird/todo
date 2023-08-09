//
//  doneSecView.swift
//  todo
//
//  Created by t2023-m0081 on 2023/08/07.
//

import UIKit

class doneSecView: UIViewController  {
    
    
    var doneName : [String] = []
    
    //@IBOutlet weak var getDataFromSecView: UILabel!
    
    @IBOutlet weak var listFromSecViewTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //view.backgroundColor = .red // 연동됬는지 확인용
        listFromSecViewTable.delegate = self
        listFromSecViewTable.dataSource = self
        saveDoneNames()
        loadDoneNames()
        
    }
    func saveDoneNames() {
        UserDefaults.standard.set(doneName, forKey: "doneName") //<-- 유저디폴트 = 데이터저장소중에 하나 영구적 저장이 가능하며 간단한 데이터값들을 저장하기에 좋은 방법
    }
    func loadDoneNames() {
        if let savedDoneNames = UserDefaults.standard.array(forKey: "doneName") as? [String] {
            doneName = savedDoneNames // 불러온 배열이 nil이 아니라면 (데이터가 존재한다면)
            
        }
    }
}


extension doneSecView : UITableViewDelegate, UITableViewDataSource, DoneSecViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doneName.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "getCellData", for: indexPath)
        // cell에 필요한 데이터를 설정해주세요
        cell.textLabel?.text = doneName[indexPath.row]
                        
        
        
        return cell
    }
    func getDoneNames() -> [String] {
        return doneName
    }
    func addDoneName(_ name: String) {
        doneName.append(name)
        saveDoneNames()
        loadDoneNames()
        print(doneName)
        
        
    }
}

