//
//  ModelNodeWrapper.mm
//  AMFWrapped
//
//  Created by Ron Aldrich on 2/28/23.
//

#import "ModelNodeWrapper.h"
#import "ModelNodeWrapper+.h"

#include "ModelNode.hpp"

#include <vector>

using namespace AMFCore;

@implementation ModelNodeWrapper

+ (void) initialize
{
    ModelNode::initialize();
}

- (id) initWithModelNodePtr: (AMFCore::ModelNodePtr) modelNodePtr
{
    if (self = [super init])
    {
        self.modelNodePtr = modelNodePtr;
    }
    
    return self;
}

- (NSString*) identifier
{
    return [NSString stringWithUTF8String: _modelNodePtr->identifier().c_str()];
}

- (void) debugShow
{
    [self debugShow: @""];
}

- (void) debugShow: (NSString*) indent
{
    _modelNodePtr->debugShow(indent.UTF8String);
}


@end
