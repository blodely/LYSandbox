//
//  LYBox.h
//  LYSandbox
//
//  Created by Luo Yu(blodely, blodely@gmail.com) on 2018-07-17.
//  Copyright (c) 2018 blodely. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYBox : NSObject

@property (nonatomic, strong) NSString *path;

- (NSArray *)files;

- (NSUInteger)numberOfFiles;

@end
