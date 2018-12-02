//
//  threeViewController.swift
//  分栏控制器
//
//  Created by YZH on 2018/11/8.
//  Copyright © 2018年 YZH. All rights reserved.
//

import UIKit

class threeViewController: UIViewController {
    
    let arr = ["当前版本","用户协议","联系我们"]
    static let CellId : String = "cellId"
    
    lazy var table : UITableView = {
        let table = UITableView()
        table.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        table.rowHeight = 80
        table.tableFooterView = UIView(frame: CGRect.zero)
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: threeViewController.CellId)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(table)
    }
}

extension threeViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1:
            let xieyi = xieyiViewController()
            self.navigationController?.pushViewController(xieyi, animated: true)
        default:
            break
        }
    }
}

extension threeViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.cellForRow(at: indexPath)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: threeViewController.CellId)
        }
        cell?.textLabel?.text =  String.init(format:arr[indexPath.row])
        switch indexPath.row {
        case 0:
            cell!.detailTextLabel?.text = "V1.0"
        case 2:
            cell!.detailTextLabel?.text = "+8615647264865"
        default:break
        }
        return cell!
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}
