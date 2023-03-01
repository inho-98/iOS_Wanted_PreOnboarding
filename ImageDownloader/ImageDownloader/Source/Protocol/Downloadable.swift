//
//  Downloadable.swift
//  ImageDownloader
//
//  Created by 김인호 on 2023/03/01.
//

import Foundation

protocol Downloadable {
    func startLoad(of urlString: String, _ handler: @escaping (Data) -> Void)
}

extension Downloadable {
    func startLoad(of urlString: String,_ handler: @escaping (Data) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else { return }
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode)
            else {
                return
            }
            
            guard let data else { return }
            
            handler(data)
        }
        
        task.resume()
    }
}
