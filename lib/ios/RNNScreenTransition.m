#import "RNNScreenTransition.h"

@implementation RNNScreenTransition

- (instancetype)initWithDict:(NSDictionary *)dict {
	self = [super init];

	self.hasTopBar = [dict objectForKey: @"topBar"] != nil;
	self.hasContent = [dict objectForKey: @"content"] != nil;
	self.hasBottomTabs = [dict objectForKey: @"bottomTabs"] != nil;
	
	self.topBar = [[RNNTransitionStateHolder alloc] initWithDict: dict[@"topBar"]];
	self.content = [[RNNTransitionStateHolder alloc] initWithDict: dict[@"content"]];
	self.bottomTabs = [[RNNTransitionStateHolder alloc] initWithDict: dict[@"bottomTabs"]];
	
	self.enable = [BoolParser parse:dict key:@"enabled"];
	self.waitForRender = [BoolParser parse:dict key:@"waitForRender"];

	return self;
}

- (BOOL)hasCustomAnimation {
	return (self.hasTopBar || self.hasContent || self.hasBottomTabs);
}

@end
