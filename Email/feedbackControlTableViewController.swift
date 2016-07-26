//
//  feedbackControlTableViewController.swift
//  Email
//
//  Created by Jason Fundukian on 7/26/16.
//  Copyright © 2016 Jason Fundukian. All rights reserved.
//  https://www.youtube.com/watch?v=JP0MC9sQ24E

import UIKit
import MessageUI

class feedbackControlTableViewController: UITableViewController, MFMailComposeViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Selected row = \(indexPath.description)")
        
        if indexPath.section == 0 && indexPath.row == 0 {
            print("Rate Us row tapped.")
        }
        
        if indexPath.section == 0 && indexPath.row == 1 {
            print("Feedback row tapped.")
            
            let mailComposeViewController = configureMailComposeViewController()
            if MFMailComposeViewController.canSendMail() {
                self.presentViewController(mailComposeViewController, animated: true, completion: nil)
            }
            else {
                self.showSendMailErrorAlert()
            }
        }
    }
    
        func configureMailComposeViewController() -> MFMailComposeViewController {
            let mailComposerVC = MFMailComposeViewController()
            mailComposerVC.mailComposeDelegate = self
            
            mailComposerVC.setToRecipients(["your@email.com"])
            mailComposerVC.setSubject("App Feedback")
            mailComposerVC.setMessageBody("Hi Team! I Would like to share the following feedack..\n", isHTML: false)
            
            return mailComposerVC
        }
        
        func showSendMailErrorAlert() {
            let sendMailErrorAlert = UIAlertController(title: "Could not send email.", message: "Your device couldnot send email.  Please check email configurations and try again.", preferredStyle: .Alert)
            //sendMailErrorAlert.show()
            presentViewController(sendMailErrorAlert, animated: true, completion: nil)
        }
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        switch result {
        case MFMailComposeResultCancelled:
            print("Cancelled Mail")
        case MFMailComposeResultSent:
            print("Mail Sent")
        default:
            break
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}


