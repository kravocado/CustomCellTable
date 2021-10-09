//
//  AttributeCell.swift
//  CustomCellTable
//
//  Created by SeoDongyeon on 2021/10/05.
//

import UIKit
import SnapKit

class AttributeCell: UITableViewCell {

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        return label
    }()
    
    var item: Attribute?  {
        didSet {
            titleLabel.text = item?.key
            valueLabel.text = item?.value
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
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(20)
        }
        
        contentView.addSubview(valueLabel)
        valueLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(20)
        }
    }
}
