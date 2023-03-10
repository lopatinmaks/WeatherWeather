//
//  CityCell.swift
//  WeatherWeather
//
//  Created by Ольга on 25.01.2023.
//

import UIKit
import CoreGraphics

final class CityCell: UITableViewCell {
    
    //MARK: - IBOutlet
    
//    var titleLabel: UILabel = UILabel()
//    var avatarContainerView: UIView = UIView()
//    var avatarImageView: UIImageView = UIImageView(image: UIImage(named: "images"))
//    let likeControl = LikeControl()
//
//    override func prepareForReuse() {
//        super.prepareForReuse()
//    }
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        avatarContainerView.translatesAutoresizingMaskIntoConstraints = false
//        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
//        likeControl.translatesAutoresizingMaskIntoConstraints = false
//
//        avatarContainerView.layer.cornerRadius = avatarContainerView.bounds.width / 2
//        avatarContainerView.layer.shadowColor = UIColor.black.cgColor
//        avatarContainerView.layer.shadowRadius = 10
//        avatarContainerView.layer.shadowOpacity = 0.5
//        avatarContainerView.layer.shadowOffset = .zero
//        avatarContainerView.layer.shadowPath = UIBezierPath(ovalIn: .init(origin: .zero, size: .init(width: 50, height: 50))).cgPath
//
//        avatarImageView.layer.cornerRadius = 50 / 2
//        avatarImageView.clipsToBounds = true
//
//        contentView.addSubview(titleLabel)
//        contentView.addSubview(avatarContainerView)
//        contentView.addSubview(likeControl)
//        avatarContainerView.addSubview(avatarImageView)
//
//        let labelConstraints = [
//
//            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            titleLabel.leftAnchor.constraint(equalTo: avatarContainerView.rightAnchor, constant: 10)
//        ]
//
//        let avatarConstraints = [
//
//            avatarContainerView.widthAnchor.constraint(equalTo: avatarContainerView.heightAnchor),
//            avatarContainerView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            avatarContainerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
//            avatarContainerView.heightAnchor.constraint(equalToConstant: 50),
//
//            avatarImageView.leftAnchor.constraint(equalTo: avatarContainerView.leftAnchor),
//            avatarImageView.rightAnchor.constraint(equalTo: avatarContainerView.rightAnchor),
//            avatarImageView.topAnchor.constraint(equalTo: avatarContainerView.topAnchor),
//            avatarImageView.bottomAnchor.constraint(equalTo: avatarContainerView.bottomAnchor)
//        ]
//
//        let likeConstraints = [
//
//            likeControl.leftAnchor.constraint(equalTo: titleLabel.rightAnchor),
//            likeControl.rightAnchor.constraint(equalTo: rightAnchor),
//            likeControl.centerYAnchor.constraint(equalTo: centerYAnchor)
//        ]
//
//        NSLayoutConstraint.activate(labelConstraints + avatarConstraints + likeConstraints)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
}
