//
//  DataPersistenceManager.swift
//  NetflixClone
//
//  Created by Tes on 20/04/2022.
//

import Foundation
import UIKit
import CoreData

class DataPersistenceManager {
    
    enum DatabaseError: Error {
        case failedToSaveData
        case failedToFetchData
    }
    
    static let shared = DataPersistenceManager()
    
    private let appDelegate = UIApplication.shared.delegate as? AppDelegate ?? AppDelegate()
    
    lazy var context = {
        return self.appDelegate.persistentContainer.viewContext
    }()
    
    func downloadTitle(with model: Title, completion: @escaping (Result<Void, Error>) -> Void){
        
        let item = TitleItem(context: context)
        item.id = Int64(model.id)
        item.mediaType = model.mediaType
        item.originalName = model.originalName
        item.originalTitle = model.originalTitle
        item.posterPath = model.posterPath
        item.overview = model.overview
        item.voteCount = Int64(model.voteCount)
        item.releaseDate = model.releaseDate
        item.voteAverage = model.voteAverage
        
        do {
            try context.save()
            completion(.success(()))
        } catch {
            completion(.failure(DatabaseError.failedToSaveData))
        }
    }
    
    func fetchingTitlesFromDatabase(completion: @escaping(Result<[TitleItem], Error>) -> Void){
        let request: NSFetchRequest<TitleItem>
        request = TitleItem.fetchRequest()
        
        do {
            let titles = try context.fetch(request)
            completion(.success(titles))
        } catch {
            completion(.failure(DatabaseError.failedToFetchData))
            print(error.localizedDescription)
        }
    }
}
