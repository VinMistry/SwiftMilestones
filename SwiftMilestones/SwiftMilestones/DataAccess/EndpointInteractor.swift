//
//  EndpointInteractor.swift
//  SwiftMilestones
//
//  Created by Vinesh Mistry on 16/10/2018.
//  Copyright © 2018 Vinesh Mistry. All rights reserved.
//

import Foundation
class EndpointInteractor {
    
    private typealias CustomerProfileModel = [CustomerProfile]
    var responseHandler : ResponseHandler?
    
    func writeToJson(_ custProfile: CustomerProfile) -> String {
        let jsonEncoder = JSONEncoder()
        let jsonData = try! jsonEncoder.encode(custProfile)
        let json = String(data: jsonData, encoding: String.Encoding.utf8) ?? ""
        return json
    }
    
    func jsonToObject(data: Data) -> CustomerProfile? {
        let jsonDecoder = JSONDecoder();
        guard let profile: CustomerProfile = try? jsonDecoder.decode(CustomerProfile.self, from: data) else {
            print("Error: Couldn't decode data into Customer Profile")
            return nil
        }
        return profile
    }
    
    func retrieveProfiles() -> [CustomerProfile] {
        var customerList: [CustomerProfile] = [CustomerProfile]()
        let url = URL(string: APIs.allProfiles.rawValue)!
        
        do {
            let jsonData = try Data(contentsOf: url)
            let string = String(data: jsonData, encoding: .utf8)
            print("raw string \(string)")
            if let customers = try? JSONDecoder().decode(CustomerProfileModel.self, from: jsonData) {
                for element in customers {
                    customerList.append(element)
                    print(element.id)
                }
            }
        }
        catch {
        }
        return customerList
    }
    
    func run(after seconds: Int, completion: @escaping () -> Void) {
        let deadline = DispatchTime.now() + .seconds(seconds)
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            completion()
        }
    }
    
    func addProfile(customerProfile: CustomerProfile, completion: @escaping (_ responseHandler: ResponseHandler?, _ error: Error?) -> Void) {
        var customerID = ""
        var responseReturned = 0
        guard let url = URL(string: APIs.addProfile.rawValue) else { return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let objectAsJson = try? JSONEncoder().encode(customerProfile)
        request.httpBody = objectAsJson
        
        let session = URLSession.shared
        session.dataTask(with: request) {(data, response, error) in
            guard error == nil else {
                completion(nil, error)
                return
            }
            if let response = response as? HTTPURLResponse{
                print(response.allHeaderFields)
                print(response.statusCode)
                responseReturned = response.statusCode
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                    customerID = String(data: data , encoding: String.Encoding.utf8)!
//                    self.responseHandler = ResponseHandler(responseCode: responseReturned, customerID: customerID)
                    completion(ResponseHandler(responseCode: responseReturned, customerID: customerID), error)
                }
                catch {
                    print(error)
                    completion(nil, error)
                }
            }
                
            }.resume()
      //  run(after: 1) {
//            print("RESPONSE RETURNED: \(responseReturned)")
//            self.responseHandler = ResponseHandler(responseCode: responseReturned, customerID: customerID)
//            completion(self.responseHandler, nil)
//        }
       
    }
}
