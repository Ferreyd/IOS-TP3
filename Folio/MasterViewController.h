//
//  MasterViewController.h
//  Folio
//
//  Created by MBDS on 04/11/2014.
//  Copyright (c) 2014 MBDS. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;
@property(strong,nonatomic) NSMutableArray *imagesTab;


@end

