//
//  FriendCell.swift
//  CustomCellTable
//
//  Created by SeoDongyeon on 2021/10/05.
//

import UIKit
import SnapKit

class FriendCell: UITableViewCell {

    lazy var pictureImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 40
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var item: Friend? {
        didSet {
            guard let item = item else { return }
            
            if let pictureUrl = item.pictureUrl {
                pictureImageView.image = UIImage(named: pictureUrl)
            }
            nameLabel.text = item.name
        }
    }
    
    static var identifier: String {
        return String(describing: self)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        pictureImageView.image = nil
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        contentView.addSubview(pictureImageView)
        pictureImageView.snp.makeConstraints { make in
            make.width.height.equalTo(80)
            make.top.bottom.equalToSuperview().inset(10)
            make.left.equalToSuperview().inset(20)
        }
        
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(pictureImageView.snp.right).offset(20)
        }

    }
}
