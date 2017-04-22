//
//  TableViewControllerCustomAlert.m
//  LGAlertViewDemo
//

#import "TableViewControllerBlur.h"
#import "LGAlertView.h"

@interface TableViewControllerBlur ()

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) NSArray *titlesArray;

@end

@implementation TableViewControllerBlur

- (id)init {
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        self.title = @"Blur Effect";

        self.titlesArray = @[@"UIAlertView",
                             @"UIAlertViewController (Alert)",
                             @"UIActionSheet",
                             @"UIAlertViewController (ActionSheet)",
                             @"",
                             @"LGAlertView (Alert)",
                             @"LGAlertView (ActionSheet)",
                             @"",
                             @"LGAlertView blurred cover (Alert)",
                             @"LGAlertView blurred cover (ActionSheet)"];

        self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Image"]];
        self.imageView.clipsToBounds = YES;
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        self.tableView.backgroundView = self.imageView;

        self.tableView.separatorColor = UIColor.clearColor;
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return self;
}

#pragma mark - UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titlesArray.count;
}

#pragma mark - UITableView Delegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

    cell.backgroundColor = UIColor.clearColor;
    cell.textLabel.textColor = UIColor.whiteColor;
    cell.textLabel.font = [UIFont boldSystemFontOfSize:16.0];
    cell.textLabel.text = self.titlesArray[indexPath.row];
    cell.textLabel.layer.shadowColor = UIColor.blackColor.CGColor;
    cell.textLabel.layer.shadowOpacity = 1.0;
    cell.textLabel.layer.shadowOffset = CGSizeZero;
    cell.textLabel.layer.shadowRadius = 4.0;
    cell.userInteractionEnabled = [self.titlesArray[indexPath.row] length] > 0;

    UIView *view = [UIView new];
    view.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    cell.selectedBackgroundView = view;

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0: {
            [[[UIAlertView alloc] initWithTitle:@"Title"
                                        message:@"Message"
                                       delegate:nil
                              cancelButtonTitle:@"Cancel"
                              otherButtonTitles:@"Button 1", @"Button 2", @"Destructive", nil] show];

            break;
        }
        case 1: {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Title"
                                                                                     message:@"Message"
                                                                              preferredStyle:UIAlertControllerStyleAlert];

            UIAlertAction *cancelButton = [UIAlertAction actionWithTitle:@"Cancel"
                                                                   style:UIAlertActionStyleCancel
                                                                 handler:nil];

            UIAlertAction *destructiveButton = [UIAlertAction actionWithTitle:@"Destructive"
                                                                        style:UIAlertActionStyleDestructive
                                                                      handler:nil];

            UIAlertAction *otherButton1 = [UIAlertAction actionWithTitle:@"Button 1"
                                                                   style:UIAlertActionStyleDefault
                                                                 handler:nil];

            UIAlertAction *otherButton2 = [UIAlertAction actionWithTitle:@"Button 2"
                                                                   style:UIAlertActionStyleDefault
                                                                 handler:nil];

            [alertController addAction:cancelButton];
            [alertController addAction:destructiveButton];
            [alertController addAction:otherButton1];
            [alertController addAction:otherButton2];

            [self presentViewController:alertController animated:YES completion:nil];

            break;
        }
        case 2: {
            [[[UIActionSheet alloc] initWithTitle:@"Title"
                                         delegate:nil
                                cancelButtonTitle:@"Cancel"
                           destructiveButtonTitle:@"Destructive"
                                otherButtonTitles:@"Button 1", @"Button 2", nil] showInView:self.view];

            break;
        }
        case 3: {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Title"
                                                                                     message:@"Message"
                                                                              preferredStyle:UIAlertControllerStyleActionSheet];

            UIAlertAction *cancelButton = [UIAlertAction actionWithTitle:@"Cancel"
                                                                   style:UIAlertActionStyleCancel
                                                                 handler:nil];

            UIAlertAction *destructiveButton = [UIAlertAction actionWithTitle:@"Destructive"
                                                                        style:UIAlertActionStyleDestructive
                                                                      handler:nil];

            UIAlertAction *otherButton1 = [UIAlertAction actionWithTitle:@"Button 1"
                                                                   style:UIAlertActionStyleDefault
                                                                 handler:nil];

            UIAlertAction *otherButton2 = [UIAlertAction actionWithTitle:@"Button 2"
                                                                   style:UIAlertActionStyleDefault
                                                                 handler:nil];

            [alertController addAction:cancelButton];
            [alertController addAction:destructiveButton];
            [alertController addAction:otherButton1];
            [alertController addAction:otherButton2];

            [self presentViewController:alertController animated:YES completion:nil];

            break;
        }
        case 5: {
            [[[LGAlertView alloc] initWithTitle:@"Title"
                                        message:@"Message"
                                          style:LGAlertViewStyleAlert
                                   buttonTitles:@[@"Button 1", @"Button 2"]
                              cancelButtonTitle:@"Cancel"
                         destructiveButtonTitle:@"Destructive"] showAnimated];

            break;
        }
        case 6: {
            [[[LGAlertView alloc] initWithTitle:@"Title"
                                        message:@"Message"
                                          style:LGAlertViewStyleActionSheet
                                   buttonTitles:@[@"Button 1", @"Button 2"]
                              cancelButtonTitle:@"Cancel"
                         destructiveButtonTitle:@"Destructive"] showAnimated];

            break;
        }
        case 8: {
            LGAlertView *alertView = [[LGAlertView alloc] initWithTitle:@"Title"
                                                                message:@"Message"
                                                                  style:LGAlertViewStyleAlert
                                                           buttonTitles:@[@"Button 1", @"Button 2"]
                                                      cancelButtonTitle:@"Cancel"
                                                 destructiveButtonTitle:@"Destructive"];

            alertView.coverColor = UIColor.clearColor;
            alertView.coverBlurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
            alertView.coverAlpha = 0.9;

            [alertView showAnimated];

            break;
        }
        case 9: {
            LGAlertView *alertView = [[LGAlertView alloc] initWithTitle:@"Title"
                                                                message:@"Message"
                                                                  style:LGAlertViewStyleActionSheet
                                                           buttonTitles:@[@"Button 1", @"Button 2"]
                                                      cancelButtonTitle:@"Cancel"
                                                 destructiveButtonTitle:@"Destructive"];

            alertView.coverColor = UIColor.clearColor;
            alertView.coverBlurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
            alertView.coverAlpha = 0.9;

            [alertView showAnimated];

            break;
        }
    }

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
