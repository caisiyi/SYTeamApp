//
//  TakePhotoCenter.swift
//  UUChatTableViewSwift
//
//  Created by XcodeYang on 8/21/15.
//  Copyright © 2015 XcodeYang. All rights reserved.
//

import UIKit

typealias PickImageBlock = (image: UIImage) -> Void

class TakePhotoCenter: NSObject ,UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var viewController:UIViewController!
    var successBlock:PickImageBlock?
    
    func takePhoto (viewController vc: UIViewController!, didSelected: PickImageBlock?) {
        
        viewController = vc
        successBlock = didSelected
        
        let sheet = UIAlertController()
        // is the device support camera?（iPod & Simulator）
        if (UIImagePickerController.isSourceTypeAvailable(.Camera)) {
            sheet.addAction(UIAlertAction.init(title: "Camera", style: .Default, handler: { _ in
                self.showPhotoes(sourceType: .Camera)
            }))
        }
        sheet.addAction(UIAlertAction.init(title: "PhotoLibrary", style: .Default, handler: { _ in
            self.showPhotoes(sourceType: .PhotoLibrary)
        }))
        sheet.addAction(UIAlertAction.init(title: "SavedPhotosAlbum", style: .Default, handler: { _ in
            self.showPhotoes(sourceType: .SavedPhotosAlbum)
        }))
        sheet.addAction(UIAlertAction.init(title: "Cancel", style: .Cancel, handler: nil))
        
        viewController.presentViewController(sheet, animated: true, completion: nil)
    }
    
    func showPhotoes(sourceType type: UIImagePickerControllerSourceType) {
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = type
        viewController.presentViewController(controller, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        viewController.dismissViewControllerAnimated(true) { () -> Void in
            if (self.successBlock != nil) {
                let image = info[UIImagePickerControllerOriginalImage] as? UIImage
                self.successBlock!(image: image!)
            }
        }
    }

    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        viewController.dismissViewControllerAnimated(true, completion: nil)
    }
}
