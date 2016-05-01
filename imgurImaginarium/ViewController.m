//
//  ViewController.m
//  imgurImaginarium
//
//  Created by Rahul Jain on 5/1/16.
//  Copyright © 2016 Rahul Jain. All rights reserved.
//

#import "ViewController.h"
#import "ImgurImage.h"
#import "TableViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong,nonatomic) NSArray *imgurImages;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *clientID = @"6abd14ae3082e60";
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://api.imgur.com/3/album/STx2u"]];
    
    [request addValue:[NSString stringWithFormat:@"Client-ID %@", clientID] forHTTPHeaderField:@"Authorization"];
    
    [self.activityIndicator startAnimating];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSError *e = nil;
        
        NSDictionary *imgurData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&e];
        
        NSDictionary *imageData = [[imgurData objectForKey:@"data"] objectForKey:@"images"];
        
        NSMutableArray *imgurImages = [[NSMutableArray alloc] init];
        
        for (NSDictionary *image in imageData) {
            
            ImgurImage *imgurImage = [[ImgurImage alloc] init];
            
            imgurImage.imageId = [image objectForKey:@"id"];
            imgurImage.imageUrl = [image objectForKey:@"link"];
            imgurImage.imageTitle = [image objectForKey:@"title"];
            imgurImage.imageDescription = [image objectForKey:@"description"];
            imgurImage.width = [image objectForKey:@"width"];
            imgurImage.height = [image objectForKey:@"height"];
            
            [imgurImages addObject:imgurImage];
        }
        
        self.imgurImages = imgurImages;
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self performSegueWithIdentifier:@"tableViewSegue" sender:nil];
        });
        
        
       // NSLog([NSString stringWithFormat:@"%@"],imgurData);
    }];
    
    [task resume];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    [self.activityIndicator stopAnimating];
    
    TableViewController *tableViewController = segue.destinationViewController;
    
    tableViewController.imageArray = self.imgurImages;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
