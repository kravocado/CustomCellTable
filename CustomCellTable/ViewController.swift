//
//  ViewController.swift
//  CustomCellTable
//
//  Created by SeoDongyeon on 2021/10/05.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    fileprivate let viewModel = ProfileViewModel()
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = viewModel
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(AboutCell.self, forCellReuseIdentifier: AboutCell.identifier)
        tableView.register(NamePictureCell.self, forCellReuseIdentifier: NamePictureCell.identifier)
        tableView.register(FriendCell.self, forCellReuseIdentifier: FriendCell.identifier)
        tableView.register(AttributeCell.self, forCellReuseIdentifier: AttributeCell.identifier)
        tableView.register(EmailCell.self, forCellReuseIdentifier: EmailCell.identifier)
        
        setUp()
    }
    
    func setUp() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

