//
//  PractiseProfileViewModel.swift
//  CustomCellTable
//
//  Created by SeoDongyeon on 2021/10/07.
//

import UIKit

enum ProfileViewModelItemType {
    case nameAndPicture
    case about
    case email
    case attribute
    case friend
}

protocol ProfileViewModelItem {
    var type: ProfileViewModelItemType { get }
    var sectionTitle: String { get }
    var rowCount: Int { get }
}


class ProfileViewModel: NSObject {
    
    var items = [ProfileViewModelItem]()
    
    override init() {
        super.init()
        guard let data = dataFromFile("ServerData"), let profile = Profile(data: data) else { return }
        
        if let name = profile.fullName, let pictureUrl = profile.pictureUrl {
            let nameAndPictureItem = ProfileViewModelNameAndPictureItem(name: name, pictureUrl: pictureUrl)
            items.append(nameAndPictureItem)
        }
        
        if let about = profile.about {
            let aboutItem = ProfileViewModelAboutItem(about: about)
            items.append(aboutItem)
        }
        
        if let email = profile.email {
            let emailItem = ProfileViewModelEmailItem(email: email)
            items.append(emailItem)
        }
        
        let attributes = profile.profileAttributes
        if !attributes.isEmpty {
            let attributesItem = ProfileViewModelAttributesItem(attributes: attributes)
            items.append(attributesItem)
        }
        
        let friends = profile.friends
        if !friends.isEmpty {
            let friendsItem = ProfileViewModelFriendsItem(friends: friends)
            items.append(friendsItem)
        }
    }
}

extension ProfileViewModel: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        switch item.type {
        case .nameAndPicture:
            if let cell = tableView.dequeueReusableCell(withIdentifier: NamePictureCell.identifier, for: indexPath) as? NamePictureCell {
                cell.item = item
                return cell
            }
        case .about:
            if let cell = tableView.dequeueReusableCell(withIdentifier: AboutCell.identifier, for: indexPath) as? AboutCell {
                cell.item = item
                return cell
            }
        case .email:
            if let cell = tableView.dequeueReusableCell(withIdentifier: EmailCell.identifier, for: indexPath) as? EmailCell {
                cell.item = item
                return cell
            }
        case .attribute:
            if let item = item as? ProfileViewModelAttributesItem, let cell = tableView.dequeueReusableCell(withIdentifier: AttributeCell.identifier, for: indexPath) as? AttributeCell {
                cell.item = item.attributes[indexPath.row]
                return cell
            }
        case .friend:
            if let item = item as? ProfileViewModelFriendsItem, let cell = tableView.dequeueReusableCell(withIdentifier: FriendCell.identifier, for: indexPath) as? FriendCell {
                cell.item = item.friends[indexPath.row]
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return items[section].sectionTitle
    }
}

class ProfileViewModelNameAndPictureItem: ProfileViewModelItem {
    
    var type: ProfileViewModelItemType = .nameAndPicture
    var sectionTitle: String = "Main Info"
    var rowCount: Int = 1
    
    var name: String
    var pictureUrl: String
    
    init(name: String, pictureUrl: String) {
        self.name = name
        self.pictureUrl = pictureUrl
    }
}

class ProfileViewModelAboutItem: ProfileViewModelItem {
    
    var type: ProfileViewModelItemType = .about
    var sectionTitle: String = "About"
    var rowCount: Int = 1
    
    var about: String
    
    init(about: String) {
        self.about = about
    }
}

class ProfileViewModelEmailItem: ProfileViewModelItem {
    
    var type: ProfileViewModelItemType = .email
    var sectionTitle: String = "Email"
    var rowCount: Int = 1
    
    var email: String
    
    init(email: String) {
        self.email = email
    }
}

class ProfileViewModelAttributesItem: ProfileViewModelItem {
    
    var type: ProfileViewModelItemType = .attribute
    var sectionTitle: String = "Attribute"
    var rowCount: Int {
        return attributes.count
    }
    
    var attributes: [Attribute]
    
    init(attributes: [Attribute]) {
        self.attributes = attributes
    }
}

class ProfileViewModelFriendsItem: ProfileViewModelItem {
    
    var type: ProfileViewModelItemType = .friend
    var sectionTitle: String = "Friend"
    var rowCount: Int {
        return friends.count
    }
    
    var friends: [Friend]
    
    init(friends: [Friend]) {
        self.friends = friends
    }
}
