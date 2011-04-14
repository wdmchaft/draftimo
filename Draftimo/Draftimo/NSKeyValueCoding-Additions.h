//
//  NSKeyValueCoding-Additions.h
//  Draftimo
//
//  Created by Kyle Macomber on 3/31/11.
//  Copyright 2011 Kyle Macomber. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSObject (NSKeyValueCoding_Additions)
// This method individually validates each value for key
// It returns a new dictionary containing the validated values
// All errors encountered are added to a dictionary which is returned by reference. If no errors are encountered, nothing is returned by reference.
- (NSDictionary *)validateValuesForKeysWithDictionary:(NSDictionary *)keyedValues errors:(NSArray **)outErrors;
@end
