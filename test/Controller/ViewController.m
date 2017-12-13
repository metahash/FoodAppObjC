//
//  ViewController.m
//  test
//
//  Created by Victor 
//  Copyright © 2017 Victor. All rights reserved.
//

#import "ViewController.h"
#import "NetManager.h"
#import "RestaurantsTableViewCell.h"
#import "Restaurant.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray<Restaurant *> *restaurants;
    @end

@implementation ViewController
    
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self navbarChangeColor];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"RestaurantsTableViewCell" bundle:nil] forCellReuseIdentifier:@"restaurantCell"];
    [[NetManager sharedInstance]loadRequestWithPath:@"http://localhost:8000/api/customer/restaurants/" completion:^(id data, NSError *error) {
        if(data){
            self.restaurants = [MTLJSONAdapter modelsOfClass:[Restaurant class] fromJSONArray:[data valueForKey:@"restaurants"] error:nil];
            //dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            //});
        }
    }];
}
    
    //Back to ViewController
    - (IBAction)returnToListVC:(UIStoryboardSegue *)sender{}
    
    - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
        return 226;
    }
    
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.restaurants.count;
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"restaurantCell";
    RestaurantsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.model = self.restaurants[indexPath.row];
    
    return cell;
}
    
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"showD" sender:self];
}
    
- (void)navbarChangeColor {
    [self.navigationController.navigationBar   setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:0.00 green:0.72 blue:0.79 alpha:1.0]}];
}
    
    @end
