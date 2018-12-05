import UIKit
import Masonry
class collectionViewCell: UICollectionViewCell{
    
    lazy var igv : UIImageView = {
        let igv = UIImageView()
        return igv
    }()

    lazy var title : UILabel = {
        let title = UILabel()
        return title
    }()
    
    var _categoryDetailModel : CategoryDetailModel!{
        didSet{
            
            self.title.text = _categoryDetailModel!.name
            let url = URL(string: String(format: "%@%@", IMAGE_PRE,(_categoryDetailModel?.bookCover.last)! as! CVarArg))
            self.igv.sd_setImage(with: url)
    }
}
    
    override init(frame: CGRect) {
        super .init(frame:frame)
        
        self.addSubview(igv)
        self.addSubview(title)
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI(){
        igv.mas_makeConstraints { (make:MASConstraintMaker!) in
            make.left.equalTo()(self.contentView)?.offset()(20)
            make.top.equalTo()(self.contentView)?.offset()(20)
            make.size.mas_equalTo()(CGSize(width: WIDTH/5, height: 120))
            make.right.equalTo()(self.contentView)?.offset()(5)
        }
        title.mas_makeConstraints { (make:MASConstraintMaker!) in
            make.top.equalTo()(self.igv.mas_bottom)?.offset()(3)
          // make.bottom.equalTo()(self.contentView)?.offset()(5)
        }
    }
   
}
