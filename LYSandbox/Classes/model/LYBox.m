//
//  LYBox.m
//  LYSandbox
//
//  Created by Luo Yu(blodely, blodely@gmail.com) on 2018-07-17.
//  Copyright (c) 2018 blodely. All rights reserved.
//

#import "LYBox.h"
#import <FCFileManager/FCFileManager.h>


@implementation LYBox

- (instancetype)init {
	if (self = [super init]) {
		_path = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@", NSStringFromClass([self class])];
	}
	return self;
}

- (NSArray *)files {
	
	if ([FCFileManager isDirectoryItemAtPath:_path] == NO) {
		return nil;
	}
	
	return [[FCFileManager listFilesInDirectoryAtPath:_path] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
}

- (NSUInteger)numberOfFiles {
	return [[self files] count];
}

@end
