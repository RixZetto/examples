//
//  ViewController.swift
//  seniorios
//
//  Created by Ricardo Rodríguez on 9/20/18.
//  Copyright © 2018 seniorios. All rights reserved.
//

import UIKit

class MainTableVC: UITableViewController {

    //let sections = ["Información", "Metrics", "Volumes"]
    
    var data : [ElementDTO]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        refreshControl?.attributedTitle = NSAttributedString(string: "Loading...")
        refreshControl?.addTarget(self, action: #selector(loadData), for: UIControlEvents.valueChanged)

        tableView.backgroundView = UINib.loadEmptyView()
        
        loadData()
        
    }
    
    func randomIdentifier() -> String {
        let random = arc4random_uniform(3) + 1
        return "style\(random)"
    }

    // MARK: Api
    
    @objc func loadData() {
        Api.listData { (isSuccess, data, error) in
            self.data = data
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
            self.tableView.backgroundView?.isHidden = self.data != nil
            
            Elements.save(data)
        }
    }

    // MARK: TableView methods
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    /* Comentado debido a que la URL original esta rota.
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    */
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return data != nil ? data!.count : 0
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = data![indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: randomIdentifier()) as! CustomCell
        cell.titleText.text = String(item.serviceId!)
        cell.descText.text = item.serviceName
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = UIStoryboard.loadDetail()
        detailVC.element = data![indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}


