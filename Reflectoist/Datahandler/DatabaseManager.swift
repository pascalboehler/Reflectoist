//
//  DatabaseManager.swift
//  Reflectoist
//
//  Created by Pascal Boehler on 15.01.23.
//

import Foundation
import CouchbaseLiteSwift

class DatabaseManager {
    var db: Database? {
        get {
            return _db
        }
    }
    var dbChangeListenerToken: ListenerToken?
    
    // demo only!!
    public fileprivate(set) var currentUserCredentails:(user:String, password: String)?
    
    var lastError: Error?
    
    // db name
    fileprivate let kDBName: String = "reflectoist"
    fileprivate var _db: Database?
    
    // db directory??
    fileprivate var _applicationDocumentDirectory = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).last
    fileprivate var _applicationSupportDirectory = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).last
    
    static let shared:DatabaseManager = {
        let instance = DatabaseManager()
        instance.initialize()
        return instance
    }()
    
    func initialize() {
        enableCrazyLevelLogging()
    }
    
    private init() {
        
    }
    
    deinit {
        // Stop observing databse changes and close the database
        do {
            try self._db?.close()
        }
        catch {
            print("ERROR: There was an error closing the database")
        }
    }
}

// MARK: Public
extension DatabaseManager {
    func openOrCreateDatabaseForUser(_ user:String, password: String, handler:(_ error: Error?)->Void) {
        do {
            var options = DatabaseConfiguration()
            guard let defaultDBPath = _applicationSupportDirectory else {
                fatalError("Could not open Application Support Dir for app")
            }
            // Create a folder for the logged in user if there is none
            let userFolderUrl = defaultDBPath.appendingPathComponent(user, isDirectory: true)
            let userFolderPath = userFolderUrl.path
            
            let fileManager = FileManager.default
            if !fileManager.fileExists(atPath: userFolderPath) { // if the path does not exist; create it
                try fileManager.createDirectory(atPath: userFolderPath, withIntermediateDirectories: true, attributes: nil)
            }
            
            // set the folder path of CBLite DB
            options.directory = userFolderPath
            
            print("Will open / create DB at path \(userFolderPath)")
            // create a new db or get handle to existing DB at specified path
            _db = try Database(name: kDBName, config: options)
            
            // register the Database for dB change notifications
            self.registerForDatabaseChanges() // TODO: Add function!
            
            currentUserCredentails = (user, password)
            handler(nil)
            
        } catch {
            lastError = error
            handler(lastError)
        }
    }
    
    func closeDatabaseForCurrentUser() -> Bool {
        do {
            print(#function)
            // Get database handle
            if let db = self.db {
                deregisterForDatabaseChanges() // TODO: Add this function
                
                try db.close()
                _db = nil
            }
            
            return true
        }
        catch {
            return false
        }
    }
    
    fileprivate func registerForDatabaseChanges() {
        // TODO: Add logic
        // db change listener
        dbChangeListenerToken = db?.addChangeListener({ [weak self](change) in
            guard let `self` = self else {
                return
            }
            for docId in change.documentIDs {
                if let docString = docId as String? {
                    let doc = self._db?.document(withID: docString)
                    if doc == nil {
                        print("Document was deleted")
                    } else {
                        print("Document was changed / added")
                    }
                }
            }
        })
    }
    
    fileprivate func deregisterForDatabaseChanges() {
        // TODO: Add logic
        // remove db change listener token
        if let dbChangeListenerToken = self.dbChangeListenerToken {
            db?.removeChangeListener(withToken: dbChangeListenerToken)
        }
    }
}

// MARK: All about logging
extension DatabaseManager {
    fileprivate func enableCrazyLevelLogging() {
        Database.log.console.domains = .all
        Database.log.console.level = .debug
    }
}

