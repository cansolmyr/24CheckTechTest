//
//  NetworkApi.swift
//  check24TechTest
//
//  Created by Can TOKER on 12.02.2022.
//

import Foundation
import Alamofire
enum NetworkAPI {
    case productList
    case productDetail (model: Encodable)
    
    var needAuth: Bool {
        // If we need Authentication will be added here.
        return false
    }
    
    var shouldShowGlobalErrorAlert: Bool {
        switch self {
        default: return true
        }
    }
    
    var shouldShowGlobalLoadingView: Bool {
        return true
    }
    
    private var baseURL: String {
        return "http://app.check24.de/"
    }
    
    var endpoint: String {
        var endpoint = ""
        switch self {
        case .productList:
            endpoint = "products-test.json"
        case .productDetail(let model):
            return "test"
        }
        return baseURL + endpoint
    }
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    var parameters: [String: Any]? {
        switch self {
        case .productDetail(let model):
            return model.asDictionary()
        default:
            return nil
        }
    }
    var encoding: ParameterEncoding {
        switch self {
        default:
            return JSONEncoding.default
        }
    }
    var httpHeaders: HTTPHeaders {
        //Get content type from validation content types
        let contentType = self.contentType.first ?? ContentTypeEnum.ApplicationJSON.rawValue
        
        //Create mutable headers dictionary
        var headers: HTTPHeaders = [:]
        
        //Add needed headers
        switch self {
        default:
            headers = ["Content-Type": contentType]
        }
        
        //Add additional headers
        self.additionalHeaders?.forEach { headers[$0.name] = $0.value }
        return headers
    }
    var contentType: [String] {
        switch self {
        default:
            return [ContentTypeEnum.ApplicationJSON.rawValue]
        }
    }
    private var additionalHeaders: HTTPHeaders? {
        switch self {
        default:
            return nil
        }
    }
    
    enum ContentTypeEnum: String {
        case ApplicationURL = "application/x-www-form-urlencoded"
        case ApplicationJSON = "application/json"
    }
    
    
}
    
