//
//  TestViewController.m
//  test
//
//  Created by Victor
//  Copyright © 2017 Victor. All rights reserved.
//

#import "TestViewController.h"
#import "NetManager.h"
#import "RestaurantsTableViewCell.h"
#import "Restaurant.h"

@interface TestViewController() <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray<Restaurant *> *restaurants;
@property (nonatomic, strong) NSArray<Restaurant *> *filteredRestaurants;

@end

@implementation TestViewController

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


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.restaurants.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = @"restaurantCell";
    RestaurantsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.model = self.restaurants[indexPath.row];
    
    return cell;
}

- (void)navbarChangeColor {
    [self.navigationController.navigationBar   setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:0.00 green:0.72 blue:0.79 alpha:1.0]}];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 226;
}

@end
