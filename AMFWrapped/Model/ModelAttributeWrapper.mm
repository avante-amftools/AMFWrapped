//
//  ModelAttributeWrapper.mm
//  AMFWrapped
//
//  Created by Ron Aldrich on 4/12/23.
//

#import "ModelAttributeWrapper.h"
#import "ModelAttributeWrapper+.h"

#import "ModelNodeWrapper+.h"
//#import "Model<#Thing#>Wrapper+.h"

#include "ModelAttribute.hpp"

using namespace AMFCore;

@implementation ModelAttributeWrapper

+ (void) initialize
{
    ModelAttribute::initialize();
}

- (id) initWithModelAttributePtr: (AMFCore::ModelAttributePtr) modelAttributePtr
{
    return [super initWithModelNodePtr: modelAttributePtr];
}

- (ModelAttributePtr) modelAttributePtr
{
    return std::dynamic_pointer_cast<ModelAttribute>(self.modelNodePtr);
}

- (NSString*) value
{
    return [NSString stringWithUTF8String: self.modelAttributePtr->valueAsString().c_str()];
}

- (void) setValue: (NSString*) value
{
    self.modelAttributePtr->setValueAsString(value.UTF8String);
}

@end
