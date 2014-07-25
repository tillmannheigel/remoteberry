//
//  RootViewController.m
//  Remoteberry
//
//  Created by osx on 21.07.14.
//
//

#import "SettingsViewController.h"
#import "Communicator.h"
#import "MainViewController.h"

@interface SettingsViewController ()
{
    Communicator *com;

}

@end

@implementation SettingsViewController

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
    [self setNotificationReceiver];
    [self setCommunicator];
    [self setButtons];
    [self setActivityIndicator];
    [self setTextFields];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setNotificationReceiver{
    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
    [defaultCenter addObserver:self selector:@selector(login) name:@"login" object:nil];
}

-(void)setCommunicator{
    com = [[Communicator alloc] init];
}

-(void)setButtons{
    [self.connectButton setTitle:@"Connect" forState:UIControlStateNormal];
}

-(void)setActivityIndicator{
    [self.activityIndicator setHidden:true];
}

-(void)setTextFields{
    //ip_domainField
    NSString *address = [[NSUserDefaults standardUserDefaults] objectForKey:@"defaultAddress"];
    if (address) {
        [self.ip_domainField setText:address];
    }
    //portField
    NSString *port = [[NSUserDefaults standardUserDefaults] objectForKey:@"defaultPort"];
    if (port) {
        [self.portField setText:port];
    }
}

- (IBAction)connectButtonClicked:(id)sender {
    [self resignFirstResponder];
    NSUserDefaults *nsu = [NSUserDefaults standardUserDefaults];
    [nsu setObject:self.ip_domainField.text forKey:@"defaultAddress"];
    [nsu setObject:self.portField.text forKey:@"defaultPort"];
    [NSThread detachNewThreadSelector:@selector(connectToHost) toTarget:com withObject:nil];

}

- (IBAction)sendButtonClicked:(id)sender {
    [NSThread detachNewThreadSelector:@selector(whoIsAtHome) toTarget:com withObject:nil];
}

-(void)login{
    MainViewController *main = [[MainViewController alloc] init];
    [self.navigationController pushViewController:main animated:true];
    NSLog(@"Login");
}


@end
