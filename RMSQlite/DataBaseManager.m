//
//  DataBaseManager.m
//  RMSQlite
//
//  Created by Student P_02 on 18/08/16.
//  Copyright © 2016 Rahul Mankar. All rights reserved.
//

#import "DataBaseManager.h"

@implementation DataBaseManager

+(instancetype) sharedManager {
    
    static DataBaseManager *sharedManager;
    if (sharedManager==nil) {
        sharedManager=[[DataBaseManager alloc]init];
    }
    return sharedManager;
}


-(NSString *) getDataBasePath{
    
    NSArray *docDir= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *databasePath=[[docDir objectAtIndex:0]stringByAppendingPathComponent:@"Student.sqlite"];
    
    NSLog(@"\n\n%@\n\n",databasePath);
    
    return databasePath;
}



-(void) copyDatabaseFromMainBundleToSandBox{
    
    NSString *sourcePath=[[NSBundle mainBundle]pathForResource:@"Student" ofType:@"sqlite"];
    NSLog(@"%@",sourcePath);
    NSString *destinationPath= [self getDataBasePath];
    
    BOOL isSourceExist=[[NSFileManager defaultManager]fileExistsAtPath:sourcePath];
    BOOL isDestinationExist=[[NSFileManager defaultManager]
                             fileExistsAtPath:destinationPath];
    if (isSourceExist) {
        
        if (isDestinationExist) {
            
            NSLog(@"Database alrerady copied");
        }
        else
        {
            //copy logic
            
            NSString *error;
            [[NSFileManager defaultManager]copyItemAtPath:sourcePath toPath:destinationPath error:&error];
            
            
            
        }
    }
    
    NSLog(@"Database is not in the main bundle");

}



@end
