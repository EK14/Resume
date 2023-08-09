//
//  ViewController.swift
//  skillsCollectionView
//
//  Created by Элина Карапетян on 07.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private var isEditMode = false
    private var mainView = UIView()
    private var topFillerView = UIView()
    private var bottomView = UIView()
    private var scrollView = UIScrollView()
    private var mySkills = UILabel()
    private var editButton = UIButton()
    private var locationHS = UIStackView()
    
    private var aboutMeDescr: UILabel = {
        let aboutMeDescr = UILabel()
        aboutMeDescr.text = "Experienced software engineer skilled in developing scalable and maintainable systems"
        aboutMeDescr.numberOfLines = 0
        aboutMeDescr.lineBreakMode = .byWordWrapping
        aboutMeDescr.textColor = .black
        aboutMeDescr.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        aboutMeDescr.translatesAutoresizingMaskIntoConstraints = false
        return aboutMeDescr
    }()
    
    private var aboutMeHeader: UILabel = {
        let aboutMeHeader = UILabel()
        aboutMeHeader.text = "About me"
        aboutMeHeader.textColor = .black
        aboutMeHeader.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        aboutMeHeader.translatesAutoresizingMaskIntoConstraints = false
        return aboutMeHeader
    }()
    
    private var descr: UILabel = {
        let descr = UILabel()
        descr.text = "Junior IOS-developer, less than 1 year of experience"
        descr.numberOfLines = 0
        descr.textColor = UIColor(named: "Gray1")
        descr.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        descr.translatesAutoresizingMaskIntoConstraints = false
        return descr
    }()
    
    private var myName: UILabel = {
        let myName = UILabel()
        myName.text = "Karapetian Elina"
        myName.numberOfLines = 0
        myName.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        myName.textColor = .black
        myName.translatesAutoresizingMaskIntoConstraints = false
        return myName
    }()
    
    private var photo: UIImageView = {
        let photo = UIImageView()
        photo.image = UIImage(named: "photo")
        photo.layer.cornerRadius = 60
        photo.clipsToBounds = true
        photo.translatesAutoresizingMaskIntoConstraints = false
        return photo
    }()
    
    private var profile: UILabel = {
        let profile = UILabel()
        profile.text = "Profile"
        profile.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        profile.textColor = .black
        profile.translatesAutoresizingMaskIntoConstraints = false
        return profile
    }()
    
    private var skills = ["UIKit", "Swift", "SwiftUI", "Rust API", "C++", "Python", "MVC", "MVVM", "CoreData", "Data structures"]
    
    private let layout = LeftAlignedCollectionViewFlowLayout()
    lazy var collectionView = DynamicHeightCollectionView(frame: .zero, collectionViewLayout: layout)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setupMainView()
        setupTopFillerView()
        setupProfileLabel()
        setupPhoto()
        setupMyNameLabel()
        setupDescription()
        setupLocation()
        setupBottomView()
        setupEditButton()
        setupLabel()
        setupCollectionView()
        setupAboutMeHeader()
        setupAboutMeDescr()
    }
    
    private func setupAboutMeDescr(){
        bottomView.addSubview(aboutMeDescr)
        aboutMeDescr.topAnchor.constraint(equalTo: aboutMeHeader.bottomAnchor).isActive = true
        aboutMeDescr.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor,constant: -16).isActive = true
        aboutMeDescr.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor,constant: 16).isActive = true
    }
    
    private func setupAboutMeHeader(){
        bottomView.addSubview(aboutMeHeader)
        aboutMeHeader.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20).isActive = true
        aboutMeHeader.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 16).isActive = true
        aboutMeHeader.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func setupBottomView(){
        scrollView.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.topAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        bottomView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
    
    private func setupTopFillerView(){
        view.addSubview(topFillerView)
        topFillerView.translatesAutoresizingMaskIntoConstraints = false
        topFillerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topFillerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topFillerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topFillerView.bottomAnchor.constraint(greaterThanOrEqualTo: mainView.topAnchor).isActive = true
        topFillerView.backgroundColor = UIColor(named: "Gray2")
    }
    
    private func setupLocation(){
        mainView.addSubview(locationHS)
        locationHS.axis = .horizontal
        locationHS.translatesAutoresizingMaskIntoConstraints = false
        let locationImage = UIImageView(image: UIImage(named: "location"))
        let locationName = UILabel()
        locationName.text = "Yerevan"
        locationName.textColor = UIColor(named: "Gray1")
        locationName.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        locationHS.addArrangedSubview(locationImage)
        locationHS.addArrangedSubview(locationName)
        
        locationHS.topAnchor.constraint(equalTo: descr.bottomAnchor).isActive = true
        locationHS.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        locationHS.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -15).isActive = true
    }
    
    private func setupDescription(){
        mainView.addSubview(descr)
        descr.textAlignment = .center
        descr.topAnchor.constraint(equalTo: myName.bottomAnchor, constant: 10).isActive = true
        descr.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 16).isActive = true
        descr.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -16).isActive = true
    }
    
    private func setupMainView(){
        mainView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(mainView)
        mainView.backgroundColor = UIColor(named: "Gray2")
        mainView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        mainView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        mainView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
    
    private func setupMyNameLabel(){
        mainView.addSubview(myName)
        myName.textAlignment = .center
        myName.topAnchor.constraint(equalTo: photo.bottomAnchor, constant: 10).isActive = true
        myName.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 16).isActive = true
        myName.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -16).isActive = true
        myName.heightAnchor.constraint(equalToConstant: 32).isActive = true
    }
    
    private func setupPhoto(){
        mainView.addSubview(photo)
        photo.topAnchor.constraint(equalTo: profile.bottomAnchor, constant: 20).isActive = true
        photo.heightAnchor.constraint(equalToConstant: 120).isActive = true
        photo.widthAnchor.constraint(equalToConstant: 120).isActive = true
        photo.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
    }
    
    
    private func setupScrollView(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.alwaysBounceVertical = true
        scrollView.alwaysBounceVertical = true
        view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    private func setupProfileLabel(){
        mainView.addSubview(profile)
        profile.textAlignment = .center
        profile.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
        profile.heightAnchor.constraint(equalToConstant: 56).isActive = true
        profile.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
    }
    
    private func setupEditButton(){
        editButton.translatesAutoresizingMaskIntoConstraints = false
        editButton.setImage(UIImage(named: "editButton"), for: .normal)
        editButton.addTarget(self, action: #selector(editButtonDidTouched), for: .touchUpInside)
        bottomView.addSubview(editButton)
        editButton.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 15).isActive = true
        editButton.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -16).isActive = true
    }
    
    @objc
    private func editButtonDidTouched(){
        isEditMode.toggle()
        let imageName = isEditMode ? "doneButton" : "editButton"
        editButton.setImage(UIImage(named: imageName), for: .normal)
        collectionView.reloadData()
    }
    
    private func setupLabel(){
        mySkills.translatesAutoresizingMaskIntoConstraints = false
        mySkills.text = "My skills"
        mySkills.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        mySkills.textColor = .black
        bottomView.addSubview(mySkills)
        mySkills.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 15).isActive = true
        mySkills.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 16).isActive = true
    }
    
    private func setupCollectionView(){
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.register(SkillCell.self, forCellWithReuseIdentifier: "skillCell")
        collectionView.register(AddCell.self, forCellWithReuseIdentifier: "addCell")
        scrollView.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: mySkills.bottomAnchor, constant: 20).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 16).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -16).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor).isActive = true
    }
    
    private func getSkillCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "skillCell",
            for: indexPath
        ) as? SkillCell else { return UICollectionViewCell() }
        
        let skill = skills[indexPath.row]
        cell.configure(model: skill, isEditMode: isEditMode, maxWidth: view.frame.width - 40)
        cell.onCloseTapped = { [weak self] in
            guard let self = self else { return }
            self.deleteItem(skillModel: skill)
        }

        return cell
    }
    
    private func getAddCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "addCell",
            for: indexPath
        ) as? AddCell else { return UICollectionViewCell() }
        cell.onAddTapped = {
            self.showAddSkillAlert()
        }
        return cell
    }
    
    private func deleteItem(skillModel: String) {
        guard let index = skills.firstIndex(where: { $0 == skillModel})
        else { return }

        let indexPath = IndexPath(row: index, section: 0)
        skills.remove(at: indexPath.row)
        collectionView.deleteItems(at: [indexPath])
        collectionView.reloadData()
    }
    
    private func showAddSkillAlert() {

        let alert = UIAlertController(title: "Adding a Skill", message: "Enter the name of the skill you are proficient in", preferredStyle: .alert)

        alert.addTextField { textField in
            textField.placeholder = "Enter the title"
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancelAction)
        let addAction = UIAlertAction(title: "Add", style: .default) { _ in
            guard let skill = alert.textFields?.first?.text else { return }
            self.addSkill(name: skill)
        }

        alert.addAction(addAction)
        present(alert, animated: true)
    }
    
    private func addSkill(name: String) {

        let newSkill = name
        skills.append(newSkill)

        collectionView.reloadData()
    }


}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = skills.count

        if isEditMode {
            return count + 1
        } else {
            return count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if isEditMode, indexPath.row == skills.count {
            return getAddCell(collectionView: collectionView, indexPath: indexPath)
        } else {
            return getSkillCell(collectionView: collectionView, indexPath: indexPath)
        }
    }
    
    
}
