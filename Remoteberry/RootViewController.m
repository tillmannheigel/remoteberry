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
    self.view.backgroundColor = [UIColor whiteColor];
    [self addButton];
    [self showAlertView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showAlertView{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"..." message:@"What is your pi's ip (or dns)?" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
    [alert setAlertViewStyle:UIAlertViewStylePlainTextInput];
    NSString *address = [[NSUserDefaults standardUserDefaults] objectForKey:@"defaultAddress"];
    if (address) {
        [[alert textFieldAtIndex:0] setText:address];
    }
    [alert show];
        
}

-(void)addButton{
    UIButton *myButton = [[UIButton alloc] init];
    [myButton setTitle:@"Connect" forState:UIControlStateNormal];
    [self.view addSubview:myButton];
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
        NetworkCommunication *com = [[NetworkCommunication alloc] init];
        [com connectToHost];
    }
}


@end
