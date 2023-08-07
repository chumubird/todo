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
        view.backgroundColor = .red // 연동됬는지 확인용
        
        
      
    }
    func saveDataFromSecView(data: String) {
        UserDefaults.standard.set(data, forKey: "receivedData")
    }
    
    
    
}

extension doneSecView : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doneName.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "getCellData", for: indexPath)
        // cell에 필요한 데이터를 설정해주세요
        cell.textLabel?.text = doneName[indexPath.row]
        
        return cell
    }
}
