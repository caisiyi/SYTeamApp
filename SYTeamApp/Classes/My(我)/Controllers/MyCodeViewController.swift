//
//  MyCodeViewController.swift
//  PersonInformation
//
//  Created by MAC on 16/4/13.
//  Copyright © 2016年 MAC. All rights reserved.
//

import UIKit

class MyCodeViewController: UIViewController {
    //    var order:hpOrder?{
    //        didSet{
    //            ServiceProxy.getQRCode(orderid: order!.id) { (response, error) -> Void in
    //                if response?.code == 100{
    //                    self.dateLabel.text = "有效期: \(response!.data!.begintime) - \(response!.data!.endtime)"
    //                    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
    //                        let codeImage = SYQRCodeTool.createQRForString(response!.data!.code, qrImageName: "storeimage")
    //                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
    //                            self.codeImage.image = codeImage
    //                        })
    //                    }
    //                    self.codeLabel.text = "券码: \(response!.data!.code)"
    //
    //                }
    //            }
    //        }
    //    }
    //
    lazy var codeImageView = UIImageView()
    lazy var dateLabel = UILabel(textColor: UIColor.orangeColor(), fontSize: 12)
    lazy var codeLabel = UILabel(textColor: UIColor.lightGrayColor(), fontSize: 20)
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        self.navigationItem.titleView = UILabel.init(text: "我的二维码",textColor: UIColor.whiteColor(), fontSize: 17)
        
//        view.addSubview(dateLabel)
//        dateLabel.snp_makeConstraints { (make) -> Void in
//            make.top.equalTo(80)
//            make.centerX.equalTo(view)
//        }
        view.addSubview(codeImageView)
        codeImageView.snp_makeConstraints { (make) -> Void in
             make.top.equalTo(100)
            make.centerX.equalTo(view)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(codeImageView.snp_width)
        }
        
        view.addSubview(codeLabel)
        codeLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(codeImageView.snp_bottom).offset(12)
            make.centerX.equalTo(view)
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
