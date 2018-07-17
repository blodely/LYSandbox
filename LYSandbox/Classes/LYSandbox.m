//
//  LYSandbox.m
//  LYSandbox
//
//  Created by Luo Yu(blodely, blodely@gmail.com) on 2018-07-17.
//  Copyright (c) 2018 blodely. All rights reserved.
//

#import "LYSandbox.h"
#import <FCFileManager/FCFileManager.h>


@interface LYSandbox () {}
@end

@implementation LYSandbox

// MARK: - INIT

+ (instancetype)box {
	static LYSandbox *sharedBox;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedBox = [[LYSandbox alloc] init];
	});
	return sharedBox;
}

- (instancetype)init {
	if (self = [super init]) {
		
	}
	return self;
}

// MARK: -

@end
