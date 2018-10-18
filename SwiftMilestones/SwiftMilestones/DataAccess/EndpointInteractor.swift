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
        let url = URL(string: APIs.allProfiles.rawValue)
        var jsonData: Data?
        do {
            jsonData = try Data(contentsOf: url!)
            if let customers = try? JSONDecoder().decode(CustomerProfileModel.self, from: jsonData!) {
                for element in customers {
                    customerList.append(element)
                    print(element.customer.firstName)
                }
            }
        }
        catch {
        }
        return customerList
    }
    
    
    func addProfile(customerProfile: CustomerProfile) -> ResponseHandler {
        var customerID = ""
        var responseReturned = 0
        guard let url = URL(string: APIs.addProfile.rawValue) else { return ResponseHandler(responseCode: 0, customerID: "")}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let objectAsJson = try? JSONEncoder().encode(customerProfile)
        request.httpBody = objectAsJson
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response as? HTTPURLResponse{
                print(response.allHeaderFields)
                responseReturned = response.statusCode
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                    customerID = String(data: data , encoding: String.Encoding.utf8)!
                }
                catch {
                    print(error)
                }
            }
            }.resume()
        
        return ResponseHandler(responseCode: responseReturned, customerID: customerID)
    }
}
