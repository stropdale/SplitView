//
//  MasterViewController.h
//  SplitViewController
//
//  Created by Richard Stockdale on 08/12/2016.
//  Copyright © 2016 Junction Seven. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SplitViewCommunicationProtocol.h"

@interface MasterViewController : UIViewController <SplitViewControllerReceiverProtocol>

@end
