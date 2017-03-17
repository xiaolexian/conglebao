//
//  SLBContactUsViewController.swift
//  shuLaiBao
//
//  Created by liangli on 16/1/25.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import UIKit

class SLBContactUsViewController: UIViewController, UITextViewDelegate {
    var contentTextView: UITextView!
    var placeholderLabel: UILabel!
    var numberLabel: UILabel!
    var navSendButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置标题
        setupNav()
        
        // 初始化视图
        setupView()
    }
    
    // MARK: - 初始化导航栏
    func setupNav() {
        title = "意见反馈"
        
        navSendButton = UIButton()
        navSendButton.bounds = CGRect(x: 0, y: 0, width: 44, height: 44)
        navSendButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        navSendButton.setTitle("发送", for: UIControlState())
        navSendButton.setTitleColor(UIColor.black, for: UIControlState())
        navSendButton.addTarget(self, action: #selector(SLBContactUsViewController.navSendButtonClick), for: .touchUpInside)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: navSendButton)
    }
    
    // MARK: - 导航栏按钮点击事件
    func navSendButtonClick() {
        var mailUrl = ""
        
        // 添加收件人
        let toRecipients = emailArr
        mailUrl += "mailto:\(toRecipients.joined(separator: ","))"
        
        // 添加抄送
        let ccRecipients = [""]
        mailUrl += "?cc=\(ccRecipients.joined(separator: ","))"
        
        // 添加密送
        let bccRecipients = [""]
        mailUrl += "&bcc=\(bccRecipients.joined(separator: ","))"
        
        // 添加主题
        let subjectString = "关于童乐宝的反馈建议"
        mailUrl += "&subject=\(subjectString)"
        
        // 添加邮件内容
        let bodyString = contentTextView.text
        mailUrl += "&body=<b>\(bodyString)</b>"
        
        // 发送邮件
        let email = mailUrl.addingPercentEncoding( withAllowedCharacters: CharacterSet.urlQueryAllowed)
        UIApplication.shared.openURL(URL(string: email!)!)
    }
    
    // MARK: - 初始化视图
    func setupView() {
        let contactUsView = SLBContactUsView()
        contactUsView.frame = view.bounds
        view.addSubview(contactUsView)
        
        // 内容TextView
        contentTextView = contactUsView.contentTextView
        contentTextView.delegate = self
        
        // 占位文字Label
        placeholderLabel = contactUsView.placeholderLabel
        
        // 字数Label
        numberLabel = contactUsView.numberLabel
    }
    
    // MARK: - TextView的代理方法
    func textViewDidChange(_ textView: UITextView) {
        if textView.text == "" {
            placeholderLabel.text = "请输入产品意见,我们将不断优化体验"
        } else {
            placeholderLabel.text = ""
        }
        
        if textView.text.characters.count > 100 {
            let alert = UIAlertView(title: "提示", message: "字符个数不能大于100", delegate: nil, cancelButtonTitle: NSLocalizedString("commitStr", comment: ""))
            alert.show()
            let index = textView.text.index(textView.text.startIndex, offsetBy: 100)
            textView.text = textView.text.substring(to: index)
        }
        numberLabel.text = "\(textView.text.characters.count)/100"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        contentTextView.resignFirstResponder()
    }
}
