#import <Foundation/Foundation.h>

void PrintURLInfo()
{
	NSURL *stanfordURL = [NSURL URLWithString:@"http://www.stanford.edu:3000/gateways/students.html"];
	NSLog([NSString stringWithFormat:@"Host: '%@' Port: '%@'", [stanfordURL host], [stanfordURL port]]);
}

void PrintTimeInfo()
{
	NSMutableDictionary *dict = [NSMutableDictionary dictionary];
	[dict setValue:[NSDate date] forKey:@"now"];
	[dict setValue:[NSDate dateWithTimeIntervalSinceNow:-60] forKey:@"1 minutes ago"];
	[dict setValue:[NSDate dateWithTimeIntervalSinceNow:60 * 30] forKey:@"30 minutes from now"];
	[dict setValue:[NSDate dateWithTimeIntervalSinceNow:-60 * 60 * 24] forKey:@"24 hours ago"];
	[dict setValue:[NSDate dateWithTimeIntervalSinceNow:-7 * 60 * 60 * 24] forKey:@"a week ago today"];
	[dict setValue:[NSDate dateWithTimeIntervalSinceNow:365 * 60 * 60 * 24] forKey:@"a year from now"];
	
	for (NSString *key in dict)
	{
		NSDate *date = [dict objectForKey:key];
		NSLog([NSString stringWithFormat:@"Key: '%@' Date: '%@'", key, date]);
	}
}

int main (int argc, const char * argv[]) {
    NSAutoreleasepool *pool = [[NSAutoreleasePool alloc] init];
	
	PrintURLInfo();
	NSLog(@"================================");
	PrintTimeInfo();
	
    [pool drain];
    return 0;
}
