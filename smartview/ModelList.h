#import <Foundation/Foundation.h>
#import "ModelDetail.h"


@interface ModelList : NSObject

- (NSArray *)getList;
- (NSArray *)addItem;
- (NSArray *)delItem:(int)item_no;

- (ModelDetail *)getItem:(int)item_no;

- (int)getNextItemPos:(int)item_no;
- (int)getPrevItemPos:(int)item_no;

@end