#import "ModelList.h"

@implementation ModelList
{
    NSMutableArray *itemList;
    NSDictionary *sampleList;
}

-(instancetype)init
{
    if ( self )
    {
        itemList = [NSMutableArray array];
        
        sampleList = @{ @"apple":  @{ @"description":@"青森産とか長野県産とかあるね。", @"img":@"apple.png" },
                        @"orange": @{ @"description":@"地中海性気候で出荷される",      @"img":@"orange.png"},
                        @"lemon":  @{ @"description":@"かぼすじゃねー",              @"img":@"lemon.png"},
                        @"melon":  @{ @"description":@"入院した時の手土産といえばこれ", @"img":@"melon.png"},
                        @"banana": @{ @"description":@"そんなバナナ",                @"img":@"banana.png"} };
        
        int i = 0;
        for ( NSString *item in sampleList )
        {
            ModelDetail *modelDetail         = [[ModelDetail alloc] init];
            modelDetail.detailTtitle         = sampleList.allKeys[ i ];
            modelDetail.detailDescription    = sampleList[ item ][ @"description" ];
            modelDetail.detailCreateDatetime = [NSDate date];
            modelDetail.detailImage          = sampleList[ item ][ @"img" ];
            i++;
            [itemList addObject:modelDetail];
        }
    }
    return self;
}

- (NSArray *)addItem
{
    int i                            = (int)[itemList count] % [sampleList count];
    ModelDetail *modelDetail         = [[ModelDetail alloc] init];
    modelDetail.detailTtitle         = sampleList.allKeys[ i ];
    modelDetail.detailDescription    = sampleList[ sampleList.allKeys[ i ] ][ @"description" ];
    modelDetail.detailCreateDatetime = [NSDate date];
    modelDetail.detailImage          = sampleList[ sampleList.allKeys[ i ] ][ @"img" ];
    
    [itemList addObject:modelDetail];
    
    return itemList;
}

- (NSArray *)delItem:(int)item_no
{
    [itemList removeObjectAtIndex:item_no];
    return itemList;
}


- (NSArray *)getList
{
    return itemList;
}

- (ModelDetail *)getItem:(int)item_no
{
    return itemList[ item_no ];
}

- (int)getNextItemPos:(int)item_no
{
    if ( [itemList count] <= item_no + 1 )
    {
        return 0;
    }
    return item_no + 1;
}

- (int)getPrevItemPos:(int)item_no
{
    if ( 0 > item_no - 1 )
    {
        return [itemList count] -1;
    }
    return item_no -1;
}


@end
