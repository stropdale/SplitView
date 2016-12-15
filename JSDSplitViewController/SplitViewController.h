//
//  SplitViewController.h
//  SplitViewController
//
//  Created by Richard Stockdale on 08/12/2016.
//  Copyright © 2016 Junction Seven. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SplitViewCommunicationProtocol.h"

@interface SplitViewController : UIViewController <SplitViewCommunicationCoordinatorProtocol>


/**
 Sets and animates the width of the master view as a percentage of the total view size
 */
@property (nonatomic) CGFloat masterViewWidthPercentage;

/**
 Should show the navigation bar in the master container. Default is YES
 */
@property (nonatomic) BOOL masterViewNavigationBarIsHidden;

/**
 Should show the navigation bar in the master container. Default is YES
 */
@property (nonatomic) BOOL detailViewNavigationBarIsHidden;

/**
 Sets the root master view controller (left size view controller). If the controller conforms to TDXSplictViewControllerReceiverProtocol
 it will be able to receive messages from the details view controller

 @param controller UIViewController that may or may not conform to TDXSplictViewControllerReceiverProtocol
 */
- (void) setMasterViewController:(UIViewController *) controller;

/**
 Sets the root details view controller (right size view controller). If the controller conforms to TDXSplictViewControllerReceiverProtocol
 it will be able to receive messages from the master view controller

 @param controller UIViewController that may or may not conform to TDXSplictViewControllerReceiverProtocol
 */
- (void) setDetailViewController:(UIViewController *) controller;

@end
