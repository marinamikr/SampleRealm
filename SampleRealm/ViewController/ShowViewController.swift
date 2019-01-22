//
//  ShowViewController.swift
//  SampleRealm
//
//  Created by 橋詰明宗 on 2019/01/22.
//  Copyright © 2019年 橋詰明宗. All rights reserved.
//

import UIKit
import RealmSwift

class ShowViewController: UIViewController {

    @IBOutlet var showTableView: UITableView!
    var realm :Realm!
    var realmModelArray:Results<RealmModel>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        realm = try! Realm()
        realmModelArray = realm.objects(RealmModel.self)

        // Do any additional setup after loading the view.
        showTableView.dataSource = self
        showTableView.delegate = self
        self.showTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension ShowViewController: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return realmModelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = showTableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        cell.setDate(dateData: realmModelArray[indexPath.row].date)
        cell.setImage(imageData: UIImage(data: realmModelArray[indexPath.row].image as Data)!)
        cell.setContents(contentsData: realmModelArray[indexPath.row].text)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
