//
//  ModelColorWrapper.mm
//  AMFWrapped
//
//  Created by Ron Aldrich on 8/5/23.
//

#import "ModelColorWrapper.h"
#import "ModelColorWrapper+.h"

#import "ModelNodeWrapper+.h"
//#import "Model<#Thing#>Wrapper+.h"

#include "ModelColor.hpp"

using namespace AMFCore;

@implementation ModelColorWrapper

+ (void) initialize
{
    ModelColor::initialize();
}

- (id) initWithModelColorPtr: (AMFCore::ModelColorPtr) modelColorPtr
{
    return [super initWithModelElementPtr: modelColorPtr];
}

- (ModelColorPtr) modelColorPtr
{
    return std::dynamic_pointer_cast<ModelColor>(self.modelNodePtr);
}

- (simd_double4) color
{
    auto valueAsColor = self.modelColorPtr->valueAsColor();
    
    return simd_make_double4(valueAsColor.r(), valueAsColor.g(), valueAsColor.b(), valueAsColor.a());
}

@end
