//
//  ViewController.m
//  Dynamic
//
//  Created by AragonUit on 1/20/16.
//  Copyright © 2016 AragonUit. All rights reserved.
//

#import "ViewController.h"
#pragma mark - Animals
@interface Cat : NSObject
@end

@implementation Cat
- (NSString*) say {
     return @"Cat";
}
@end

@interface Dog : NSObject
@end

@implementation Dog
- (NSString*) say {
  return @"Dog";
}
@end

@interface Mouse : NSObject
@end

@implementation Mouse
- (NSString*) say {
    return @"Mouse";
}
@end

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtNameClass;
@property (weak, nonatomic) IBOutlet UIImageView *imgClass;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)BtnClickSubmit:(id)sender {
    NSString* animal = self.txtNameClass.text;
    
    
    Class class = NSClassFromString(animal);
    if (class == nil) {
        self.imgClass.image=[UIImage imageNamed:@"khongco"];
        return;
    }
    id object = [class new];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    SEL sayMethod = @selector(say);
#pragma clang diagnostic pop
    
    if ([object respondsToSelector:sayMethod]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        self.imgClass.image=[UIImage imageNamed:[object performSelector:sayMethod]];
#pragma clang diagnostic pop
    }
    else
    {
         self.imgClass.image=[UIImage imageNamed:@"khongco"];
    }
}

@end
