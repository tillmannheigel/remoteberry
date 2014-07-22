//
//  RootViewController.m
//  Remoteberry
//
//  Created by osx on 21.07.14.
//
//

#import "RootViewController.h"
#import "NetworkCommunication.h"

@interface RootViewController () <UIAlertViewDelegate>
{
    NetworkCommunication *com;

}

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    com = [[NetworkCommunication alloc] init];
    self.view.backgroundColor = [UIColor purpleColor];
    [self setButtons];
    [self setActivityIndicator];
    [self showAlertView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showAlertView{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"..." message:@"your pi's ip (or domain)?" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
    [alert setAlertViewStyle:UIAlertViewStylePlainTextInput];
    NSString *address = [[NSUserDefaults standardUserDefaults] objectForKey:@"defaultAddress"];
    if (address) {
        [[alert textFieldAtIndex:0] setText:address];
    }
    [alert show];
        
}

-(void)setButtons{
    [self.connectButton setTitle:@"Connect" forState:UIControlStateNormal];
    [self.sendButton setTitle:@"Send" forState:UIControlStateNormal];
}

-(void)setActivityIndicator{
    [self.activityIndicator setHidden:true];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSUserDefaults *nsu = [NSUserDefaults standardUserDefaults];
    if (buttonIndex == 1) {
        [nsu setObject:[alertView textFieldAtIndex:0].text forKey:@"defaultAddress"];
        [NSThread detachNewThreadSelector:@selector(connectToHost) toTarget:com withObject:nil];
    }
}


- (IBAction)connectButtonClicked:(id)sender {
    [NSThread detachNewThreadSelector:@selector(connectToHost) toTarget:com withObject:nil];

}

- (IBAction)sendButtonClicked:(id)sender {
    //[NSThread detachNewThreadSelector:@selector(sendGreeting) toTarget:com withObject:nil];
}


@end
