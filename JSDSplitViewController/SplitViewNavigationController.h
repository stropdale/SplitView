//
//  SplitViewNavigationViewController.h
//  SplitViewController
//
//  Created by Richard Stockdale on 08/12/2016.
//  Copyright © 2016 Junction Seven. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SplitViewCommunicationProtocol.h"
@class SplitViewController;

@interface SplitViewNavigationController : UINavigationController

@property (nonatomic) BOOL isMasterNavigationController;

/**
 Delegate object (the split view controller)
 */
@property (nonatomic, weak) SplitViewController <SplitViewCommunicationCoordinatorProtocol> *splitViewController;


/**
 Call from the view controller to tell the counterpart view controller in the splitView that it should update it's data set
 */
- (void) updateOtherViewController;


/**
 Called from the split view controller to tell the currently displaying view controller that its counterpart has made a change
 */
- (void) otherViewControllerHasMadeAChange;

@end
