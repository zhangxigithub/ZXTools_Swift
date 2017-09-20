//
//  AppDelegate.swift
//  demo
//
//  Created by zhangxi on 12/25/15.
//  Copyright © 2015 http://zhangxi.me. All rights reserved.
//

import UIKit
import MultipeerConnectivity



let BonjourDidConnectPeerNotification    = "BonjourDidConnectPeerNotification"
let BonjourDidDisconnectPeerNotification = "BonjourDidDisconnectPeerNotification"
let BonjourDidReceiveMessageNotification = "BonjourDidReceiveMessageNotification"

let BonjourNotificationPeerKey           = "BonjourNotificationPeerKey"
let BonjourNotificationMessageKey        = "BonjourNotificationMessageKey"



@objc protocol BonjourDelegate
{
    @objc optional func didConnectPeer(_ peerID:MCPeerID)
    @objc optional func didDisconnectPeer(_ peerID:MCPeerID)
    @objc optional func didReceiveMessage(_ message:String,peerID:MCPeerID)
}



open class Bonjour: NSObject,MCSessionDelegate,MCNearbyServiceAdvertiserDelegate,MCNearbyServiceBrowserDelegate{
    
    
    static let sharedBonjour: Bonjour = {
        return Bonjour()
    }()
    
    var delegate:BonjourDelegate?
    
    
    var advertisier:MCNearbyServiceAdvertiser!
    var browser:MCNearbyServiceBrowser!
    var session:MCSession!
    
    
    var peerID : MCPeerID?
    let serviceType = "zx-bonjour"
    
    func bonjour(_ name:String? = nil)
    {
        
        if name == nil
        {
            peerID = MCPeerID(displayName: UIDevice.current.name)
        }else
        {
            peerID = MCPeerID(displayName: name!)
        }
        
        
        browser = MCNearbyServiceBrowser(peer: peerID!, serviceType: serviceType)
        browser.delegate = self
        browser.startBrowsingForPeers()
        
        
        advertisier  = MCNearbyServiceAdvertiser(peer: peerID!, discoveryInfo: nil, serviceType: serviceType)
        advertisier.delegate = self
        advertisier.startAdvertisingPeer()
        
        
        
        session = MCSession(peer: peerID!)
        session.delegate = self
    }
    
    func sendMessage(_ message:String,mode:MCSessionSendDataMode = MCSessionSendDataMode.reliable)
    {
        do {
            let data = message.data(using: String.Encoding.utf8)!
            try session.send(data, toPeers:session.connectedPeers, with: mode)
        }
        catch
        {
        }
    }

    

    //MARK: - MCNearbyServiceAdvertiserDelegate
    
    open func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void)
    {
        invitationHandler(true,session)
    }
    
    open func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didNotStartAdvertisingPeer error: Error)
    {
    }
    
    
    
    //MARK: - MCNearbyServiceBrowserDelegate
    
    open func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?)
    {
        browser.invitePeer(peerID, to: session, withContext: nil, timeout: 20)
    }
    
    open func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID)
    {
        browser.invitePeer(peerID, to: session, withContext: nil, timeout: 20)
    }
    
    
    
    //MARK: - MCSessionDelegate
    
    open func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState)
    {
        switch state
        {
        case .notConnected:

            DispatchQueue.main.async { () -> Void in
                self.delegate?.didDisconnectPeer?(peerID)
                NotificationCenter.default.post(name: Notification.Name(rawValue: BonjourDidDisconnectPeerNotification), object: nil, userInfo: [BonjourNotificationPeerKey : peerID])
            }
        case .connecting:
            break
        case .connected:
            DispatchQueue.main.async { () -> Void in
                self.delegate?.didConnectPeer?(peerID)
                NotificationCenter.default.post(name: Notification.Name(rawValue: BonjourDidConnectPeerNotification), object: nil, userInfo: [BonjourNotificationPeerKey : peerID])
            }

        }
    }
    open func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID)
    {
        DispatchQueue.main.async { () -> Void in
           
            if let message = String(data: data, encoding: String.Encoding.utf8)
            {
                self.delegate?.didReceiveMessage?(message, peerID: peerID)
                NotificationCenter.default.post(name: Notification.Name(rawValue: BonjourDidConnectPeerNotification), object: nil, userInfo: [BonjourNotificationPeerKey : peerID,BonjourNotificationMessageKey:message])
            }
        }
    }
    

    
    
    // Received a byte stream from remote peer.
    
    public func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID){}
    
    
    // Start receiving a resource from remote peer.
    
    public func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress){}
    
    
    // Finished receiving a resource from remote peer and saved the content
    // in a temporary location - the app is responsible for moving the file
    // to a permanent location within its sandbox.
    
    public func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?){}
    
    


}
