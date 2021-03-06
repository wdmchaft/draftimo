//
//  DMDraft.h
//  Draftimo
//
//  Created by Kyle Macomber on 4/4/11.
//  Copyright (c) 2011 Kyle Macomber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DMLeague, DMTeam;

@interface DMDraft : NSManagedObject {
@private
}
@property (nonatomic, retain) NSNumber * snakes;
@property (nonatomic, retain) NSNumber * pick;
@property (nonatomic, retain) DMLeague * league;
@property (nonatomic, retain) DMTeam * userTeam;

@end
