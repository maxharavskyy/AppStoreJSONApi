//
//  AlamofireNetworkRequest.swift
//  AppStoreJSONApi
//
//  Created by Макс Гаравський on 06.08.2020.
//  Copyright © 2020 Макс Гаравський. All rights reserved.
//

import UIKit
import Alamofire

class AlamofireNetworkRequest {
    
    static func sendRequest(onSucess: @escaping ([SocialApp]?) -> (), onError: @escaping () -> ()) {
        let urlString =  "https://api.letsbuildthatapp.com/appstore/social"
        AF.request(urlString).validate().responseDecodable(of: [SocialApp].self) { (response) in
            guard let app = response.value else {
                onError()
                return
            }
            onSucess(app)
        }
    }

}
