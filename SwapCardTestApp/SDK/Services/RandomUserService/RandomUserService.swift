//
//  RandomUserService.swift
//  SwapCardTestApp
//
//  Created by Taras Nikulin on 02.02.2018.
//  Copyright © 2018 Taras Nikulin. All rights reserved.
//

import Alamofire
import RealmSwift

protocol IRandomUserService {
    func loadUsers(count: Int, completion: @escaping ResultClosure<[RandomUser]>)
    func getSavedUsers(completion: @escaping ResultClosure<[RandomUser]>)
}

final class RandomUserService: IRandomUserService {
    var realmProvider: IRealmProvider?
    
    func loadUsers(count: Int, completion: @escaping ResultClosure<[RandomUser]>) {
        let parameters = [RequestParameter(field: "results", value: "\(count)")]
        let request = GetUsersConfiguration(parameters: parameters)
        AF.request(request).responseDecodable(of: BaseResponse<[RandomUser]>.self) { response in
            switch response.result {
            case .success(let response):
                self.save(users: response.results, completion: completion)
            case .failure(let error):
                print("Debug: LoadUsers Failure - \(error)")
                completion(
                    .error(Loc.commonError)
                )
            }
        }
    }

    func getSavedUsers(completion: @escaping ResultClosure<[RandomUser]>) {
        guard let realm = realmProvider?.realm else { return }
        let users = Array(realm.objects(RandomUser.self))
        completion(.success(users))
    }

    private func save(users: [RandomUser], completion: @escaping ResultClosure<[RandomUser]>) {
        DispatchQueue.global(qos: .background).async {
            guard let realm = self.realmProvider?.realm else { return }
            do {
                try realm.write {
                    realm.add(users)
                }
                let threadSafeUsers = users.map { ThreadSafeReference(to: $0) }
                DispatchQueue.main.async {
                    guard let mainRealm = self.realmProvider?.realm else { return }
                    let mainUsers = threadSafeUsers.flatMap { mainRealm.resolve($0) }
                    completion(.success(mainUsers))
                }
            } catch {
                print("[REALM WRITE ERROR]:\(error.localizedDescription)")
            }
        }
    }
    
    private func decode(data: Data) -> [RandomUser] {
        do {
            let response = try JSONDecoder().decode(BaseResponse<[RandomUser]>.self, from: data)
            return response.results
        } catch {
            print("[DECODER ERROR]:\(error.localizedDescription)")
        }
        return []
    }
}
