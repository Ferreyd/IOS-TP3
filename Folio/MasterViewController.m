//
//  MasterViewController.m
//  Folio
//
//  Created by MBDS on 04/11/2014.
//  Copyright (c) 2014 MBDS. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Image.h"


@interface MasterViewController ()

@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    //allocation mémoire de tableimage
    self.imagesTab = [[NSMutableArray alloc] init];
    
    //instanciation des images
    Image *image1 = [[Image alloc] init];
    Image *image2 = [[Image alloc] init];
    Image *image3 = [[Image alloc] init];
    Image *image4 = [[Image alloc] init];
    Image *image5 = [[Image alloc] init];
    
    //On alloue de la mémoire pour un tableau de mutableobject dans le self.object
    if(!self.objects)
    {
        self.objects = [[NSMutableArray alloc] init];
    }
    
    //On set les noms de simages
    image1.nomImage = @"image 1";
    image2.nomImage = @"image 2";
    image3.nomImage = @"image 3";
    image4.nomImage = @"image 4";
    image5.nomImage = @"image 5";
    
    //On set les noms des fichiers
    image1.nomFichier = @"photo_1.jpg";
    image2.nomFichier = @"photo_2.jpg";
    image3.nomFichier = @"photo_3.jpg";
    image4.nomFichier = @"photo_4.jpg";
    image5.nomFichier = @"photo_5.jpg";
    
    //On ajout les images dans le tableau d'images
    [self.imagesTab addObject:image1];
    [self.imagesTab addObject:image2];
    [self.imagesTab addObject:image3];
    [self.imagesTab addObject:image4];
    [self.imagesTab addObject:image5];
    
    //On ajoute le tableau d'image dnas le self.object
    [self.objects addObject:self.imagesTab];
    
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    [self.objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Image *object = self.imagesTab[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:object];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.imagesTab.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    Image *image = self.imagesTab[indexPath.row];
    cell.textLabel.text = [image nomImage];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}
@end
