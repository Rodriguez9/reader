//
//  twoViewController.swift
//  分栏控制器
//
//  Created by YZH on 2018/11/8.
//  Copyright © 2018年 YZH. All rights reserved.
//

import UIKit

class twoViewController: UIViewController {
    
    static let cellID : String = "cellID"
    var categories : NSArray = NSArray.init()
    
    lazy var layout : UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: WIDTH/4, height: 150)
       // layout.scrollDirection =  UICollectionView. ScrollDirection.vertical
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        return layout
    }()
    
    lazy var collect : UICollectionView = {
        let collect = UICollectionView(frame: CGRect(x: 0, y: 0, width: WIDTH, height: HEIGHT), collectionViewLayout:layout)
        collect.backgroundColor = UIColor.clear
        collect.scrollsToTop = false
        collect.isPagingEnabled = true
        collect.showsVerticalScrollIndicator = true
        collect.bounces = false
        collect.register(collectionViewCell.classForCoder(), forCellWithReuseIdentifier: twoViewController.cellID)
        collect.dataSource = self
        collect.delegate = self
        
        return collect
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(collect)
        loadData()
    }
}

extension twoViewController{
   @objc func loadData(){
        weak var weakself = self
        APIManager.getBookDetailWithBookId(success: { (categoryModel:CategoryModel!) in
            weakself?.categories = categoryModel.male! as NSArray
            weakself?.collect.reloadData()
        }) { (error:Error?) in
            
        }
    }
}

extension twoViewController : UICollectionViewDelegate{
    
}

extension twoViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let categoryDetailModel = self.categories.object(at: indexPath.row) as! CategoryDetailModel
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: twoViewController.cellID, for: indexPath) as! collectionViewCell
        cell._categoryDetailModel=categoryDetailModel
        return cell
    }
    /*
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let leaderDetailModel = self.leaderboards.object(at: indexPath.row) as! LeaderboardDetailModel
     let cell = tableView.dequeueReusableCell(withIdentifier: oneViewController.cellID, for: indexPath) as! CategoryCell
     cell._leaderDetailModel = leaderDetailModel
     
     return cell
     }
     
     */
    
}
