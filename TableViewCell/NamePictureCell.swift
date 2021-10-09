//
//  NamePictureCell.swift
//  CustomCellTable
//
//  Created by SeoDongyeon on 2021/10/05.
//

import UIKit
import SnapKit

class NamePictureCell: UITableViewCell {

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var pictureImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 50
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    var item: ProfileViewModelItem? {
        didSet {
            guard let item = item as? ProfileViewModelNameAndPictureItem else { return }
            nameLabel.text = item.name
            pictureImageView.image = UIImage(named: item.pictureUrl)
        }
    }
    
    static var identifier: String {
        return String(describing: self)
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
            make.width.height.equalTo(100)
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
