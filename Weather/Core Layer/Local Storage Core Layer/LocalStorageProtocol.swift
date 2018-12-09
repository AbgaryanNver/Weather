//
//  LocalStorageProtocol.swift
//  Weather
//
//  Created by Nver Abgaryan on 12/8/18.
//  Copyright © 2018 Nver Abgaryan. All rights reserved.
//

import Foundation

protocol LocalStorageProtocol : class {
    
    associatedtype EntityType
    /*
     Save an item
     */
    func save(item: EntityType) throws
    
    /*
     Save an array of items
     */
    func save(items: [EntityType]) throws
    
    /*
     Update an item
     */
    func update(block: @escaping () -> ()) throws
    
    /*
     Delete an item
     */
    func delete(item: EntityType) throws
    
    /*
     Delete all items
     */
    func deleteAll() throws
    
    /*
     Return a list of items
     */
    func fetch(predicate: NSPredicate?) -> [EntityType]
    
    /*
     Return list of all items
     */
    func fetchAll() -> [EntityType]
    
}
