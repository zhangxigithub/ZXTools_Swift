//
//  ZXAddressBook.swift
//  ChinasoClient
//
//  Created by zhangxi on 6/20/16.
//  Copyright © 2016 Chinaso. All rights reserved.
//

import Foundation
import Contacts
import UIKit



public class CCContactItem
{
    var name:String?
    var phone:String?
       
    func tel()
    {
        if self.phone != nil
        {
            UIApplication.shared.openURL(URL(string: "tel://\(self.phone!)")!)
        }
    }
}

@available(iOS 9.0, *)
public class ZXContacts
{
    static let sharedContacts = ZXContacts()
    
    var contactStore = CNContactStore()
    
    
    public func access(_ completionHandler:@escaping (Bool, Error?) -> Void)
    {
        let authorizationStatus = CNContactStore.authorizationStatus(for: CNEntityType.contacts)
        
        switch authorizationStatus {
        case .authorized:
            completionHandler(true,nil)
        case .denied:
            completionHandler(true,nil)
        case .restricted:
            //I don't konw what's this
            completionHandler(false,nil)
        case .notDetermined:
            self.contactStore.requestAccess(for: CNEntityType.contacts, completionHandler:completionHandler)
        }
    }

    
    public func query(_ queryString:String) -> Array<CCContactItem>?
    {
        /*
         http://stackoverflow.com/questions/33581966/phone-number-predicate-on-cncontactstore
         In short: you can't create a predicate to filter based on phone number. You have to pull all of the contacts and iterate. NOTE: For any given phone number, it 1) may not exist in contacts, or 2) exist more than once.
         */
        

        do{
            let predicate = CNContact.predicateForContacts(matchingName: queryString)
            
            let result = try contactStore.unifiedContacts(matching: predicate, keysToFetch: [CNContactPhoneNumbersKey as CNKeyDescriptor,CNContactGivenNameKey as CNKeyDescriptor,CNContactMiddleNameKey as CNKeyDescriptor,CNContactFamilyNameKey as CNKeyDescriptor])
            
            var contacts = [CCContactItem]()
            
            for item in result
            {
                let name  = String(format: "%@%@",item.familyName,item.givenName)
                
                let phone = (item.phoneNumbers.first?.value)?.stringValue ?? nil
                
                let contactItem = CCContactItem()
                contactItem.name = name
                contactItem.phone = phone
                
                if contactItem.phone != nil
                {
                    contacts.append(contactItem)
                }
            }
            
            return contacts
            
        }catch{
            return nil
        }
    }

    
}
