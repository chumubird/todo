//
//  ViewController.swift
//  todo
//
//  Created by t2023-m0081 on 2023/07/31.
//

import UIKit

class ViewController: UIViewController {

    let animalImage = "https://spartacodingclub.kr/css/images/scc-og.jpg"
    var deletedTodo: [String] = []
    
    @IBOutlet weak var imgView: UIImageView! //이미지뷰는 변수 처리
    
    @IBAction func button1(_ sender: UIButton) {
        print("가 즈 ㅇ ㅏ ")
    }
    
    @IBAction func button2(_ sender: UIButton) {
        print("포기하면 편 해")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = UIImage(named: "meta.jpeg")
        
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        showRandomeURLImage()
    }
    
    func showRandomeURLImage () {
        let urlString = "https://api.thecatapi.com/v1/images/search"
        
        if let url = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error \(error)")
                    return
                }
                if let data = data {
                    do{
                        if let JSONArray = try JSONSerialization.jsonObject(with: data, options: [] ) as? [[String: Any]],
                           let firstImage = JSONArray.first,
                           let urlString = firstImage["url"] as? String,
                           let imageUrl = URL(string: urlString),
                           let imageData = try? Data(contentsOf: imageUrl),
                           let image = UIImage(data: imageData) {
                            
                            DispatchQueue.main.async {
                                
                                self.imgView.image = image
                            }
                        }
                    }
                    catch {
                        print("JSON Parsing Error: \(error)")
                    }
                }
            }
            task.resume()
        }
    }
    
    
    
    
    /* url세션 관련 공부한거 시도해보기*/
//    func getUrlData(){
//        if let url = URL(string: animalImage) {//옵셔널 바인딩 닐이 아닐때
//            let session = URLSession(configuration: .default)
//            let task = session.dataTask(with: url) { data, response, error in
//                if error != nil {
//                    print(error!)
//                    return
//                }
//                if let JSONdata = data {
//                    let JSONdataString = String(data: JSONdata, encoding: .utf8)
//                    //print(JSONdata, response!)
//                    print(JSONdataString!)
//                }
//            }
//            task.resume()
//        }
//
//    }
}

