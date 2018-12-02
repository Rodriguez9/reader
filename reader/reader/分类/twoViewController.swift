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
    }
}

extension twoViewController : UICollectionViewDelegate{
    
}

extension twoViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: twoViewController.cellID, for: indexPath) as! collectionViewCell
        cell.igv.image = UIImage.init(named: "1")
        cell.title.text = "123"
        return cell
    }
    
    
}
