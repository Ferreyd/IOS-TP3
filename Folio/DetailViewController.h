//
//  DetailViewController.h
//  Folio
//
//  Created by MBDS on 04/11/2014.
//  Copyright (c) 2014 MBDS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

