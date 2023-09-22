//
//  ProfileViewController.swift
//  todo
//
//  Created by t2023-m0081 on 2023/09/13.
//

// MARK: - ProfileViewController.SWIFT

import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage
import SnapKit
import UIKit

// MARK: - UIViewController : ProfileViewController

class ProfileViewController: UIViewController {
    let storage = Storage.storage()
    
    var images: [UIImage] = []

    // MARK: - UI

    private let profilePageNameLabel = {
        let label = UILabel()
        label.text = "METAMONG"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 18)
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
        imageView.image = UIImage(named: "meme")
        imageView.layer.cornerRadius = 40
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var postCountLabel = {
        let label = UILabel()
        label.text = "\(images.count)"
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
        label.text = "메타몽"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    private let userProfileTextLabel = {
        let label = UILabel()
        label.text = "iOS pokémon"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private let userProfileLinkLabel = {
        let label = UILabel()
        label.text = "브금"
        label.textColor = UIColor.systemBlue
        label.font = UIFont.systemFont(ofSize: 16)
        
        return label
    }()
    
    private let followButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.gray.cgColor
        button.setTitle("Follow", for: .selected)
        button.setTitle("Clicked!", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(UIColor.systemCyan, for: .normal)
        button.setTitleColor(UIColor.black, for: .selected)
        button.backgroundColor = UIColor(named: "buttonSelectedColor")
        button.isSelected = !button.isSelected
        return button
    }()
    
    private let messageButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.gray.cgColor
        button.setTitle("Message", for: .selected)
        button.setTitle("Clicked!", for: .normal)
        button.setTitleColor(UIColor.systemCyan, for: .normal)
        button.setTitleColor(UIColor.black, for: .selected)
        button.backgroundColor = UIColor(named: "buttonSelectedColor")
        button.isSelected = !button.isSelected
        return button
    }()
    
    private let seeMoreImageButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "More"), for: .selected)
        button.contentMode = .scaleAspectFit
        button.setImage(UIImage(named: "More1"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.isSelected = false
        return button
    }()
    
    private lazy var profilePageCollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        
        collectionViewLayout.scrollDirection = .vertical
        collectionViewLayout.minimumLineSpacing = 10
        collectionViewLayout.minimumInteritemSpacing = 10
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

        collectionViewLayout.itemSize = CGSize(width: 110, height: 110)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.layer.cornerRadius = 10
        collectionView.clipsToBounds = true

        collectionView.backgroundColor = UIColor(named: "collectionViewBackgroundColor")
    
        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCell")
        
        return collectionView
    }()
    
    private let photoLibraryButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.gray.cgColor
        button.setTitle("+ PHOTO", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.clear
        return button
    }()
    
    private let backGroundImage = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pokemonLogo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "metamongColor")
        
        buttonClickEvent()
        
        configureLayout()
        
        profilePageCollectionView.isHidden = true
        
       
        downloadImagesFromFirebaseStorage {
            
            self.postCountLabel.text = "\(self.images.count)"
            self.profilePageCollectionView.reloadData()
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        view.addSubview(postCountLabel)
    }
    
    // MARK: - UI layout

    func configureLayout() {
        for subview in [profilePageNameLabel, profilePageMenuButtonImageView, profilePhotoImage,
                        postCountLabel, followerCountLabel, followingCountLabel, postLabel, followerLabel, followingLabel,
                        userNameLabel,
                        userProfileTextLabel, userProfileLinkLabel,
                        followButton, messageButton,
                        seeMoreImageButton, photoLibraryButton, profilePageCollectionView, backGroundImage]
        {
            view.addSubview(subview)
        }

        profilePageNameLabel.snp.makeConstraints { make in
            make.width.equalTo(120)
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
            make.width.equalTo(28)
            make.height.equalTo(22)
            make.centerX.equalTo(postLabel)
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
        
        seeMoreImageButton.snp.makeConstraints { make in
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.leading.equalToSuperview().offset(330)
            make.top.equalToSuperview().offset(265)
        }
        
        photoLibraryButton.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.top.equalTo(profilePageCollectionView.snp.bottom)
        }
        
        profilePageCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(300)
            make.bottom.equalToSuperview().offset(-60)
            make.leading.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().offset(-5)
        }
        
        backGroundImage.snp.makeConstraints { make in
            make.top.equalTo(profilePageCollectionView)
            make.bottom.equalTo(profilePageCollectionView)
            make.leading.equalTo(profilePageCollectionView)
            make.trailing.equalTo(profilePageCollectionView)
        }
    }

    // MARK: - firebase
   
    func uploadImageToFirebaseStorage(image: UIImage, completion: @escaping (URL?) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            completion(nil)
            return
        }
        let storageRef = Storage.storage().reference()
        let imageName = "\(UUID().uuidString).jpg"
        let imageRef = storageRef.child("images/\(imageName)")

        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"

        imageRef.putData(imageData, metadata: metadata) { _, error in
            if let error = error {
                print("Error uploading image to Firebase Storage: \(error.localizedDescription)")
                completion(nil)
            } else {
                imageRef.downloadURL { url, error in
                    if let imageUrl = url {
                        completion(imageUrl)
                    } else {
                        print("Error retrieving download URL: \(error?.localizedDescription ?? "")")
                        completion(nil)
                    }
                }
            }
        }
    }

    // Firebase Storage에서 이미지 다운로드 함수
    func downloadImagesFromFirebaseStorage(completion: @escaping () -> Void) {
        let storageRef = Storage.storage().reference().child("images")

        storageRef.listAll { result, error in
            if let error = error {
                print("Error listing files in Firebase Storage: \(error.localizedDescription)")
                completion()
            } else {
                var downloadedImages: [UIImage] = []

                let group = DispatchGroup()

                for item in result!.items {
                    group.enter()

                    item.getData(maxSize: 10 * 1024 * 1024) { data, error in
                        defer {
                            group.leave()
                        }

                        if let error = error {
                            print("Error downloading image: \(error.localizedDescription)")
                        } else if let data = data, let image = UIImage(data: data) {
                            downloadedImages.append(image)
                        }
                    }
                }

                group.notify(queue: .main) {
                 
                    self.images = downloadedImages
                    completion()
                }
            }
        }
    }

    // MARK: - Function

    @objc func seeMoreButtonClick(_ sender: UIButton) {
        seeMoreImageButton.isSelected.toggle()
        if profilePageCollectionView.isHidden == true {
            backGroundImage.isHidden = true
            profilePageCollectionView.isHidden = false
        } else if profilePageCollectionView.isHidden == false {
            backGroundImage.isHidden = false
            profilePageCollectionView.isHidden = true
        }
    }
    
    @objc func openPhotoLibrary(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
   
    @objc func userProfileLinkLabelOpenURL(_ sender: UILabel) {
        if let url = URL(string: "https://www.youtube.com/watch?v=qG9RQK_4ASM") {
            UIApplication.shared.open(url)
        }
    }
    
    func buttonClickEvent() {
        seeMoreImageButton.addTarget(self, action: #selector(seeMoreButtonClick(_:)), for: .touchUpInside)
        
        photoLibraryButton.addTarget(self, action: #selector(openPhotoLibrary), for: .touchUpInside)
        
        let userProfileLinkLabelTapGesture = UITapGestureRecognizer(target: self, action: #selector(userProfileLinkLabelOpenURL))
        userProfileLinkLabel.isUserInteractionEnabled = true
        userProfileLinkLabel.addGestureRecognizer(userProfileLinkLabelTapGesture)
    }
}

// MARK: - extension/UICollectionViewDelegate , UICollectionViewDataSource

extension ProfileViewController: UICollectionViewDelegate {
    //
}

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as? CustomCollectionViewCell else { return UICollectionViewCell() }
    
        let imageView = UIImageView(image: images[indexPath.item])
      
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        cell.addSubview(imageView)
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(cell.snp.edges)
        }
             
        return cell
    }
}

// MARK: - extension/UIImagePickerControllerDelegate

extension ProfileViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let selectedImage = info[.originalImage] as? UIImage { uploadImageToFirebaseStorage(image: selectedImage) { imageUrl in
            if imageUrl != nil {
              
                self.images.append(selectedImage)
                self.postCountLabel.text = "\(self.images.count)"
                self.profilePageCollectionView.reloadData()
            } else {
               
                print("Failed to upload image to Firebase Storage.")
            }
        }
        }

//            images.append(selectedImage)
//            postCountLabel.text = "\(images.count)"
//            profilePageCollectionView.reloadData()
            
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

// MARK: - extension/UINavigationControllerDelegate

extension ProfileViewController: UINavigationControllerDelegate {
    //
}



