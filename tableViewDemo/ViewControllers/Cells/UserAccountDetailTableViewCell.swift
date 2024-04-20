//
//  UserAccountDetailTableViewCell.swift
//  tableViewDemo
//
//  Created by Aswin Gopinathan on 20/04/24.
//

import UIKit

class UserAccountDetailTableViewCell: UITableViewCell {
    static let identifier = String(describing: UserAccountDetailTableViewCell.self)
    
    private lazy var userName = UILabel()
    private lazy var userDetails = UILabel()
    private lazy var userSettingsTitle = UILabel()
    
    private lazy var accessoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")?.withRenderingMode(.alwaysOriginal).withTintColor(.gray)
        return imageView
    }()
    
    private lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile")
        return imageView
    }()
    
    private lazy var divider: UIView = {
        let divider = UIView()
        divider.setHeightConstraint(to: 0.5)
        divider.backgroundColor = .gray
        return divider
    }()
    
    private lazy var userCompleteDetailsHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var userCompleteDetailsVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var userCompleteDetailsHorizontalStackView2: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var userCompleteDetailsVerticalStackView2: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var parentVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var suggestionHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 16
        return stackView
    }()
    
    private lazy var suggestionText: UILabel = {
        let label = UILabel()
        label.text = "Apple ID Suggestions"
        return label
    }()
    
    private lazy var suggestionChevronImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")?.withRenderingMode(.alwaysOriginal).withTintColor(.gray)
        return imageView
    }()
    
    private lazy var notificationBadgeView: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .red
        uiView
            .enableAutoLayout()
            .setHeightConstraint(to: 26)
            .setWidthConstraint(to: 26)
        uiView.layer.cornerRadius = 13
        return uiView
    }()
    
    private lazy var notificationCount: UILabel = {
        let label = UILabel()
        label.text = "2"
        label.textColor = .white
        return label
    }()
    
    func setup() {
        setupContentView()
        setupUserImageView()
        setupUserName()
        setupUserDetails()
        setupSuggestionChevronImageView()
        setupNotificationBadge()
        
        setupUserCompleteDetailsVerticalStackView2()
        setupUserCompleteDetailsHorizontalStackView2()
        setupUserCompleteDetailsVerticalStackView()
        setupUserCompleteDetailsHorizontalStackView()
        setupSuggestionHorizontalStackView()
        
        setupParentVerticalStackView()
    }
    
    private func setupContentView() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 16
    }
    
    private func setupUserName() {
        userName.text = "Aswin Gopinathan"
        userName.font = .systemFont(ofSize: 18)
    }
    
    private func setupUserDetails() {
        userDetails.text = "Apple ID, iCloud, Media & Purchase"
        userDetails.font = .systemFont(ofSize: 14)
    }
    
    private func setupSuggestionChevronImageView() {
        suggestionChevronImageView
            .enableAutoLayout()
            .setHeightConstraint(to: 20)
            .setWidthConstraint(to: 15)
    }
    
    private func setupUserImageView() {
        userImageView
            .enableAutoLayout()
            .setHeightConstraint(to: 50)
            .setWidthConstraint(to: 50)
        
        userImageView.layer.cornerRadius = 24
        userImageView.clipsToBounds = true
        userImageView.contentMode = .scaleAspectFill
    }
    
    private func setupUserCompleteDetailsHorizontalStackView() {
        userCompleteDetailsHorizontalStackView.addArrangedSubview(userImageView)
        userCompleteDetailsHorizontalStackView.addArrangedSubview(userCompleteDetailsVerticalStackView)
    }
    
    private func setupUserCompleteDetailsVerticalStackView2() {
        userCompleteDetailsVerticalStackView2.addArrangedSubview(userName)
        userCompleteDetailsVerticalStackView2.addArrangedSubview(userDetails)
    }
    
    private func setupUserCompleteDetailsHorizontalStackView2() {
        accessoryImageView
            .enableAutoLayout()
            .setHeightConstraint(to: 20)
            .setWidthConstraint(to: 15)
        
        userCompleteDetailsHorizontalStackView2.addArrangedSubview(userCompleteDetailsVerticalStackView2)
        userCompleteDetailsHorizontalStackView2.addArrangedSubview(accessoryImageView)
    }
    
    private func setupUserCompleteDetailsVerticalStackView() {
        userCompleteDetailsVerticalStackView
            .enableAutoLayout()
            .setHeightConstraint(to: 50)
        userCompleteDetailsVerticalStackView.addArrangedSubview(userCompleteDetailsHorizontalStackView2)
        userCompleteDetailsVerticalStackView.addArrangedSubview(divider)
    }
    
    private func setupParentVerticalStackView() {
        parentVerticalStackView
            .add(to: contentView)
            .enableAutoLayout()
            .pinAllSides(to: contentView, top: 4, trailing: 8, bottom: 4, leading: 16)
        
        parentVerticalStackView.addArrangedSubview(userCompleteDetailsHorizontalStackView)
        parentVerticalStackView.addArrangedSubview(suggestionHorizontalStackView)
    }
    
    private func setupSuggestionHorizontalStackView() {
        suggestionHorizontalStackView.addArrangedSubview(suggestionText)
        suggestionHorizontalStackView.addArrangedSubview(notificationBadgeView)
        suggestionHorizontalStackView.addArrangedSubview(suggestionChevronImageView)
    }
    
    private func setupNotificationBadge() {
        notificationCount
            .add(to: notificationBadgeView)
            .enableAutoLayout()
            .setCenterX(to: notificationBadgeView)
            .setCenterY(to: notificationBadgeView)
    }
}
