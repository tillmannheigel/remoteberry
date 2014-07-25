//
//  RootViewController.h
//  Remoteberry
//
//  Created by osx on 21.07.14.
//
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *connectButton;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UITextField *ip_domainField;
@property (weak, nonatomic) IBOutlet UITextField *portField;
- (IBAction)connectButtonClicked:(id)sender;
- (IBAction)sendButtonClicked:(id)sender;

@end
