//
//  SplitViewNavigationViewController.m
//  SplitViewController
//
//  Created by Richard Stockdale on 08/12/2016.
//  Copyright © 2016 Junction Seven. All rights reserved.
//

#import "SplitViewNavigationController.h"
#import "SplitViewController.h"
#import "SplitViewCommunicationProtocol.h"

@interface SplitViewNavigationController ()

@end

@implementation SplitViewNavigationController

- (void) updateOtherViewController {
    if (self.splitViewController && [self.splitViewController respondsToSelector:@selector(tellOtherViewControllerToUpdate:)]) {
        [self.splitViewController tellOtherViewControllerToUpdate:self];
    }
}

- (void) otherViewControllerHasMadeAChange {
    if ([[self visibleViewController] conformsToProtocol:@protocol(SplitViewControllerReceiverProtocol)]) {
        NSObject <SplitViewControllerReceiverProtocol> *vc = (NSObject <SplitViewControllerReceiverProtocol> *) [self visibleViewController];
        [vc receivedUpdateRequestFromOtherViewController];
    }
}

@end
