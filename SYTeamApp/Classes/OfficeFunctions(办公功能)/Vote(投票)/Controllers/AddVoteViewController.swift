//
//  AddVoteViewController.swift
//  Vote
//
//  Created by mac on 16/4/1.
//  Copyright © 2016年 CH. All rights reserved.
//

import UIKit
let kScreenW:CGFloat = UIScreen.mainScreen().bounds.maxX
let kScreenH:CGFloat = UIScreen.mainScreen().bounds.maxY
protocol AddVoteViewControllerDetegate {
    func FinishedAddVote()
}
class AddVoteViewController: NormalNavViewController,SYAlertViewDelegate,UINavigationControllerDelegate{
    var items:UITableView = UITableView()
    var delegate:AddVoteViewControllerDetegate?
    var voteInfo:VoteInfo = VoteInfo(){
        didSet{
            dispatch_async(dispatch_get_main_queue()) {
                self.items.reloadData()
            }
        }
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        items.delegate = self
        items.dataSource = self
        view.addSubview(items)
        items.frame = CGRect(x: 0, y: 0, width: kScreenW, height: kScreenH)
        items.registerClass(ItemsTableViewCell.self, forCellReuseIdentifier: "ItemsTableViewCell")
        items.registerClass(TitleAndContentTableViewCell.self, forCellReuseIdentifier: "TitleAndContentTableViewCell")
        items.registerClass(SwitchTableViewCell.self, forCellReuseIdentifier: "SwitchTableViewCell")
        items.registerClass(AddButtonTableViewCell.self, forCellReuseIdentifier: "AddButtonTableViewCell")
        items.rowHeight = 300
        items.separatorStyle =  UITableViewCellSeparatorStyle.None
        navigationItem.title = "新的投票"
            let done = UIBarButtonItem.init(title: "发布", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(AddVoteViewController.done))
            
        navigationItem.rightBarButtonItem = done
           }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    func done() {
       // print(moreInfo)
        let TitleAndCoetntCell = self.items.cellForRowAtIndexPath(NSIndexPath.init(forRow: 0, inSection: 0)) as! TitleAndContentTableViewCell
        let MoreChoiceCell = self.items.cellForRowAtIndexPath(NSIndexPath.init(forRow: 0, inSection: 1)) as! SwitchTableViewCell
//        self.moreInfo.VoteTitle = TitleAndCoetntCell.titleTextField.text
//        self.moreInfo.VoteDes = TitleAndCoetntCell.descTF.text
//        self.moreInfo.Ismorechoice = MoreChoiceCell.moreChoiceSwitch.on
        voteInfo.username = UserAccount.shareUser.nickname
        voteInfo.voteTitle = TitleAndCoetntCell.titleTextField.text
        voteInfo.voteDes = TitleAndCoetntCell.descTF.text
        voteInfo.ismorechoice = MoreChoiceCell.moreChoiceSwitch.on
//        self.imagedelegate?.backVoteImage(self, image: TitleAndCoetntCell.getImaView.image!)
//        let vc = FinishNewVoteViewController()
////        vc.preVC = self
//        vc.moreInfoModel = self.moreInfo
//        vc.getmodel = self.models
        var VoteTitleIsEmpty = false,VoteItemIsEmpty = false
        voteInfo.voteItems.forEach { (model) in
            if model.itemsContent == nil || model.itemsContent == ""{
                self.infoNotice("选项不能为空")
                VoteItemIsEmpty = false
            }
            else{
                VoteItemIsEmpty = true
            }
        }

        if TitleAndCoetntCell.titleTextField.text?.characters.count == 0
        {
            self.infoNotice("主题不能为空")
            VoteTitleIsEmpty = false

        }
        else{
            VoteTitleIsEmpty = true
        }
    
        if VoteTitleIsEmpty && VoteItemIsEmpty{
                VoteInfo.addVoteInfo(voteInfo, completion: { (result) in
                    if result {
                        SYProgressHUD.ShowSuccess("发布成功")
                        self.navigationController?.popViewControllerAnimated(true)
                        self.delegate?.FinishedAddVote()
                    }else{
                        SYProgressHUD.ShowFailed("发布失败")
                    }
                })
       // navigationController?.pushViewController(VoteListViewController(), animated: true)
        }
    }
    func addItems(){
        
        voteInfo.voteItems.append(VoteItem())
        dispatch_async(dispatch_get_main_queue()) {
            self.items.reloadData()
        }
    }
    func delItem(index: Int){
       
        voteInfo.voteItems.removeAtIndex(index)
        dispatch_async(dispatch_get_main_queue()) {
            self.items.reloadData()
        }
    }
    func actionPhotoLibrary(){
        
        let imagePicker = UIImagePickerController();
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    func actionCamera(){
        
        let imagePicker = UIImagePickerController();
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        self.presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    func actionSavedPhotosAlbum(){
        
        let imagePicker = UIImagePickerController();
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
        presentViewController(imagePicker, animated: true, completion: nil)
        
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

extension AddVoteViewController:UITableViewDataSource,UITableViewDelegate{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 2:
            return  voteInfo.voteItems.count
        default:
            return 1
        }
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 326
        case 1:
            return 71
        default:
            return 46
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("TitleAndContentTableViewCell", forIndexPath: indexPath) as! TitleAndContentTableViewCell
            cell.imageButton.addTarget(self, action: #selector(AddVoteViewController.imageUpLoad), forControlEvents: UIControlEvents.TouchUpInside)
            cell.titleTextField.tag = 333
            cell.titleTextField.delegate = self
            return cell
        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("SwitchTableViewCell", forIndexPath: indexPath) as! SwitchTableViewCell
            return cell
        case 2:
            let cell = tableView.dequeueReusableCellWithIdentifier("ItemsTableViewCell", forIndexPath: indexPath) as! ItemsTableViewCell
            cell.itemsContent.tag = indexPath.row
            cell.itemsContent.delegate = self
   //	         print(models[indexPath.row].itemsContent)

            cell.itemsContent.text = voteInfo.voteItems[indexPath.row].itemsContent
            cell.itemsContent.addTarget(self, action: #selector(AddVoteViewController.changeTF(_:)), forControlEvents: UIControlEvents.EditingChanged)
//            cell.itemsContent.text = models[indexPath.row].itemsContent
            return cell

        default:
             let cell = tableView.dequeueReusableCellWithIdentifier("AddButtonTableViewCell", forIndexPath: indexPath) as! AddButtonTableViewCell
             cell.addItem.addTarget(self, action: #selector(AddVoteViewController.addItems), forControlEvents: UIControlEvents.TouchUpInside)
            return cell
        }
        
    }
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        switch indexPath.section {
        case 2:
            return true
        default:
            return false
        }
    }
    
    func imageUpLoad() {
        let vc = SYAlertViewController (items: ["相册","照相机"])
      
        vc.addItemsAction { (sender) -> () in
            print("点击了-\(sender.tag)")
             self.actionPhotoLibrary()
        }
        vc.addcancelAction { (sender) -> () in
            print("点击了取消")
        }
        presentViewController(vc, animated: true, completion: nil)
    }
//    func ClickCancelItem(alertVC: SYAlertViewController) {
//        print("delegate - 点击了取消")
//    }
//    func ClickChildItem(alertVC: SYAlertViewController, sender: UIButton, index: Int) {
//        print("delegate - 点击了-\(index)")
//    }

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        delItem(indexPath.row)
           }
    
    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        return  "删除"
    }
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        view.endEditing(true)
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }

}
extension AddVoteViewController:UITextFieldDelegate{
    func changeTF(textField: UITextField) {
        voteInfo.voteItems[textField.tag].itemsContent = textField.text
    }
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        if textField.tag != 333 {
        items.setContentOffset(CGPoint(x: 0,y: 150 + textField.tag * 46), animated: true)
        }
        return true
    }
        func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
            if string == "" {
                return true
            }
            if textField.text?.characters.count >= 15{
                return false
            }
        return true
    }
}
extension AddVoteViewController: UIImagePickerControllerDelegate{
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]){
    
       self.dismissViewControllerAnimated(true, completion: nil)
       
        let cell = self.items.cellForRowAtIndexPath(NSIndexPath.init(forRow: 0, inSection: 0)) as! TitleAndContentTableViewCell
        cell.getImaView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        voteInfo.voteimage = info[UIImagePickerControllerOriginalImage] as? UIImage
       // self..image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController){
        self.dismissViewControllerAnimated(true, completion: nil)

    }
    
}
