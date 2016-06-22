//
//  Student+CoreDataProperties.h
//  Database(CoreData)
//
//  Created by Mijeong Jeon on 6/22/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Student.h"

NS_ASSUME_NONNULL_BEGIN

@interface Student (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) School *school;

@end

NS_ASSUME_NONNULL_END
