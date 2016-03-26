//
//  MyTableViewController.m
//  MyTableView
//

#import "MyTableViewController.h"
#import "sqlite3.h"

static int MyCallback(void *context, int count, char **values, char **columns)
{
    NSMutableArray *names = (NSMutableArray *)context;
    for (int i=0; i < count; i++) {
        const char *nameCString = values[i];
        [names addObject:[NSString stringWithUTF8String:nameCString]];
    }
    return SQLITE_OK;
}

@implementation MyTableViewController

- (void)loadNamesFromDatabase
{
    NSString *file = [[NSBundle mainBundle] pathForResource:@"names3" ofType:@"db"];
    sqlite3 *database = NULL;
    if (sqlite3_open([file UTF8String], &database) == SQLITE_OK) {
        sqlite3_exec(database, "select name from person", MyCallback, names, NULL);
    }
    sqlite3_close(database);
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        names = [[NSMutableArray alloc] init];
        [self loadNamesFromDatabase];
    }
    return self;
}

- (void)dealloc
{
    [names release];
    
    [super dealloc];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [names count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:nil] autorelease];
    
    cell.textLabel.text = [names objectAtIndex:indexPath.row];
    
    return cell;
}

@end
