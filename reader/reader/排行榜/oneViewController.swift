//
//  oneViewController.swift
//  分栏控制器
//
//  Created by YZH on 2018/11/8.
//  Copyright © 2018年 YZH. All rights reserved.
//

import UIKit
import MJRefresh
class oneViewController: UIViewController {
    static let cellID : String = "cellID"
    var tab :UITableView?
    var leaderboards : NSArray = NSArray.init()
    
    lazy var table : UITableView = {
        let table = UITableView()
        table.rowHeight = 120
        table.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height)
        table.tableFooterView = UIView(frame: CGRect.zero)
        table.dataSource = self
        table.delegate = self
        table.register(CategoryCell.classForCoder(), forCellReuseIdentifier: oneViewController.cellID)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        tab = table
        view.addSubview(table)
        Refresh()
    }
}

extension oneViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.leaderboards.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let leaderDetailModel = self.leaderboards.objectAtIndex(index: indexPath.row) as! LeaderboardDetailModel
        let cell = tableView.dequeueReusableCell(withIdentifier: oneViewController.cellID, for: indexPath) as! CategoryCell
        cell._leaderDetailModel = leaderDetailModel
        
        return cell
    }
}

extension oneViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

//刷新数据
extension oneViewController{
    func Refresh(){
        //   创建刷新空间
        tab?.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(loadData))
        //   自动改变透明度
        tab?.mj_header.isAutomaticallyChangeAlpha = true
        //立刻刷新
        tab?.mj_header.beginRefreshing()
    }
    
    @objc func loadData(){
        weak var weakself = self
        
        APIManager.getNovelLeaderboardSuccess(success: { (leaderboardModel:LeaderboardModel!) in
            weakself?.tab?.mj_header.endRefreshing()
            weakself?.leaderboards = leaderboardModel!.item as! NSArray
            weakself?.tab?.reloadData()
        }, failure: { (error:Error?) in
            weakself?.tab?.mj_header.endRefreshing()
        })
    }
}

extension NSArray{
    func objectAtIndex(index:Int) -> Any? {
        if self.count > index{
            return self.object(at: index)
        }
        return nil
    }
}
