//
//  FavoriteView.swift
//  FavoriteRxRealm
//
//  Created by Michel Anderson Lutz Teixeira on 20/02/19.
//  Copyright © 2019 Michel Anderson Lutz Teixeira. All rights reserved.
//

import UIKit
enum FavoriteViewState {
    case favourited, notFavourited
}

class FavoriteView: UIView {
    private let sizeIcon = 32
    var didFavorite: (() -> Void)?
    var didUnfavorite: (() -> Void)?

    var viewState: FavoriteViewState = .notFavourited {
        didSet {
            if viewState == .notFavourited {
                favoriteButton.setImage(UIImage(named: "ic_unfavorite_btn")!, for: .normal)
            } else {
                favoriteButton.setImage(UIImage(named: "ic_favorite_btn")!, for: .normal)
            }
        }
    }

    private let favoriteButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
        button.clipsToBounds = true
        button.layer.cornerRadius = button.frame.size.width / 2
        button.setImage(UIImage(named: "ic_unfavorite_btn")!, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 32).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.addTarget(self, action: #selector(touchUpInsideButton), for: .touchUpInside)
        return button
    }()

    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: sizeIcon + 10, height: sizeIcon + 10))
        setupViewConfiguration()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FavoriteView {
    @objc fileprivate func touchUpInsideButton() {
        if viewState == .favourited {
            didUnfavorite?()
            viewState = .notFavourited
        } else {
            viewState = .favourited
            didFavorite?()
        }
    }
}

extension FavoriteView: ViewConfiguration {
    func setupConstraints() {
        favoriteButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        favoriteButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        favoriteButton.widthAnchor.constraint(equalToConstant: CGFloat(sizeIcon)).isActive = true
        favoriteButton.heightAnchor.constraint(equalToConstant: CGFloat(sizeIcon)).isActive = true
    }

    func buildViewHierarchy() {
        addSubview(favoriteButton)
    }
    func configureViews() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = self.frame.width / 2
        widthAnchor.constraint(equalToConstant: CGFloat(sizeIcon + 10)).isActive = true
        heightAnchor.constraint(equalToConstant: CGFloat(sizeIcon + 10)).isActive = true
    }
}

protocol ViewConfiguration: class {
    func setupConstraints()
    func buildViewHierarchy()
    func configureViews()
    func setupViewConfiguration()
}

extension ViewConfiguration {
    func setupViewConfiguration() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }

    func configureViews() {
    }
}
