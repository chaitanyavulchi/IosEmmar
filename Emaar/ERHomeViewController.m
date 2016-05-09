//
//  ERHomeViewController.m
//  Emaar
//
//  Created by thrymr on 09/05/16.
//  Copyright © 2016 thrymr. All rights reserved.
//

#import "ERHomeViewController.h"
#import <JVMenuPopover/JVMenuPopover.h>
#import "ERBudgetsViewController.h"
#import "ERGraphsViewController.h"
#import "ERReviewsViewController.h"

@interface ERHomeViewController () <UINavigationControllerDelegate, JVMenuPopoverDelegate>

@property (nonatomic, strong) JVMenuPopoverView *menuPopover;

@property (nonatomic, strong) JVMenuItems *menuItems;

@property (nonatomic, strong) CAGradientLayer *gradient;

@property (nonatomic, strong) ERHomeViewController *rootController;

@property (nonatomic, strong) ERBudgetsViewController *secondController;

@property (nonatomic, strong) ERGraphsViewController *thirdController;

@property (nonatomic, strong)  ERReviewsViewController *fourthController;


@end

@implementation ERHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self commonInit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)commonInit
{
    self.view.backgroundColor = [UIColor clearColor];
    
    [self.containerView addSubview:self.imageView];
    [self.containerView addSubview:self.label];
    
    [self.view addSubview:self.containerView];
    
    // creating menu
    self.menuPopover = [self menuPopover];
    
    // setting up menu bar button
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu_black-48"] style:UIBarButtonItemStylePlain target:self action:@selector(showMenu)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor blackColor];
    
    [self addObservers];
}


#pragma mark - Custom Accessors

- (JVMenuItems *)menuItems
{
    if(!_menuItems)
    {
        _menuItems = [[JVMenuItems alloc] initWithMenuImages:nil
                                                  menuTitles:@[@"Home",
                                                               @"Budgets",
                                                               @"Graphs",
                                                               @"Reviews",
                                                               ]
                                        menuCloseButtonImage:[UIImage imageNamed:@"cancel_filled-50"]];
        _menuItems.menuSlideInAnimation = YES;
    }
    
    return _menuItems;
}


- (JVMenuPopoverView *)menuPopover
{
    if(!_menuPopover)
    {
        _menuPopover = [[JVMenuPopoverView alloc] initWithFrame:self.view.frame menuItems:self.menuItems];
        _menuPopover.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        _menuPopover.delegate = self;
    }
    
    return _menuPopover;
}


- (UIView *)containerView
{
    if (!_containerView)
    {
        _containerView = [[UIView alloc] initWithFrame:self.containerViewFrame];
        UIColor *firstColor = [UIColor colorWithHexString:@"52EDC7"];
        UIColor *secondColor = [UIColor colorWithHexString:@"5AC8FB"];
        [_containerView gradientEffectWithFirstColor:firstColor secondColor:secondColor];
    }
    
    return _containerView;
}


- (CGRect)containerViewFrame
{
    return CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}


- (UIImageView *)imageView
{
    if (!_imageView)
    {
        _imageView = [[UIImageView alloc] initWithImage:self.image];
        _imageView.frame = self.imageViewFrame;
    }
    
    return _imageView;
}


- (CGRect)imageViewFrame
{
    return CGRectMake(self.view.frame.size.width/2-self.image.size.width/2, self.view.frame.size.height/2-30, self.image.size.width, self.image.size.height);
}


- (UIImage *)image
{
    if (!_image)
    {
        _image = [[UIImage imageNamed:@"home-48"] changeImageColor:[UIColor blackColor]];
    }
    
    return _image;
}


- (UILabel *)label
{
    if (!_label)
    {
        _label = [[UILabel alloc] initWithFrame:self.labelFrame];
        _label.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont fontWithName:@"HelveticaNeue" size:20];
        _label.textColor = [UIColor blackColor];
        _label.text = @"Home";
    }
    
    return _label;
}


- (CGRect)labelFrame
{
    return CGRectMake(self.view.frame.size.width/2-110, self.view.frame.size.height/2-20, 220, 60);
}


- (ERHomeViewController *)rootController
{
    if (!_rootController)
    {
        _rootController = [[ERHomeViewController alloc]init];
    }
    
    return _rootController;
}


- (ERBudgetsViewController *)secondController
{
    if (!_secondController)
    {
        _secondController = [[ERBudgetsViewController alloc]init];
    }
    
    return _secondController;
}


- (ERGraphsViewController *)thirdController
{
    if (!_thirdController)
    {
        _thirdController = [[ERGraphsViewController alloc]init];
    }
    
    return _thirdController;
}


- (ERReviewsViewController *)fourthController
{
    if (!_fourthController)
    {
        _fourthController = [[ERReviewsViewController alloc]init];
    }
    
    return _fourthController;
}





#pragma mark - Menu Helper Functions

- (void)showMenu
{
    [self.menuPopover showMenuWithController:self];
}


#pragma mark - Menu Delegate

- (void)menuPopoverDidSelectViewControllerAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0)
    {
        self.navigationController.viewControllers = @[self.rootController];
    }
    else if(indexPath.row == 1)
    {
        self.navigationController.viewControllers = @[self.secondController];
    }
    else if (indexPath.row == 2)
    {
        self.navigationController.viewControllers = @[self.thirdController];
    }
    else if (indexPath.row == 3)
    {
        self.navigationController.viewControllers = @[self.fourthController];
    }
    
}


#pragma mark - Observers

- (void)addObservers
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didDeviceOrientationChange:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];
}


- (void)didDeviceOrientationChange:(NSNotification *)notification
{
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    self.view.frame = CGRectMake(0, 0, screenSize.width, screenSize.height);
    
    self.containerView.frame = self.containerViewFrame;
    UIColor *firstColor = [UIColor colorWithHexString:@"52EDC7"];
    UIColor *secondColor = [UIColor colorWithHexString:@"5AC8FB"];
    [self.containerView gradientEffectWithFirstColor:firstColor secondColor:secondColor];
    
    self.imageView.frame = self.imageViewFrame;
    self.label.frame = self.labelFrame;
}
@end
