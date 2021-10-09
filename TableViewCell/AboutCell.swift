//
//  AboutCell.swift
//  CustomCellTable
//
//  Created by SeoDongyeon on 2021/10/05.
//

import UIKit
import SnapKit

class AboutCell: UITableViewCell {

    lazy var aboutLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var item: ProfileViewModelItem? {
        didSet {
            guard let item = item as? ProfileViewModelAboutItem else { return }
            aboutLabel.text = item.about
        }
    }
        
    static var identifier: String {
        return String(describing: self)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        contentView.addSubview(aboutLabel)
        aboutLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(20)
        }
    }
}
