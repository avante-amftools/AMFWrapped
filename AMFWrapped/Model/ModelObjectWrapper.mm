//
//  ModelObjectWrapper.mm
//  AMFWrapped
//
//  Created by Ron Aldrich on 2/28/23.
//

#import "ModelObjectWrapper.h"
#import "ModelObjectWrapper+.h"

#import "ModelNodeWrapper+.h"
#import "ModelMeshWrapper+.h"

#include "ModelObject.hpp"

using namespace AMFCore;

@implementation ModelObjectWrapper

+ (void) initialize
{
    ModelObject::initialize();
}

- (id) initWithModelObjectPtr: (AMFCore::ModelObjectPtr) modelObjectPtr
{
    if (self = [super initWithModelElementPtr: modelObjectPtr])
    {
    }
    
    return self;
}

- (ModelObjectPtr) modelObjectPtr
{
    return std::dynamic_pointer_cast<ModelObject>(self.modelNodePtr);
}

- (ModelMeshWrapper*) meshNode
{
    auto mesh = self.modelObjectPtr->modelMesh();
    
    return [[ModelMeshWrapper alloc] initWithModelMeshPtr: mesh];
}

- (ModelMaterialWrapper*) materialNode
{
#if 0
    auto material = self.modelObjectPtr->modelMaterial();
    
    return [[ModelMaterialWrapper alloc] initWithModelMaterialPtr: material];
#else
    return NULL;
#endif
}

@end
