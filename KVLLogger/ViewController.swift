//
//  ViewController.swift
//  KVLLogger
//
//  Created by Misha on 18/05/2017.
//  Copyright © 2017 Misha Koval. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        let normalLogView = self.getButtonView(text: "Print normal message to console", selector: #selector(printNormalMessageLog))
        normalLogView.frame = CGRect(x: normalLogView.frame.origin.x,
                                     y: 25,
                                     width: normalLogView.frame.size.width,
                                     height: normalLogView.frame.size.height)
        self.view.addSubview(normalLogView)
        
        
        let successlLogView = self.getButtonView(text: "Print success message to console", selector: #selector(printSuccessMessageLog))
        successlLogView.frame = CGRect(x: successlLogView.frame.origin.x,
                                       y: normalLogView.frame.origin.y + normalLogView.frame.size.height + 10,
                                     width: successlLogView.frame.size.width,
                                     height: successlLogView.frame.size.height)
        self.view.addSubview(successlLogView)
        
        
        let warningLogView = self.getButtonView(text: "Print warning message to console", selector: #selector(printWarningMessageLog))
        warningLogView.frame = CGRect(x: warningLogView.frame.origin.x,
                                      y: successlLogView.frame.origin.y + successlLogView.frame.size.height + 10,
                                     width: warningLogView.frame.size.width,
                                     height: warningLogView.frame.size.height)
        self.view.addSubview(warningLogView)
        
        
        let errorLogView = self.getButtonView(text: "Print error message to console", selector: #selector(printErrorMessageLog))
        errorLogView.frame = CGRect(x: errorLogView.frame.origin.x,
                                    y: warningLogView.frame.origin.y + warningLogView.frame.size.height + 10,
                                     width: errorLogView.frame.size.width,
                                     height: errorLogView.frame.size.height)
        self.view.addSubview(errorLogView)
        
        
        let exceptionLogView = self.getButtonView(text: "Print exception to console", selector: #selector(printException))
        exceptionLogView.frame = CGRect(x: exceptionLogView.frame.origin.x,
                                        y: errorLogView.frame.origin.y + errorLogView.frame.size.height + 10,
                                     width: exceptionLogView.frame.size.width,
                                     height: exceptionLogView.frame.size.height)
        self.view.addSubview(exceptionLogView)
        
        
        let errorView = self.getButtonView(text: "Print error to console", selector: #selector(printErrorLog))
        errorView.frame = CGRect(x: errorView.frame.origin.x,
                                 y: exceptionLogView.frame.origin.y + exceptionLogView.frame.size.height + 10,
                                     width: errorView.frame.size.width,
                                     height: errorView.frame.size.height)
        self.view.addSubview(errorView)
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func getButtonView(text: String!, selector: Selector) -> UIView
    {
        let view = UIView()
        view.frame = CGRect(x: 5, y: 0, width: self.view.frame.size.width - 10, height: 50)

        
        
        let textLbl = UILabel()
        textLbl.text = text
        textLbl.sizeToFit()
        textLbl.frame = CGRect(x: 0,
                               y: view.frame.size.height / 2 - textLbl.frame.size.height / 2,
                               width: textLbl.frame.size.width,
                               height: textLbl.frame.size.height)
        view.addSubview(textLbl)
        
        
        
        
        
        let btnSize: CGSize = CGSize(width: 60, height: 40.0)
        let btn = UIButton(type: .roundedRect);
        btn.setTitle("Print!", for: .normal)
        btn.backgroundColor = UIColor.lightGray
        btn.frame = CGRect(x: textLbl.frame.origin.x + textLbl.frame.size.width + 10,
                           y: view.frame.size.height / 2 - btnSize.height / 2,
                           width: btnSize.width,
                           height: btnSize.height)
        btn.addTarget(self, action: selector, for: .touchUpInside)
        view.addSubview(btn)
        
        
        
        
        return view
    }
    
    @objc internal func printNormalMessageLog()
    {
        KVLLogger.printNormalMessage(self.getNewUniqueText(type: "NORMAL"), location: GetCodeLocation())
    }
    
    @objc internal func printSuccessMessageLog()
    {
        KVLLogger.printSuccessMessage(self.getNewUniqueText(type: "SUCCESS"), location: GetCodeLocation())
    }
    
    @objc internal func printWarningMessageLog()
    {
        KVLLogger.printWarningMessage(self.getNewUniqueText(type: "WARNING"), location: GetCodeLocation())
    }
    
    @objc internal func printErrorMessageLog()
    {
        KVLLogger.printErrorMessage(self.getNewUniqueText(type: "ERROR"), location: GetCodeLocation())
    }
    
    @objc internal func printErrorLog()
    {
        KVLLogger.printError(self.getErrorObject(), location: GetCodeLocation())
    }
    
    @objc internal func printException()
    {
        KVLLogger.printException(self.getExsceptionObject(), location: GetCodeLocation())
    }


    
    private func getNewUniqueText(type: String!) -> String
    {
        return "This is a *\(type!)* message with UUID: {"+NSUUID().uuidString+"}"
    }
    
    private func getErrorObject() -> NSError
    {
        if let data = self.getNewUniqueText(type: "").data(using: .utf8)
        {
            do
            {
                _ = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                return NSError()
            }
            catch
            {
                return error as NSError
            }
        }
        return NSError()
    }
    
    private func getExsceptionObject() -> NSException
    {
        let objcExceptionGenerator = KVLObjCExceptionGenerator()
        
        return objcExceptionGenerator.generateException()
    }
}

