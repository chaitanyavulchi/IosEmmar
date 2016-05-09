//
//  ViewController.m
//  Emaar
//
//  Created by thrymr on 09/05/16.
//  Copyright © 2016 thrymr. All rights reserved.
//

#import "ViewController.h"
#import "AppProperties.h"
#import "ERHomeViewController.h"
#import <JVMenuPopover/JVMenuPopover.h>


@interface ViewController ()
@property (strong, nonatomic) ERHomeViewController *rootViewController;

@property (strong, nonatomic) JVMenuNavigationController *navigationController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = projectColor;
}
-(void)viewWillAppear:(BOOL)animated{
    [self performSelector:@selector(showNextScreen) withObject:nil afterDelay:0.5];
}

-(void)showNextScreen
{
   
    [self presentViewController:self.navigationController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom Accessors

- (ERHomeViewController *)rootViewController
{
    if (!_rootViewController)
    {
        _rootViewController = [[ERHomeViewController alloc] init];
    }
    
    return _rootViewController;
}


- (JVMenuNavigationController *)navigationController
{
    if (!_navigationController)
    {
        _navigationController = [[JVMenuNavigationController alloc] initWithRootViewController:self.rootViewController transparentNavBar:YES];
    }
    
    return _navigationController;
}


@end
