//
//  SplitViewCommunicationProtocol.h
//  SplitViewController
//
//  Created by Richard Stockdale on 08/12/2016.
//  Copyright © 2016 Junction Seven. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SplitViewNavigationController;


/**
 Used by the coordinating instance. The message will be received then is usually forward on to the appropriate destination
 (usually a UIViewController which will adopt TDXSplictViewControllerReceiverProtocol to receive the message)
 TDXSplictViewControllerReceiverProtocol should have a corresponding method
 */
@protocol SplitViewCommunicationCoordinatorProtocol <NSObject>


@required

- (void) tellOtherViewControllerToUpdate: (SplitViewNavigationController *) sender;

@end


/**
 Usually adopted by a ViewController placed withing a split view controller and a SplitViewNavigationController in order to
 receive messages from another view controller currently being presented
 SplitViewCommunicationCoordinatorProtocol should have a corresponding method
 */
@protocol SplitViewControllerReceiverProtocol <NSObject>

@required
- (void) receivedUpdateRequestFromOtherViewController;

@end
