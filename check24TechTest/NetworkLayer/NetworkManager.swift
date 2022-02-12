//
//  NetworkManager.swift
//  check24TechTest
//
//  Created by Can TOKER on 12.02.2022.
//


import Foundation
import Alamofire
import CoreText

typealias SuccessBlock<T: Decodable> = ((T) -> Void)
typealias FailureBlock = ((String) -> Void)?

class NetworkManager {
    static let shared = NetworkManager()
    
    private init () {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 60
    }
    
    func sendRequestWith<T: Decodable>(target: NetworkAPI, success: @escaping SuccessBlock<T>, failure: FailureBlock) {
        self.handleGlobalWaitingView(target: target, show: true)
        Session.default.request(target.endpoint,
                                method: target.method,
                                parameters: target.parameters,
                                encoding: target.encoding,
                                headers: target.httpHeaders)
            .validate(statusCode: 200..<300)
            .validate(contentType: target.contentType)
            .responseData(completionHandler: { [weak self] (response) in
                self?.handleGlobalWaitingView(target: target, show: false)
                self?.parseResponse(response: response, target: target, success: success, failure: failure)
            })
        
    }
    private func parseResponse<T: Decodable>(response: AFDataResponse<Data>, target: NetworkAPI, success: @escaping SuccessBlock<T>, failure: FailureBlock) {
        if let data = response.data {
            do {
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                let baseResponse = try JSONDecoder().decode(T.self, from: data)

                success(baseResponse)
                
            } catch {
                self.handleError(target: target, completion: failure)
            }
        } else {
            self.handleError(target: target, completion: failure)
        }
    }
    
    private func handleGlobalWaitingView(target: NetworkAPI, show: Bool) {
        if target.shouldShowGlobalLoadingView {
            //Show or hide global loading view based on NetworkAPI type
            //show ? GlobalLoadingView.simple.show() : GlobalLoadingView.simple.hide()
        }
    }
    //MARK: Handle errors
    private func handleError(target: NetworkAPI?, error: String? = nil, completion: FailureBlock) {
        let defaultErrorMessage = "global_network_error_message"
        completion?(error ?? defaultErrorMessage) //Let closure go.
        
        //MARK: Check if users session has ended.
        //        if error == tokenErrorConstant {
        //            GlobalAlert.alert(title: "", message: invalidTokenMessage, firstActionTitle: "Tamam", firstClosure: {
        //                TokenHelper.token = nil //Remove dead token
        //                //Send user to login maybe?
        //            }).show()
        //            return
        //        }
        
        //MARK: Check if we should show error globally.
        if target?.shouldShowGlobalErrorAlert ?? false {
            //Show global alert based on NetworkAPI type
            //GlobalAlert.simpleAlert(title: "", message: error ?? defaultErrorMessage, actionTitle: "Tamam").show()
        }
        
    }
}
