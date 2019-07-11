//
//  AsyncRequestWorker.swift
//  MVCDemo
//
//  Created by 房懷安 on 2019/2/1.
//  Copyright © 2019 房懷安. All rights reserved.
//

import Foundation
import UIKit

protocol AsyncReponseDelegate {
    func receviedReponse(_ sender: AsyncRequestWorker, responseString : String, tag : Int) -> Void
}

class AsyncRequestWorker {
    
    var reponseDelegate : AsyncReponseDelegate?
    
    func getResponse(from:String, tag:Int) -> Void {
        
        //赋予网络网址（URL网址）
        let url = URL(string: from)!
        
        //请求一个网络地址（Request：请求）
        let request = URLRequest(url: url)
        
        //网络会话配置链接（SessionConfiguration：会话配置）
        let config = URLSessionConfiguration.default
        
        //Session会话，阶段  建立会话
        let session = URLSession(configuration: config)
        
        //dataTask数据任务 completionHandler完成处理程序   开始会话
        let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
            //！== ？   ！指🦌为🐎  ？🐎厩里没有🐎  把respone强制转化为httpurlresponse
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            //200处理成功
            if( 200 == statusCode){
                //把data转换成string
                let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                let responseString = String( dataString! )
                
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "response.received"), object: self, userInfo: ["response": responseString])
                //receviedReponse收货方
                self.reponseDelegate?.receviedReponse(self, responseString: responseString, tag: tag)
            }
        })
        task.resume()
    }
}
