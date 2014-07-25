//
//  RootViewController.h
//  Remoteberry
//
//  Created by osx on 21.07.14.
//
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *connectButton;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
- (IBAction)connectButtonClicked:(id)sender;
- (IBAction)sendButtonClicked:(id)sender;

@end
