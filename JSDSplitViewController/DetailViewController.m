//
//  DetailViewController.m
//  SplitViewController
//
//  Created by Richard Stockdale on 08/12/2016.
//  Copyright © 2016 Junction Seven. All rights reserved.
//

#import "DetailViewController.h"
#import "SplitViewNavigationController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
- (IBAction)sendMessageToOther:(id)sender {
    if ([self.navigationController isKindOfClass:[SplitViewNavigationController class]]) {
        SplitViewNavigationController *nc = (SplitViewNavigationController *)self.navigationController;
        
        [nc updateOtherViewController];
    }
}

- (void) receivedUpdateRequestFromOtherViewController {
    self.view.backgroundColor = [self randomColour];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIColor *) randomColour {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
