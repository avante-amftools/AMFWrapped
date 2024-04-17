//
//  ModelRootWrapper.mm
//  AMFWrapped
//
//  Created by Ron Aldrich on 2/28/23.
//

#import "ModelRootWrapper.h"
#import "ModelRootWrapper+.h"

#import "ModelNodeWrapper+.h"
#import "ModelUnitWrapper+.h"
#import "ModelColorWrapper+.h"
#import "ModelObjectWrapper+.h"

#include "ModelRoot.hpp"

using namespace AMFCore;

@implementation ModelRootWrapper

+ (void) initialize
{
    ModelRoot::initialize();
}

- (id) initWithModelRootPtr: (AMFCore::ModelRootPtr) modelRootPtr
{
    return [super initWithModelElementPtr: modelRootPtr];
}

- (ModelRootPtr) modelRootPtr
{
    auto modelNodePtr = self.modelNodePtr;
    
    auto modelRootPtr = std::dynamic_pointer_cast<ModelRoot>(modelNodePtr);
    
    assert(modelRootPtr != nullptr);
    
    return modelRootPtr;
}

- (bool) compressed
{
    return self.modelRootPtr->compressed();
}

- (void) setCompressed: (bool) compressed
{
    self.modelRootPtr->setCompressed(compressed);
}

- (ModelUnitWrapper*) unitNode
{
    ModelUnitWrapper* result = nil;
    
    auto modelUnit = self.modelRootPtr->modelUnit();
    
    if (modelUnit)
    {
        result = [[ModelUnitWrapper alloc] initWithModelUnitPtr: modelUnit];
    }
    
    return result;
}

- (ModelColorWrapper*) colorNode
{
    auto modelColor = self.modelRootPtr->modelColor();
    
    ModelColorWrapper* result = [[ModelColorWrapper alloc] initWithModelColorPtr: modelColor];
    
    return result;
}

- (NSArray<ModelObjectWrapper*>*) objectNodes
{
    NSMutableArray<ModelObjectWrapper*>* result = [[NSMutableArray<ModelObjectWrapper*> alloc] init];
    
    auto objects = self.modelRootPtr->modelObjects();
    
    for (auto i = objects.begin(); i != objects.end(); i++)
    {
        ModelObjectWrapper* object = [[ModelObjectWrapper alloc] initWithModelObjectPtr: *i];
        
        [result addObject: object];
    }
    
    return result;
}

- (NSArray<ModelElementWrapper*>*) materialNodes
{
    NSMutableArray<ModelElementWrapper*>* result = [[NSMutableArray<ModelElementWrapper*> alloc] init];
    
    auto materials = self.modelRootPtr->modelMaterials();
    
    for (auto i = materials.begin(); i != materials.end(); i++)
    {
        ModelElementWrapper* material = [[ModelElementWrapper alloc] initWithModelElementPtr: *i];
        
        [result addObject: material];
    }
    
    return result;
}

- (NSArray<ModelElementWrapper*>*) constellationNodes
{
    NSMutableArray<ModelElementWrapper*>* result = [[NSMutableArray<ModelElementWrapper*> alloc] init];
    
    auto constellations = self.modelRootPtr->modelConstellations();
    
    for (auto i = constellations.begin(); i != constellations.end(); i++)
    {
        ModelElementWrapper* constellation = [[ModelElementWrapper alloc] initWithModelElementPtr: *i];
        
        [result addObject: constellation];
    }
    
    return result;
}

- (NSArray<ModelNodeWrapper*>*) detailNodes
{
    NSMutableArray<ModelNodeWrapper*>* result = [[NSMutableArray<ModelNodeWrapper*> alloc] init];
    
    
    auto unitNode = self.unitNode;
    
    if (unitNode)
    {
        [result addObject: unitNode];
    }
    
    [result addObjectsFromArray: super.detailNodes];
    
    return result;
}

@end
