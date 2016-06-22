//
//  AppDelegate.h
//  Database(CoreData)
//
//  Created by Mijeong Jeon on 6/22/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
// 영구 저장소 코디네이터
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

// 실질적으로 저장소에 데이터를 저장하는 메소드
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

