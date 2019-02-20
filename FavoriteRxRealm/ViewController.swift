//
//  ViewController.swift
//  FavoriteRxRealm
//
//  Created by Michel Anderson Lutz Teixeira on 20/02/19.
//  Copyright © 2019 Michel Anderson Lutz Teixeira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var favoriteView1: FavoriteToolView!
    var favoriteView2: FavoriteToolView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let favorite1 = FavoriteTool()
        favorite1.id = "3d0ca315-aff9–4fc2-be61–3b76b9a2d798"
        favorite1.isFavorite = false
        favoriteView1 = FavoriteToolView()
        favoriteView1.setup(with: favorite1)
        
        let favorite2 = FavoriteTool()
        favorite2.id = "2d0ca315-aff9–4fc2-be61–3b76b9a2d738"
        favorite2.isFavorite = false

        favoriteView2 = FavoriteToolView()
        favoriteView2.setup(with: favorite2)

        setupViewConfiguration()
    }
}

extension ViewController: ViewConfiguration {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            favoriteView1.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            favoriteView1.heightAnchor.constraint(equalToConstant: 32),
            favoriteView1.widthAnchor.constraint(equalToConstant: 32),
            favoriteView1.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            favoriteView2.topAnchor.constraint(equalTo: favoriteView1.bottomAnchor, constant: 160),
            favoriteView2.heightAnchor.constraint(equalToConstant: 32),
            favoriteView2.widthAnchor.constraint(equalToConstant: 32),
            favoriteView2.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    func buildViewHierarchy() {
        view.addSubview(favoriteView1)
        view.addSubview(favoriteView2)
    }


}

