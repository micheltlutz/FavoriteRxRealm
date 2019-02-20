//
//  Favorite.swift
//  FavoriteRxRealm
//
//  Created by Michel Anderson Lutz Teixeira on 20/02/19.
//  Copyright © 2019 Michel Anderson Lutz Teixeira. All rights reserved.
//

import RealmSwift

class FavoriteTool: Object, Codable {
    @objc dynamic var id: String = ""
    @objc dynamic var isFavorite: Bool = true

    convenience init(favoriteTool: FavoriteTool) {
        self.init()
        id = favoriteTool.id
    }

    override static func primaryKey() -> String? {
        return "id"
    }
}
