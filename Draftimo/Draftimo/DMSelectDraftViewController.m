//
//  DMSelectDraftViewController.m
//  Draftimo
//
//  Created by Kyle Macomber on 4/14/11.
//  Copyright 2011 Kyle Macomber. All rights reserved.
//

#import "DMSelectDraftViewController.h"
#import "DMOAuthController.h"
#import "DMLeaguesCollectionViewController.h"
#import "DMLeagueDetailViewController.h"
#import "DMUnboxTransformer.h"


@interface DMSelectDraftViewController ()
@property (retain) DMLeaguesCollectionViewController *leaguesCollectionViewController;
@property (retain) DMLeagueDetailViewController *leagueDetailViewController;

- (void)managedObjectContextDidChange:(NSNotification *)notification;
@end

@implementation DMSelectDraftViewController
@synthesize leaguesCollectionView = __leaguesCollectionView;
@synthesize leagueDetailView = __leagueDetailView;
@synthesize leaguesCollectionViewController = __leaguesCollectionViewController;
@synthesize leagueDetailViewController = __leagueDetailViewController;

- (id)init
{
    self =  [super initWithNibName:ClassKey(DMSelectDraftViewController) bundle:nil];
    if (!self) return nil;

    self.leaguesCollectionViewController = [[DMLeaguesCollectionViewController alloc] initWithNibName:@"DMLeaguesCollectionViewController" bundle:nil];
    [self addViewController:self.leaguesCollectionViewController];
    self.leagueDetailViewController = [[DMLeagueDetailViewController alloc] initWithNibName:@"DMLeagueDetailViewController" bundle:nil];
    [self addViewController:self.leagueDetailViewController];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(managedObjectContextDidChange:) name:NSManagedObjectContextObjectsDidChangeNotification object:[[[self windowController] document] managedObjectContext]];
    
    return self;
}

- (void)awakeFromNib
{
    [[self.leaguesCollectionViewController view] setFrame:[self.leaguesCollectionView bounds]];
    [self.leaguesCollectionView addSubview:[self.leaguesCollectionViewController view]];
	
    [[self.leagueDetailViewController view] setFrame:[self.leagueDetailView bounds]];
    [self.leagueDetailView addSubview:[self.leagueDetailViewController view]];
    
    [self.leagueDetailViewController bind:@"representedObject" toObject:self.leaguesCollectionViewController.arrayController withKeyPath:@"selectedObjects" options:[NSDictionary dictionaryWithObjectsAndKeys:@"DMUnboxTransformer", NSValueTransformerNameBindingOption, nil]];
}

- (void)managedObjectContextDidChange:(NSNotification *)notification
{
    [self.leaguesCollectionViewController.arrayController fetch:nil];
}

@end
