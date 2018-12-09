//
//  RealmManager.swift
//  Weather
//
//  Created by Nver Abgaryan on 12/8/18.
//  Copyright © 2018 Nver Abgaryan. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager<T>: LocalStorageProtocol where T : Object  {
    
    typealias RealmEntityType = T
    
    private let realm = try! Realm()
    
    func save(item: T) throws {
        try realm.write {
            realm.add(item as Object)
        }
    }
    
    func save(items: [T]) throws {
        try realm.write {
            items.forEach {
                realm.add($0 as Object, update: true)
            }
        }
    }
    
    func update(block: @escaping () -> ()) throws {
        try realm.write() {
            block()
        }
    }
    
    func delete(item: T) throws {
        try realm.write() {
            realm.delete(item as Object)
        }
    }
    
    func deleteAll() throws {
        try realm.write() {
            realm.delete(realm.objects(T.self))
        }
    }
    
    func fetch(predicate: NSPredicate?) -> [T] {
        var objects = realm.objects(T.self)
        
        if let predicate = predicate {
            objects = objects.filter(predicate)
        }
        
        return objects.compactMap({ (entity) -> T in
            entity
        })

    }
    
    func fetchAll() -> [T] {

        return realm.objects(T.self).compactMap({ (entity) -> T in
            entity
        })
    }
}
