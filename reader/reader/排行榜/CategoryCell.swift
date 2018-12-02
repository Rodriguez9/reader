//
//  CategoryCell.swift
//  模仿小说
//
//  Created by 姚智豪 on 2018/11/23.
//  Copyright © 2018年 YZH. All rights reserved.
//

import UIKit
import SDWebImage
import Masonry
class CategoryCell: UITableViewCell {
    
    var _icon : UIImageView?
    var _title : UILabel?
    var _first : UILabel?
    var _second : UILabel?
    var _leaderDetailModel : LeaderboardDetailModel!{
        didSet{
            let url = URL(string: String(format: "%@%@", IMAGE_PRE,(_leaderDetailModel?.coverImgUrl)!))
            self._icon?.sd_setImage(with: url)
            self._title?.text = _leaderDetailModel!.rankName
            self._first?.text = _leaderDetailModel!.book_name
            //self._second?.text = _leaderDetailModel!.rankid
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}

extension CategoryCell{
    
    func setUI(){
        //图片
        let icon = UIImageView()
        icon.backgroundColor = UIColor.black
        self.contentView.addSubview(icon)
         _icon = icon
        
        //标题
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 13)
        title.textColor = UIColor.black
        self.contentView.addSubview(title)
        _title = title
        
        //第一名的书
        let first = UILabel()
        title.font = UIFont.systemFont(ofSize: 9)
        title.textColor = UIColor.lightGray
        self.contentView.addSubview(first)
        _first = first
        
        setConstaints()
    }
    
    func setConstaints(){
        _icon?.mas_makeConstraints({ (make:MASConstraintMaker!) in
            make.left.equalTo()(self.contentView)?.offset()(20)
            make.top.equalTo()(self.contentView)?.offset()(20)
            make.size.mas_equalTo()(CGSize(width: 60, height: 80))//CGSizeMake(60, 80)
        })
        
        _title?.mas_makeConstraints({ (make:MASConstraintMaker!) in
            make.left.equalTo()(self._icon?.mas_right)?.offset()(20)
            make.top.equalTo()(self._icon)?.offset()(5)
            make.right.equalTo()(self.contentView)?.offset()(-30)
        })
        
        _first?.mas_makeConstraints({ (make:MASConstraintMaker!) in
            make.top.equalTo()(self._title?.mas_bottom)?.offset()(10)
            make.left.equalTo()(self._icon?.mas_right)?.offset()(20)
            make.right.equalTo()(self.contentView)?.offset()(-30)
        })
    }
    
    func setLeaderDetailModel(leaderDetailModel:LeaderboardDetailModel){
        _leaderDetailModel = leaderDetailModel
       
    }
    
}
