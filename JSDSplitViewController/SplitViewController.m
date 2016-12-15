//
//  SplitViewController.m
//  SplitViewController
//
//  Created by Richard Stockdale on 08/12/2016.
//  Copyright © 2016 Junction Seven. All rights reserved.
//

#import "SplitViewController.h"
#import "SplitViewNavigationController.h"

#import "MasterViewController.h"
#import "DetailViewController.h"

@interface SplitViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *masterViewWidth;

@property (strong, nonatomic) SplitViewNavigationController *masterViewNavController;
@property (strong, nonatomic) SplitViewNavigationController *detailViewNavController;

@property (weak, nonatomic) IBOutlet UIView *masterContainerView;
@property (weak, nonatomic) IBOutlet UIView *detailContainerView;

@end

@implementation SplitViewController

- (void) setMasterViewController: (UIViewController *) masterViewController andDetailViewController: (UIViewController *) detailsViewController {
    [self setMasterViewController:masterViewController];
    [self setDetailViewController:detailsViewController];
}

- (void) setMasterViewController:(UIViewController *) controller {
    self.masterViewNavController = [[SplitViewNavigationController alloc] initWithRootViewController:controller];
    self.masterViewNavController.isMasterNavigationController = YES;
    self.masterViewNavController.splitViewController = self;
    
    self.masterViewNavController.view.frame = self.masterContainerView.frame;
    [self.masterContainerView addSubview:self.masterViewNavController.view];
    
    self.masterViewNavigationBarIsHidden = YES;
}

- (void) setDetailViewController:(UIViewController *) controller {
    self.detailViewNavController = [[SplitViewNavigationController alloc] initWithRootViewController:controller];
    self.detailViewNavController.isMasterNavigationController = NO;
    self.detailViewNavController.splitViewController = self;
    
    self.detailViewNavController.view.frame = CGRectMake(0, 0, self.detailContainerView.bounds.size.width, self.detailContainerView.bounds.size.height);
    [self.detailContainerView addSubview:self.detailViewNavController.view];
    
    self.detailViewNavigationBarIsHidden = YES;
}


#pragma mark - Master Detail Communication

- (void) tellOtherViewControllerToUpdate:(SplitViewNavigationController *)sender {
    if (sender.isMasterNavigationController) {
        [self.detailViewNavController otherViewControllerHasMadeAChange];
    }
    else {
        [self.masterViewNavController otherViewControllerHasMadeAChange];
    }
}

#pragma mark - SplitView layout

- (void) setMasterViewWidthPercentage:(CGFloat) masterViewWidthPercentage {
    if (masterViewWidthPercentage <= 100.0) {
        _masterViewWidthPercentage = masterViewWidthPercentage;
        [self updateMasterDetailLayout];
    }
}

- (void) updateMasterDetailLayout {
    [self.view layoutIfNeeded];
    
    CGFloat vcWidth = self.view.bounds.size.width;
    CGFloat masterViewWidth = (vcWidth / 100.0) * self.masterViewWidthPercentage;
    
    self.masterViewWidth.constant = masterViewWidth;
    [UIView animateWithDuration:0.2 animations:^{
        [self.view layoutIfNeeded];
    }];
}

#pragma mark - Navigation Bar presentation

- (void) setMasterViewNavigationBarIsHidden:(BOOL)isHidden {
    _masterViewNavigationBarIsHidden = isHidden;
    self.masterViewNavController.navigationBarHidden = isHidden;
}

- (void) setDetailViewNavigationBarIsHidden:(BOOL)isHidden {
    _detailViewNavigationBarIsHidden = isHidden;
    self.detailViewNavController.navigationBarHidden = isHidden;
}

#pragma mark - Object Life Cycle

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self insertTestViewControllers];
}

- (void) viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Test methods

- (IBAction)stepperChanged:(UIStepper *)sender {
    self.masterViewWidthPercentage = sender.value;
    
}

- (void) insertTestViewControllers {
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"SplitView" bundle:nil];
    
    MasterViewController* mvc = [sb instantiateViewControllerWithIdentifier:@"MasterViewController"];
    DetailViewController* dvc = [sb instantiateViewControllerWithIdentifier:@"DetailViewController"];
    
    mvc.view.backgroundColor = [UIColor redColor];
    dvc.view.backgroundColor = [UIColor greenColor];
    
    [self setMasterViewController:mvc andDetailViewController:dvc];
}

@end
