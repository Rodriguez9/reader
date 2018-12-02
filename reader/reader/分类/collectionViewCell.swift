import UIKit

class collectionViewCell: UICollectionViewCell{
    
    lazy var igv : UIImageView = {
        let igv = UIImageView()
        igv.frame = CGRect(x: 20, y: 15, width: 60, height: 60)
        return igv
    }()

    lazy var title : UILabel = {
        let title = UILabel()
        title.frame = CGRect(x: 10, y: 75, width: 60, height: 20)
        return title
    }()
    
    override init(frame: CGRect) {
        super .init(frame:frame)
        self.addSubview(igv)
        self.addSubview(title)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
