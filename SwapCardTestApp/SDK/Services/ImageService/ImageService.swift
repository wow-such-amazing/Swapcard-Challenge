//
//  ImageService.swift
//  SwapCardTestApp
//
//  Created by Taras Nikulin on 03.02.2018.
//  Copyright © 2018 Taras Nikulin. All rights reserved.
//

import Alamofire
import AlamofireImage

protocol IImageService {
    func getImageBy(urlString: String, completion: @escaping ResultClosure<UIImage>)
}

final class ImageService: IImageService {
    func getImageBy(urlString: String, completion: @escaping ResultClosure<UIImage>) {
        AF.request(urlString).responseImage { response in
            guard let image = try? response.result.get() else {
                completion(.error(Loc.commonError))
                return
            }
            completion(.success(image))
        }
    }
}
