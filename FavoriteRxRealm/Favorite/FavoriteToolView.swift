//
//  FavoriteToolView.swift
//  FavoriteRxRealm
//
//  Created by Michel Anderson Lutz Teixeira on 20/02/19.
//  Copyright © 2019 Michel Anderson Lutz Teixeira. All rights reserved.
//

import UIKit
import RxSwift

class FavoriteToolView: FavoriteView {
    private let favoriteViewModel = FavoriteViewModel()
    private var disposeBag = DisposeBag()

    override init() {
        super.init()
    }
    
    func setup(with favoriteTool: FavoriteTool) {
        self.viewState = .notFavourited
        favoriteViewModel.isFavorite(favoriteTool: favoriteTool)
            .subscribe(onNext: { [weak self] (result) in
                guard let self = self else { return }
                if result.count > 0 {
                    self.viewState = .favourited
                } else {
                    self.viewState = .notFavourited
                }
            }).disposed(by: disposeBag)

        self.didFavorite = { [weak self] in
            guard let self = self else { return }
            favoriteTool.isFavorite = true
            self.favoriteViewModel.favorite(favoriteTool: favoriteTool)
        }
        self.didUnfavorite = { [weak self] in
            guard let self = self else { return }
            favoriteTool.isFavorite = false
            self.favoriteViewModel.unfavorite(favoriteTool: favoriteTool)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
