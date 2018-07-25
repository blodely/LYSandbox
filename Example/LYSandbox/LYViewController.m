//
//  LYViewController.m
//  LYSandbox
//
//  Created by Luo Yu(blodely, blodely@gmail.com) on 07/17/2018.
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

#import "LYViewController.h"
#import <LYSandbox/LYSandbox.h>

@interface LYViewController () <UITableViewDelegate, UITableViewDataSource> {
	
	__weak IBOutlet UIButton *btnRefresh;
	__weak IBOutlet UITableView *tbBox;
	__weak IBOutlet UITableView *tbCat;
	
	NSString *DataCellIdentifier;
	
	NSMutableArray *dsBox;
	NSMutableArray *dsCat;
}

@end

@implementation LYViewController

// MARK: - ACTION

- (IBAction)refreshButtonPressed:(id)sender {

	[dsBox removeAllObjects];
	
	[dsBox addObjectsFromArray:[[LYSandbox sandbox] boxes]];
	
	[tbBox reloadData];
}

- (IBAction)refreshCatsButtonPressed:(UIButton *)sender {
	
	[dsCat removeAllObjects];
	
	[dsCat addObjectsFromArray:[[LYSandbox sandbox] catsInBox:nil]];
	
	[tbCat reloadData];
}

// MARK: - INIT

- (instancetype)init {
	if (self = [super initWithNibName:@"LYViewController" bundle:[NSBundle mainBundle]]) {
		
		DataCellIdentifier = @"ly.demo.data.cell.identifier";
		
		dsBox = [NSMutableArray arrayWithCapacity:1];
		dsCat = [NSMutableArray arrayWithCapacity:1];
	}
	return self;
}

// MARK: VIEW LIFE CYCLE

- (void)loadView {
	[super loadView];
	
	[tbBox registerClass:[UITableViewCell class] forCellReuseIdentifier:DataCellIdentifier];
	[tbCat registerClass:[UITableViewCell class] forCellReuseIdentifier:DataCellIdentifier];
	
	tbBox.tableHeaderView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// DO ANY ADDITIONAL SETUP AFTER LOADING THE VIEW, TYPICALLY FROM A NIB.
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// DISPOSE OF ANY RESOURCES THAT CAN BE RECREATED.
}

// MARK: - DELEGATE

// MARK: UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)idp {
	[tableView deselectRowAtIndexPath:idp animated:YES];
	
	if (tableView == tbBox) {
		
		__weak LYBox *box = dsBox[idp.row];
		
		[dsCat removeAllObjects];
		[dsCat addObjectsFromArray:[[LYSandbox sandbox] catsInBox:box]];
		[tbCat reloadData];
		
	} else if (tableView == tbCat) {
		
		__weak LYCat *cat = dsCat[idp.row];
		NSLog(@"%@", cat);
	}
}

// MARK: UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	NSInteger rows = 0;
	
	if (tableView == tbBox) {
		rows = MAX([dsBox count], 0);
	} else if (tableView == tbCat) {
		rows = MAX([dsCat count], 0);
	}
	
	return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)idp {
	
	if (tableView == tbBox) {
		
		__weak LYBox *box = dsBox[idp.row];
		
		UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DataCellIdentifier forIndexPath:idp];
		
		cell.textLabel.text = box.name;
		cell.detailTextLabel.text = box.path;
		
		return cell;
		
	} else if (tableView == tbCat) {
		
		__weak LYCat *cat = dsCat[idp.row];
		
		UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DataCellIdentifier forIndexPath:idp];
		
		cell.textLabel.text = cat.name;
		cell.detailTextLabel.text = cat.path;
		
		return cell;
	}
	
	return nil;
}

@end
