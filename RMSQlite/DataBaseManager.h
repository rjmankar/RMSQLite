//
//  DataBaseManager.h
//  RMSQlite
//
//  Created by Student P_02 on 18/08/16.
//  Copyright © 2016 Rahul Mankar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataBaseManager : NSObject

+(instancetype) sharedManager;
-(NSString *) getDataBasePath;

-(void) copyDatabaseFromMainBundleToSandBox;

@end
