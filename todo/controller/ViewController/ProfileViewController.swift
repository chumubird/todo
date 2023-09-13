//
//  ProfileViewController.swift
//  todo
//
//  Created by t2023-m0081 on 2023/09/13.
//

import SnapKit
import UIKit

class ProfileViewController: UIViewController {
    private let profilePageNameLabel = {
        let label = UILabel()
        label.text = "nabaecamp"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.attributedText = NSMutableAttributedString(string: "nabaecamp", attributes: [NSAttributedString.Key.kern: -1])
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private let profilePageMenuButtonImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Menu")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let profilePhotoImage = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "UserPic")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let postCountLabel = {
        let label = UILabel()
        label.text = "7"
        label.font = UIFont.boldSystemFont(ofSize: 16.5)
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    
    private let postLabel = {
        let label = UILabel()
        label.text = "post"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    
    private let followerCountLabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.boldSystemFont(ofSize: 16.5)
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    
    private let followerLabel = {
        let label = UILabel()
        label.text = "follower"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    
    private let followingCountLabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.boldSystemFont(ofSize: 16.5)
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    
    private let followingLabel = {
        let label = UILabel()
        label.text = "following"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    
    private let userNameLabel = {
        let label = UILabel()
        label.text = "르탄이"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    private let userProfileTextLabel = {
        let label = UILabel()
        label.text = "iOS Developer 🍎"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private let userProfileLinkLabel = {
        let label = UILabel()
        label.text = "spartacodingclub.kr"
        label.textColor = UIColor.systemBlue
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private let followButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitle("Follow", for: .normal)
        button.setTitle("Clicked!", for: .selected)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleColor(UIColor.black, for: .selected)
        button.backgroundColor = UIColor.systemBlue
        return button
    }()
    
    private let messageButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.gray.cgColor
        button.setTitle("Message", for: .normal)
        button.setTitle("Clicked!", for: .selected)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
       
        return button
    }()
    
    private let seeMoreImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "More")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        configureLayout()
    }
    
    func configureLayout() {
        for subview in [profilePageNameLabel, profilePageMenuButtonImageView, profilePhotoImage,
                        postCountLabel, followerCountLabel, followingCountLabel, postLabel, followerLabel, followingLabel,
                        userNameLabel,
                        userProfileTextLabel, userProfileLinkLabel,
                        followButton, messageButton,
                        seeMoreImageView]
        {
            view.addSubview(subview)
        }

        profilePageNameLabel.snp.makeConstraints { make in
            make.width.equalTo(97)
            make.height.equalTo(25)
            make.leading.equalToSuperview().offset(139)
            make.top.equalToSuperview().offset(54)
        }
        
        profilePageMenuButtonImageView.snp.makeConstraints { make in
            make.width.equalTo(21)
            make.height.equalTo(17.5)
            make.leading.equalToSuperview().offset(338)
            make.top.equalToSuperview().offset(58)
        }

        profilePhotoImage.snp.makeConstraints { make in
            make.width.equalTo(88)
            make.height.equalTo(88)
            make.leading.equalToSuperview().offset(14)
            make.top.equalToSuperview().offset(93)
        }
        
        postCountLabel.snp.makeConstraints { make in
            make.width.equalTo(10)
            make.height.equalTo(22)
            make.leading.equalToSuperview().offset(152)
            make.top.equalToSuperview().offset(116)
        }
        
        followerCountLabel.snp.makeConstraints { make in
            make.width.equalTo(10)
            make.height.equalTo(22)
            make.leading.equalToSuperview().offset(232)
            make.top.equalToSuperview().offset(116)
        }
        
        followingCountLabel.snp.makeConstraints { make in
            make.width.equalTo(10)
            make.height.equalTo(22)
            make.leading.equalToSuperview().offset(314)
            make.top.equalToSuperview().offset(116)
        }
        
        postLabel.snp.makeConstraints { make in
            make.width.equalTo(28)
            make.height.equalTo(19)
            make.leading.equalToSuperview().offset(143)
            make.top.equalToSuperview().offset(138)
        }
        
        followerLabel.snp.makeConstraints { make in
            make.width.equalTo(51)
            make.height.equalTo(19)
            make.leading.equalToSuperview().offset(213)
            make.top.equalToSuperview().offset(138)
        }
        
        followingLabel.snp.makeConstraints { make in
            make.width.equalTo(57)
            make.height.equalTo(19)
            make.leading.equalToSuperview().offset(290)
            make.top.equalToSuperview().offset(138)
        }
        
        userNameLabel.snp.makeConstraints { make in
            make.width.equalTo(50)
            make.height.equalTo(19)
            make.leading.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(195)
        }
        
        userProfileTextLabel.snp.makeConstraints { make in
            make.width.equalTo(345)
            make.height.equalTo(19)
            make.leading.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(216)
        }
        
        userProfileLinkLabel.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(19)
            make.leading.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(235)
        }
        
        followButton.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(30)
            make.leading.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(265)
        }
        
        messageButton.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(30)
            make.leading.equalToSuperview().offset(173)
            make.top.equalToSuperview().offset(265)
        }
        
        seeMoreImageView.snp.makeConstraints { make in
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.leading.equalToSuperview().offset(330)
            make.top.equalToSuperview().offset(265)
        }
    }
}
