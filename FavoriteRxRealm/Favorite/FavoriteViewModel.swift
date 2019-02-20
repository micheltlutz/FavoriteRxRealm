//
//  FavoriteViewModel.swift
//  FavoriteRxRealm
//
//  Created by Michel Anderson Lutz Teixeira on 20/02/19.
//  Copyright © 2019 Michel Anderson Lutz Teixeira. All rights reserved.
//

import RxSwift
import RealmSwift
import RxRealm

struct FavoriteViewModel {
    private let disposeBag = DisposeBag()
    func isFavorite(favoriteTool: FavoriteTool) -> Observable<Results<FavoriteTool>> {
        return favorites(filter: "id == '\(favoriteTool.id)'")
    }

    func favorite(favoriteTool: FavoriteTool, needSaveApi: Bool = true) {
        Observable.just(favoriteTool)
            .subscribe(Realm.rx.add())
            .disposed(by: disposeBag)
    }

    func unfavorite(favoriteTool: FavoriteTool) {
        favorites(filter: "id == '\(favoriteTool.id)'")
            .subscribe(Realm.rx.delete())
            .dispose()
    }

    func favorites(filter predicateFormat: String? = nil) -> Observable<Results<FavoriteTool>> {
        guard let realm = try? Realm() else {
            return Observable.empty()
        }
        var results: Results<FavoriteTool> = realm.objects(FavoriteTool.self)
        if let predicate = predicateFormat {
            results = results.filter(predicate)
        }

        return Observable.collection(from: results)
    }

    func deleteAll() {
        let favorites = self.favorites()
        favorites.subscribe(Realm.rx.delete()).dispose()
    }
}
