//
//  LYCat.m
//  LYSandbox
//
//  Created by Luo Yu(blodely, blodely@gmail.com) on 2018-07-17.
//  Copyright (c) 2018 blodely <blodely@gmail.com>. All rights reserved.
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy
//	of this software and associated documentation files (the "Software"), to deal
//	in the Software without restriction, including without limitation the rights
//	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//	copies of the Software, and to permit persons to whom the Software is
//	furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in
//	all copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//	THE SOFTWARE.
//

#import "LYCat.h"

@implementation LYCat

// MARK: - INIT

- (instancetype)initWithPath:(NSString *)filepath {
	if (self = [super init]) {
		_path = filepath;
		_name = [_path lastPathComponent];
		_filetype = [[_name componentsSeparatedByString:@"."] lastObject];
	}
	return self;
}

// MARK: - PROPERTIES

- (UIImage *)thumbnail {
	return nil;
}

// MARK: - OVERRIDE

- (NSString *)description {
	NSMutableString *desc = [[NSMutableString alloc] initWithCapacity:1];
	[desc appendFormat:@"\nLYCat\n"];
	[desc appendFormat:@"\tName\t%@\n", _name];
	[desc appendFormat:@"\tPath\t%@\n", _path];
	[desc appendFormat:@"\tFiletype\t%@\n", _filetype];
	return desc;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
	self = [super init];
	if (self) {
		_name = [coder decodeObjectForKey:@"_name"];
		_path = [coder decodeObjectForKey:@"_path"];
		_filetype = [coder decodeObjectForKey:@"_filetype"];
		self.thumbnail = [coder decodeObjectForKey:@"self.thumbnail"];
	}

	return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeObject:self.name forKey:@"_name"];
	[coder encodeObject:self.path forKey:@"_path"];
	[coder encodeObject:self.filetype forKey:@"_filetype"];
	[coder encodeObject:self.thumbnail forKey:@"self.thumbnail"];
}

- (id)copyWithZone:(nullable NSZone *)zone {
	LYCat *copy = (LYCat *)[[[self class] allocWithZone:zone] init];

	if (copy != nil) {
		copy->_name = _name;
		copy->_path = _path;
		copy->_filetype = _filetype;
		copy.thumbnail = self.thumbnail;
	}

	return copy;
}


@end
