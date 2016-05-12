//
//  moreINFOView.swift
//  Login_Demo
//
//  Created by MAC on 16/4/8.
//  Copyright © 2016年 MAC. All rights reserved.
//

import UIKit


class RegisterMoreViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate,CollectionViewControllerDelegate,UITextViewDelegate {
    
    
    
    lazy var nameLB:ZJLabel={
        let a=ZJLabel()
        a.text="昵称:"
        return a
        
        }()
    lazy var nameTF:HoshiTextField={
        let a=HoshiTextField()
        a.keyboardType = UIKeyboardType.Default
        a.borderInactiveColor = UIColor.whiteColor()
        a.clearButtonMode=UITextFieldViewMode.Always

        return a
        
        }()
    lazy var SexControl:ZJControl={
        let a=ZJControl()
        return a
        }()
    lazy var SexLB:ZJLabel={
        let a=ZJLabel()
        a.text="性别:"
        return a
        
        }()
    lazy var Date:ZJDataPicker={
        
        let a=ZJDataPicker()
        
//        NSDate* minDate = [[NSDate alloc]initWithString:@"1900-01-01 00:00:00 -0500"];
//        NSDate* maxDate = [[NSDate alloc]initWithString:@"2099-01-01 00:00:00 -0500"];
      
        
        return a
        }()
    lazy var dateLB:ZJLabel={
        let a=ZJLabel()
        a.text="出生日期:"
        return a
        
        }()
    lazy var showdataLB:ZJLabel={
        let a=ZJLabel()
        a.text = "2000年1月1日"

        a.backgroundColor=UIColor.clearColor()
        
        return a
        
        }()
    lazy var choosedateBtn:ZJButton={
        let a=ZJButton()
        a.setTitle("日期选择", forState: UIControlState.Normal)
        a.layer.cornerRadius=15
        a.backgroundColor = UIColor(red: 103/255, green: 191/255, blue: 237/255, alpha: 1)
        a.rippleColor = UIColor(red: 103/255, green: 191/255, blue: 237/255, alpha: 1)
        a.addTarget(self, action: "click", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        
        return a
        
        }()
    lazy var imageLB:ZJLabel={
        let a=ZJLabel()
        a.text="请选择头像："
        a.backgroundColor=UIColor.clearColor()
        
        return a
        
        }()
    lazy var showimage:UIImageView={
        let a=UIImageView()
//        a.image = UIImageView(image: UIImage(named: "1愿望"))
        a.backgroundColor=UIColor.whiteColor()
       
        
//        let tap = UITapGestureRecognizer(target: self, action: "click2")
//        a.addGestureRecognizer(tap)
        
        return a
        }()
    lazy var selectimage:ZJButton={
        let a=ZJButton()
        a.setTitle("选择头像", forState: UIControlState.Normal)
        a.layer.cornerRadius=30
        a.rippleColor = UIColor(red: 103/255, green: 191/255, blue: 237/255, alpha: 1)
        a.backgroundColor = UIColor(red: 103/255, green: 191/255, blue: 237/255, alpha: 1)
        a.addTarget(self, action: "click2", forControlEvents: UIControlEvents.TouchUpInside)
        

        
        return a
        }()
    lazy var mottolabel:ZJLabel = {
        let a = ZJLabel()
        a.text="个性签名："
        return a
        }()
    lazy var mottoTV:UITextView = {
        let a = UITextView()
        a.backgroundColor=UIColor.whiteColor()
        a.textColor = UIColor.blackColor()

        return a
        }()
//    let TJBtn=ZJButton()
//    TJBtn.setTitle("确认提交", forState: .Normal)
//    TJBtn.layer.cornerRadius=50
//    TJBtn.rippleBackgroundColor = UIColor(red: 103/255, green: 191/255, blue: 237/255, alpha: 1)
//    TJBtn.addTarget(self, action: "finish", forControlEvents: .TouchUpInside)
    
    lazy var submitBtn:ZJButton = {
        let a=ZJButton()
            a.setTitle("确认提交", forState: .Normal)
            a.layer.cornerRadius=30
            a.rippleColor = UIColor(red: 103/255, green: 191/255, blue: 237/255, alpha: 1)
        a.backgroundColor = UIColor(red: 103/255, green: 191/255, blue: 237/255, alpha: 1)
            a.addTarget(self, action: "finish", forControlEvents: .TouchUpInside)
        return a
        
        }()
    
    
    override func viewDidLoad() {
//        NSNotificationCenter.defaultCenter().addObserver(self, selector:"keyBoardWillShow:", name:UIKeyboardWillShowNotification, object: nil)
//        NSNotificationCenter.defaultCenter().addObserver(self, selector:"keyBoardWillHide:", name:UIKeyboardWillHideNotification, object: nil)
        setActionView()
        setActionView2()
        super.viewDidLoad()
        view.backgroundColor=UIColor(red: 18/255, green: 171/255, blue: 233/255, alpha: 1)        
        let contextView = UIView()
        view.addSubview(contextView)
        contextView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(-280)
        }
        contextView.addSubview(nameLB)
        nameLB.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(40)
            make.left.equalTo(40)
            make.width.equalTo(60)
            make.height.equalTo(60)
        }
        nameTF.delegate = self
        contextView.addSubview(nameTF)
        nameTF.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(40)
            make.left.equalTo(nameLB.snp_right).offset(10)
            make.right.equalTo(-40)
            make.centerY.equalTo(nameLB)
        }
        contextView.addSubview(SexLB)
        SexLB.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(nameTF.snp_bottom).offset(10)
            make.left.equalTo(40)
            make.width.equalTo(60)
            make.height.equalTo(60)
        }
        contextView.addSubview(SexControl)
        SexControl.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(nameTF.snp_bottom).offset(10)
            make.left.equalTo(SexLB.snp_right).offset(10)
            make.right.equalTo(-40)
            make.centerY.equalTo(SexLB)
        }
        
        
        contextView.addSubview(dateLB)
        dateLB.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(SexLB.snp_bottom).offset(10)
            make.left.equalTo(40)
            make.width.equalTo(80)
            make.height.equalTo(40)
        }
        contextView.addSubview(choosedateBtn)
        choosedateBtn.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(dateLB.snp_top)
            make.right.equalTo(-40)
            make.width.equalTo(80)
            make.height.equalTo(40)
            make.centerY.equalTo(dateLB)
        
        }
        contextView.addSubview(showdataLB)
        showdataLB.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(dateLB.snp_top)
            make.left.equalTo(dateLB.snp_right).offset(5)
            make.right.equalTo(choosedateBtn.snp_left).offset(-5)
            make.centerY.equalTo(dateLB)
        }
        contextView.addSubview(imageLB)
        imageLB.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(dateLB.snp_bottom).offset(10)
            make.left.equalTo(40)
            make.width.equalTo(120)
            make.height.equalTo(40)
        }
        contextView.addSubview(showimage)
        showimage.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(dateLB.snp_bottom).offset(10)
            make.left.equalTo(imageLB.snp_right).offset(10)
            make.width.equalTo(120)
            make.height.equalTo(120)
        }
        contextView.addSubview(selectimage)
        selectimage.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(showimage.snp_bottom).offset(10)
            make.left.equalTo(showimage.snp_left)
            make.right.equalTo(showimage.snp_right)
            make.height.equalTo(60)
        }
        
        
        view.addSubview(mottolabel)
        mottolabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(contextView.snp_bottom).offset(1)
            make.left.equalTo(40)
            make.width.equalTo(120)
            make.height.equalTo(40)
        }
        mottoTV.delegate = self
        
        view.addSubview(mottoTV)
        mottoTV.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(mottolabel.snp_bottom).offset(5)
            make.left.equalTo(40)
            make.right.equalTo(-40)
            make.bottom.equalTo(-80)
        }
        
        view.addSubview(submitBtn)
        submitBtn.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(mottoTV.snp_bottom).offset(5)
            make.left.equalTo(40)
            make.right.equalTo(-40)
            make.bottom.equalTo(-10)
        }
       
     
        

        
        
        
        
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        mottoTV.resignFirstResponder()
        nameTF.resignFirstResponder()
    }
    
    func setActionView()
    {
        vc.modalPresentationStyle = UIModalPresentationStyle.OverFullScreen
        vc.view.backgroundColor = UIColor.clearColor()
        //设置弹出视图背景模糊
        let blurView = UIView()
        blurView.alpha = 0.6
        blurView.backgroundColor = UIColor.blackColor()
        blurView.frame.size = CGSize(width: vc.view.frame.width, height: vc.view.frame.height)
        vc.view.addSubview(blurView)
        let tap = UITapGestureRecognizer(target: self, action: "tap")
        blurView.addGestureRecognizer(tap)
        //内容视图View
        let contentView = UIView()
        contentView.frame = CGRectMake(0, vc.view.frame.height - 270, vc.view.frame.width, 270)
        contentView.backgroundColor = UIColor.whiteColor()
        vc.view.addSubview(contentView)
        contentView.addSubview(Date)
        Date.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(contentView.snp_top)
            make.left.equalTo(40)
            make.right.equalTo(-40)
            make.height.equalTo(220)
        }
        let sureBtn=ZJButton()
        sureBtn.setTitle("确定", forState: .Normal)
        sureBtn.backgroundColor=UIColor(red: 103/255, green: 191/255, blue: 237/255, alpha: 1)
        sureBtn.rippleColor = UIColor(red: 103/255, green: 191/255, blue: 237/255, alpha: 1)
        sureBtn.layer.cornerRadius=30
        sureBtn.addTarget(self, action: "tap", forControlEvents: UIControlEvents.TouchUpInside)
        contentView.addSubview(sureBtn)
        sureBtn.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(Date.snp_bottom).offset(1)
            make.left.equalTo(40)
            make.right.equalTo(-40)
            make.height.equalTo(40)
        }

        
    }
    func backUserImage(vc: ChooseImageViewcontroller, image: UIImage) {
      
        self.showimage.image = image
        
    }
    func setActionView2()
    {
        vc2.modalPresentationStyle = UIModalPresentationStyle.OverFullScreen
        vc2.view.backgroundColor = UIColor.clearColor()
        //设置弹出视图背景模糊
        let blurView = UIView()
        blurView.alpha = 0.6
        blurView.backgroundColor = UIColor.blackColor()
        blurView.frame.size = CGSize(width: vc2.view.frame.width, height: vc2.view.frame.height)
        vc2.view.addSubview(blurView)
        
        //内容视图View
        let contentView = UIView()
        contentView.frame = CGRectMake(0, vc2.view.frame.height - 200, vc2.view.frame.width, 200)
        contentView.backgroundColor = UIColor.whiteColor()
        vc2.view.addSubview(contentView)
        let syshead=ZJButton()
        syshead.setTitle("选择系统头像", forState: UIControlState.Normal)
        syshead.backgroundColor=UIColor(red: 103/255, green: 191/255, blue: 237/255, alpha: 1)
        syshead.rippleColor = UIColor(red: 103/255, green: 191/255, blue: 237/255, alpha: 1)
        syshead.addTarget(self, action: "sysheadOnclick", forControlEvents: .TouchUpInside)
        contentView.addSubview(syshead)
        syshead.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(contentView.snp_top).offset(5)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(60)
        }
        let photohead=ZJButton()
        photohead.setTitle("从相册中选择", forState: UIControlState.Normal)
        photohead.backgroundColor=UIColor(red: 103/255, green: 191/255, blue: 237/255, alpha: 1)
        photohead.rippleColor = UIColor(red: 103/255, green: 191/255, blue: 237/255, alpha: 1)
        photohead.addTarget(self, action: "button", forControlEvents: .TouchUpInside)
        contentView.addSubview(photohead)
        photohead.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(syshead.snp_bottom).offset(5)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(60)
        }
        let cancel=ZJButton()
        cancel.setTitle("取消", forState: UIControlState.Normal)
        cancel.backgroundColor=UIColor(red: 103/255, green: 191/255, blue: 237/255, alpha: 1)
        cancel.rippleColor = UIColor(red: 103/255, green: 191/255, blue: 237/255, alpha: 1)
        cancel.addTarget(self, action: "tap2", forControlEvents: .TouchUpInside)
        contentView.addSubview(cancel)
        cancel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(photohead.snp_bottom).offset(5)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(60)
        }
        
        

        
    }
    func tap(){
        vc.dismissViewControllerAnimated(true, completion: nil)
        let str=Date.date
//       NSString *strDate = [dateFormatter stringFromDate:[NSDate date]];
        let string = stringFromDate("yyyy-MM-dd", date: str)
//        string.substringToIndex(2)
        let year=NSString(string: string).substringWithRange(NSRange.init(location: 6, length: 4))
        let month=NSString(string: string).substringWithRange(NSRange.init(location: 3, length: 2))
        let day=NSString(string: string).substringWithRange(NSRange.init(location: 0, length: 2))
       
        print("\(year)年\(month)月\(day)日")
        showdataLB.text = "\(year)年\(month)月\(day)日"
    }
    func tap2(){
        vc2.dismissViewControllerAnimated(true, completion: nil)
    }
    func stringFromDate(format: String, date: NSDate) -> String {
        let locale = NSLocale.currentLocale()
        let dateFormat = NSDateFormatter.dateFormatFromTemplate(format, options: 0, locale: locale)
        let dateformatter = NSDateFormatter()
        dateformatter.dateFormat = dateFormat
        return dateformatter.stringFromDate(date)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    let vc=UIViewController()
    func click(){
        self.presentViewController(vc, animated: true, completion: nil)
        
    }
    let vc2=UIViewController()
    func click2(){
        self.presentViewController(vc2, animated: true, completion: nil)
        
    }
    func sysheadOnclick(){
        
        vc2.dismissViewControllerAnimated(true, completion: nil)
        let vc = ChooseImageViewcontroller()
        vc.delegete = self
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
    func finish(){
        if(nameTF.text == nil || nameTF.text == ""){
            SYProgressHUD.ShowFailed("昵称不能为空")
        }
        else{
            SYProgressHUD.ShowSuccess("正在跳转")
            SYProgressHUD.Clear()
        self.navigationController?.pushViewController(RegisterFinishViewcontroller(), animated: true)
        }
        
    }
    
    func button(){
        let pick:UIImagePickerController = UIImagePickerController()
        pick.delegate = self
        self.presentViewController(pick, animated: true, completion: nil)
    }
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        let offset = self.view.frame.size.height - (textView.frame.origin.y + textView.frame.size.height + 216 + 50)
        if(offset <= 0){
            UIView .animateWithDuration(0.3, animations: { () -> Void in
                var frame = self.view.frame
                frame.origin.y = offset
                self.view.frame = frame
            })
            
        }
        return true

    }
    func textViewShouldEndEditing(textView: UITextView) -> Bool {
        UIView.animateWithDuration(0.3) { () -> Void in
            var frame = self.view.frame
            frame.origin.y = 0.0
            self.view.frame = frame
        }
        return true

    }
    
    
    
    
    /**
    实现代理方法 UIImagePickerControllerDelegate,UINavigationControllerDelegate
    
    */

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let imageview:UIImageView = UIImageView(frame: CGRectMake(0, 100, 320, 300))
                let gotImage = info[UIImagePickerControllerOriginalImage] as! UIImage
                imageview.image = gotImage
                self.view.addSubview(imageview)
                print(info);
                self.dismissViewControllerAnimated(true, completion: nil);
    }
    /**
    实现代理方法 UIImagePickerControllerDelegate,UINavigationControllerDelegate
    */
    func imagePickerControllerDidCancel(picker: UIImagePickerController){
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
