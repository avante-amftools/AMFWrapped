//
//  ModelUnitWrapper.mm
//  AMFWrapped
//
//  Created by Ron Aldrich on 8/16/23.
//

#import "ModelUnitWrapper.h"
#import "ModelUnitWrapper+.h"

#import "ModelNodeWrapper+.h"
#import "ModelAttributeWrapper+.h"

#include "ModelUnit.hpp"

using namespace AMFCore;

@implementation ModelUnitWrapper

+ (void) initialize
{
    ModelUnit::initialize();
}

- (id) initWithModelUnitPtr: (AMFCore::ModelUnitPtr) modelUnitPtr
{
    return [super initWithModelAttributePtr: modelUnitPtr];
}

- (ModelUnitPtr) ModelUnitPtr
{
    return std::dynamic_pointer_cast<ModelUnit>(self.modelNodePtr);
}

@end
