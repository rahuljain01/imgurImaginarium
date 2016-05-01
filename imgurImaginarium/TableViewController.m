//
//  TableViewController.m
//  imgurImaginarium
//
//  Created by Rahul Jain on 5/2/16.
//  Copyright © 2016 Rahul Jain. All rights reserved.
//

#import "TableViewController.h"
#import "ImgurCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "ImgurImage.h"

@interface TableViewController () <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.tableView.estimatedRowHeight = 50;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.imageArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ImgurCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImgurCell"];
    
    if (cell == nil) {
        cell = [[ImgurCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ImgurCell"];
    }
    
    ImgurImage *image = [self.imageArray objectAtIndex:indexPath.row];
    [cell.imgurImageView setFrame:CGRectMake(cell.imgurImageView.frame.origin.x, cell.imgurImageView.frame.origin.y, cell.imgurImageView.frame.size.width, cell.imgurImageView.frame.size.height * cell.imgurImageView.frame.size.width*[image.height doubleValue] /[image.width doubleValue])];
    
    cell.titleLabel.text = image.imageTitle;
    
    [cell.titleLabel sizeToFit];
    cell.descriptionLabel.text = image.imageDescription;
    [cell.descriptionLabel sizeToFit];
    
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    
    [cell.imgurImageView sd_setImageWithURL:[NSURL URLWithString:image.imageUrl]
                      placeholderImage:[UIImage imageNamed:@"Placeholder"]];
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
