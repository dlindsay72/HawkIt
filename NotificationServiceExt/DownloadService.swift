//
//  DownloadService.swift
//  HawkIt
//
//  Created by Dan Lindsay on 2017-12-07.
//  Copyright © 2017 Dan Lindsay. All rights reserved.
//

import Foundation

class DownloadService {
    
    private init() {}
    static let shared = DownloadService()
    
    func getImage(with urlString: String, completion: @escaping (URL) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, _, _) in
            let fileManager = FileManager.default
            
            guard let data = data, let documentsUrl = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
            let fileUrl = documentsUrl.appendingPathComponent("image.jpg")
            do {
                try data.write(to: fileUrl)
                DispatchQueue.main.async {
                    completion(fileUrl)
                }
            } catch {
                print("Could not get image: \(error)")
            }
        }
        task.resume()
    }
    
}
